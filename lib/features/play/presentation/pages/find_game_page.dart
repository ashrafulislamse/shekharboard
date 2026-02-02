import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/game_header.dart';
import '../widgets/game_completion_screen.dart';

/// Find Game - Find the matching item from the grid
/// Blueprint Screen #37
class FindGamePage extends StatefulWidget {
  const FindGamePage({super.key});

  @override
  State<FindGamePage> createState() => _FindGamePageState();
}

class _FindGamePageState extends State<FindGamePage>
    with TickerProviderStateMixin {
  // Game state
  int _currentRound = 1;
  static const int _totalRounds = 5;
  int _score = 0;
  bool _isGameComplete = false;
  Set<int> _foundIndices = {};
  bool _showingResult = false;

  // Current question
  late _FindQuestion _currentQuestion;
  final Random _random = Random();

  // Animation
  late AnimationController _bounceController;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _generateQuestion();
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  void _generateQuestion() {
    final shuffled = List<_FindItem>.from(_findItems)..shuffle(_random);
    final target = shuffled[0];

    // Create grid with target appearing 2-3 times
    final targetCount = _random.nextInt(2) + 2; // 2 or 3 times
    final List<_GridCell> grid = [];

    // Add target items
    for (int i = 0; i < targetCount; i++) {
      grid.add(_GridCell(item: target, isTarget: true));
    }

    // Fill remaining with other items
    int otherIndex = 1;
    while (grid.length < 9) {
      if (otherIndex < shuffled.length && shuffled[otherIndex].id != target.id) {
        grid.add(_GridCell(item: shuffled[otherIndex], isTarget: false));
      }
      otherIndex++;
      if (otherIndex >= shuffled.length) otherIndex = 1;
    }

    grid.shuffle(_random);

    _currentQuestion = _FindQuestion(
      target: target,
      grid: grid,
      targetCount: targetCount,
    );
    _foundIndices = {};
    _showingResult = false;
  }

  void _onCellTapped(int index) {
    if (_showingResult) return;
    if (_foundIndices.contains(index)) return;

    final cell = _currentQuestion.grid[index];

    if (cell.isTarget) {
      HapticFeedback.mediumImpact();
      setState(() {
        _foundIndices.add(index);
      });

      // Check if all targets found
      if (_foundIndices.length == _currentQuestion.targetCount) {
        _score++;
        _showingResult = true;
        _bounceController.forward().then((_) {
          Future.delayed(const Duration(milliseconds: 800), _proceedToNext);
        });
      }
    } else {
      HapticFeedback.heavyImpact();
      // Show brief shake/feedback for wrong tap
      _bounceController.forward(from: 0).then((_) => _bounceController.reverse());
    }
  }

  void _proceedToNext() {
    if (_currentRound >= _totalRounds) {
      setState(() {
        _isGameComplete = true;
      });
    } else {
      setState(() {
        _currentRound++;
        _generateQuestion();
      });
    }
  }

  void _resetGame() {
    setState(() {
      _currentRound = 1;
      _score = 0;
      _isGameComplete = false;
      _generateQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isGameComplete) {
      return GameCompletionScreen(
        score: _score,
        totalQuestions: _totalRounds,
        gameTitleBn: 'খুঁজে বের কর',
        onPlayAgain: _resetGame,
        onBackToGames: () => context.pop(),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.warmCream,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            GameHeader(
              titleBn: 'খুঁজে বের কর',
              subtitleBn: 'সব ${_currentQuestion.target.nameBn} খোঁজো',
              currentRound: _currentRound,
              totalRounds: _totalRounds,
              accentColor: const Color(0xFFFF9800),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),

                    // Target display
                    _buildTargetCard(),

                    SizedBox(height: 16.h),

                    // Progress indicator
                    _buildProgressIndicator(),

                    SizedBox(height: 24.h),

                    // Grid
                    _buildGameGrid(),

                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTargetCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF9800).withValues(alpha: 0.2),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
              color: const Color(0xFFFF9800).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Center(
              child: Text(
                _currentQuestion.target.emoji,
                style: TextStyle(fontSize: 40.sp),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'খোঁজো:',
                style: TextStyle(
                  fontFamily: 'NotoSansBengali',
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                _currentQuestion.target.nameBn,
                style: TextStyle(
                  fontFamily: 'NotoSansBengali',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMain,
                ),
              ),
            ],
          ),
          SizedBox(width: 16.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: const Color(0xFFFF9800),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              '×${_currentQuestion.targetCount}',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'পাওয়া গেছে: ',
          style: TextStyle(
            fontFamily: 'NotoSansBengali',
            fontSize: 16.sp,
            color: AppColors.textSecondary,
          ),
        ),
        ...List.generate(_currentQuestion.targetCount, (index) {
          final found = index < _foundIndices.length;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 28.w,
              height: 28.w,
              decoration: BoxDecoration(
                color: found
                    ? const Color(0xFF4CAF50)
                    : Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: found
                  ? Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 18.sp,
                    )
                  : null,
            ),
          );
        }),
      ],
    );
  }

  Widget _buildGameGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.w,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        final cell = _currentQuestion.grid[index];
        final isFound = _foundIndices.contains(index);

        return GestureDetector(
          onTap: () => _onCellTapped(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isFound
                  ? const Color(0xFF4CAF50).withValues(alpha: 0.15)
                  : Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: isFound
                    ? const Color(0xFF4CAF50)
                    : Colors.transparent,
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isFound ? 0.5 : 1.0,
                  child: Text(
                    cell.item.emoji,
                    style: TextStyle(fontSize: 44.sp),
                  ),
                ),
                if (isFound)
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF50),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 28.sp,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ============ DATA ============

class _FindQuestion {
  final _FindItem target;
  final List<_GridCell> grid;
  final int targetCount;

  _FindQuestion({
    required this.target,
    required this.grid,
    required this.targetCount,
  });
}

class _GridCell {
  final _FindItem item;
  final bool isTarget;

  _GridCell({required this.item, required this.isTarget});
}

class _FindItem {
  final String id;
  final String emoji;
  final String nameBn;

  const _FindItem({
    required this.id,
    required this.emoji,
    required this.nameBn,
  });
}

const List<_FindItem> _findItems = [
  _FindItem(id: '1', emoji: '🐄', nameBn: 'গরু'),
  _FindItem(id: '2', emoji: '🐱', nameBn: 'বিড়াল'),
  _FindItem(id: '3', emoji: '🐕', nameBn: 'কুকুর'),
  _FindItem(id: '4', emoji: '🐘', nameBn: 'হাতি'),
  _FindItem(id: '5', emoji: '🦁', nameBn: 'সিংহ'),
  _FindItem(id: '6', emoji: '🐟', nameBn: 'মাছ'),
  _FindItem(id: '7', emoji: '🦆', nameBn: 'হাঁস'),
  _FindItem(id: '8', emoji: '🐔', nameBn: 'মুরগি'),
  _FindItem(id: '9', emoji: '🥭', nameBn: 'আম'),
  _FindItem(id: '10', emoji: '🍌', nameBn: 'কলা'),
  _FindItem(id: '11', emoji: '🍎', nameBn: 'আপেল'),
  _FindItem(id: '12', emoji: '🍊', nameBn: 'কমলা'),
];
