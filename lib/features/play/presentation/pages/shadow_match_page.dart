import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/game_header.dart';
import '../widgets/game_result_overlay.dart';
import '../widgets/game_completion_screen.dart';

/// Shadow Match Game - Match the shadow with the correct image
/// Blueprint Screen #35
class ShadowMatchPage extends StatefulWidget {
  const ShadowMatchPage({super.key});

  @override
  State<ShadowMatchPage> createState() => _ShadowMatchPageState();
}

class _ShadowMatchPageState extends State<ShadowMatchPage>
    with SingleTickerProviderStateMixin {
  // Game state
  int _currentRound = 1;
  static const int _totalRounds = 5;
  int _score = 0;
  bool _showResult = false;
  bool _isCorrect = false;
  bool _isGameComplete = false;

  // Current question
  late _ShadowQuestion _currentQuestion;
  final Random _random = Random();

  // Animation
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _shakeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.elasticIn),
    );
    _generateQuestion();
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void _generateQuestion() {
    final shuffled = List<_GameItem>.from(_gameItems)..shuffle(_random);
    final answer = shuffled[0];
    final options = shuffled.take(3).toList()..shuffle(_random);

    _currentQuestion = _ShadowQuestion(
      answer: answer,
      options: options,
    );
  }

  void _onOptionSelected(_GameItem selected) {
    if (_showResult) return;

    final correct = selected.id == _currentQuestion.answer.id;
    setState(() {
      _isCorrect = correct;
      _showResult = true;
      if (correct) {
        _score++;
        HapticFeedback.mediumImpact();
      } else {
        HapticFeedback.heavyImpact();
        _shakeController.forward(from: 0);
      }
    });

    // Auto proceed after delay
    Future.delayed(Duration(milliseconds: correct ? 1000 : 1500), () {
      if (!mounted) return;
      _proceedToNext();
    });
  }

  void _proceedToNext() {
    if (_currentRound >= _totalRounds) {
      setState(() {
        _isGameComplete = true;
      });
    } else {
      setState(() {
        _currentRound++;
        _showResult = false;
        _generateQuestion();
      });
    }
  }

  void _resetGame() {
    setState(() {
      _currentRound = 1;
      _score = 0;
      _showResult = false;
      _isCorrect = false;
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
        gameTitleBn: 'ছায়া মেলাও',
        onPlayAgain: _resetGame,
        onBackToGames: () => context.pop(),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.warmCream,
      body: SafeArea(
        child: Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                      maxWidth: constraints.maxWidth,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        children: [
                          // Header
                          GameHeader(
                            titleBn: 'ছায়া মেলাও',
                            subtitleBn: 'কোনটি মিলবে?',
                            currentRound: _currentRound,
                            totalRounds: _totalRounds,
                            accentColor: const Color(0xFF9C27B0),
                          ),

                          SizedBox(height: 20.h),

                          // Shadow card
                          _buildShadowCard(),

                          SizedBox(height: 32.h),

                          // Question text
                          Text(
                            'এটা কার ছায়া?',
                            style: TextStyle(
                              fontFamily: 'NotoSansBengali',
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textMain,
                            ),
                          ),

                          SizedBox(height: 32.h),

                          // Options grid
                          _buildOptionsGrid(),

                          SizedBox(height: 32.h),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            // Result overlay
            if (_showResult)
              GameResultOverlay(
                isSuccess: _isCorrect,
                messageBn: _isCorrect ? 'সাবাস! ঠিক হয়েছে!' : 'আবার চেষ্টা করো!',
                messageEn: _isCorrect ? 'Correct!' : 'Try again!',
                onContinue: _isCorrect ? _proceedToNext : null,
                onTryAgain: !_isCorrect
                    ? () {
                        setState(() {
                          _showResult = false;
                        });
                      }
                    : null,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildShadowCard() {
    return AnimatedBuilder(
      animation: _shakeAnimation,
      builder: (context, child) {
        final shake = sin(_shakeAnimation.value * pi * 4) * 10;
        return Transform.translate(
          offset: Offset(shake, 0),
          child: child,
        );
      },
      child: Container(
        width: 180.w,
        height: 180.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF9C27B0).withValues(alpha: 0.15),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background pattern
            Container(
              margin: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF3E5F5),
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),

            // Shadow silhouette (black with slight transparency)
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Color(0xFF2D2D2D),
                BlendMode.srcIn,
              ),
              child: Text(
                _currentQuestion.answer.emoji,
                style: TextStyle(fontSize: 80.sp),
              ),
            ),

            // Question mark badge
            Positioned(
              bottom: 8.w,
              right: 8.w,
              child: Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  color: const Color(0xFF9C27B0),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF9C27B0).withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '?',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionsGrid() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12.w,
      runSpacing: 12.h,
      children: _currentQuestion.options.map((item) {
        final isSelected = _showResult && item.id == _currentQuestion.answer.id;
        final isWrong = _showResult && !_isCorrect && item.id != _currentQuestion.answer.id;

        return GestureDetector(
          onTap: () => _onOptionSelected(item),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 95.w,
            height: 110.h,
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF4CAF50).withValues(alpha: 0.15)
                  : Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF4CAF50)
                    : isWrong
                        ? Colors.grey.shade300
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.emoji,
                  style: TextStyle(fontSize: 44.sp),
                ),
                SizedBox(height: 6.h),
                Text(
                  item.nameBn,
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ============ DATA ============

class _ShadowQuestion {
  final _GameItem answer;
  final List<_GameItem> options;

  _ShadowQuestion({
    required this.answer,
    required this.options,
  });
}

class _GameItem {
  final String id;
  final String emoji;
  final String nameBn;

  const _GameItem({
    required this.id,
    required this.emoji,
    required this.nameBn,
  });
}

const List<_GameItem> _gameItems = [
  _GameItem(id: '1', emoji: '🐄', nameBn: 'গরু'),
  _GameItem(id: '2', emoji: '🐱', nameBn: 'বিড়াল'),
  _GameItem(id: '3', emoji: '🐕', nameBn: 'কুকুর'),
  _GameItem(id: '4', emoji: '🐘', nameBn: 'হাতি'),
  _GameItem(id: '5', emoji: '🦁', nameBn: 'সিংহ'),
  _GameItem(id: '6', emoji: '🐟', nameBn: 'মাছ'),
  _GameItem(id: '7', emoji: '🦆', nameBn: 'হাঁস'),
  _GameItem(id: '8', emoji: '🐔', nameBn: 'মুরগি'),
  _GameItem(id: '9', emoji: '🥭', nameBn: 'আম'),
  _GameItem(id: '10', emoji: '🍌', nameBn: 'কলা'),
  _GameItem(id: '11', emoji: '🍎', nameBn: 'আপেল'),
  _GameItem(id: '12', emoji: '🚗', nameBn: 'গাড়ি'),
  _GameItem(id: '13', emoji: '🚌', nameBn: 'বাস'),
  _GameItem(id: '14', emoji: '✈️', nameBn: 'বিমান'),
  _GameItem(id: '15', emoji: '🚢', nameBn: 'জাহাজ'),
];
