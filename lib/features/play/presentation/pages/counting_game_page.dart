import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/game_header.dart';
import '../widgets/game_completion_screen.dart';

/// Counting Game - Count items and select the correct number
/// Blueprint Screen #39
class CountingGamePage extends StatefulWidget {
  const CountingGamePage({super.key});

  @override
  State<CountingGamePage> createState() => _CountingGamePageState();
}

class _CountingGamePageState extends State<CountingGamePage>
    with TickerProviderStateMixin {
  // Game state
  int _currentRound = 1;
  static const int _totalRounds = 5;
  int _score = 0;
  bool _isGameComplete = false;
  int? _selectedAnswer;
  bool? _isCorrect;

  // Current question
  late _CountQuestion _currentQuestion;
  final Random _random = Random();

  // Animation
  late AnimationController _itemsController;

  @override
  void initState() {
    super.initState();
    _itemsController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _generateQuestion();
    _itemsController.forward();
  }

  @override
  void dispose() {
    _itemsController.dispose();
    super.dispose();
  }

  void _generateQuestion() {
    final shuffled = List<_CountItem>.from(_countItems)..shuffle(_random);
    final item = shuffled[0];
    final count = _random.nextInt(5) + 1; // 1 to 5

    // Generate options (correct + 3 wrong)
    final options = <int>{count};
    while (options.length < 4) {
      int option = _random.nextInt(5) + 1;
      if (option != count) options.add(option);
    }
    final shuffledOptions = options.toList()..shuffle(_random);

    _currentQuestion = _CountQuestion(
      item: item,
      count: count,
      options: shuffledOptions,
    );
    _selectedAnswer = null;
    _isCorrect = null;
  }

  void _onAnswerSelected(int answer) {
    if (_selectedAnswer != null) return;

    final correct = answer == _currentQuestion.count;
    setState(() {
      _selectedAnswer = answer;
      _isCorrect = correct;
      if (correct) {
        _score++;
        HapticFeedback.mediumImpact();
      } else {
        HapticFeedback.heavyImpact();
      }
    });

    Future.delayed(const Duration(milliseconds: 1200), _proceedToNext);
  }

  void _proceedToNext() {
    if (_currentRound >= _totalRounds) {
      setState(() {
        _isGameComplete = true;
      });
    } else {
      _itemsController.reset();
      setState(() {
        _currentRound++;
        _generateQuestion();
      });
      _itemsController.forward();
    }
  }

  void _resetGame() {
    _itemsController.reset();
    setState(() {
      _currentRound = 1;
      _score = 0;
      _isGameComplete = false;
      _generateQuestion();
    });
    _itemsController.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (_isGameComplete) {
      return GameCompletionScreen(
        score: _score,
        totalQuestions: _totalRounds,
        gameTitleBn: 'গণনা শেখো',
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
              titleBn: 'গণনা শেখো',
              subtitleBn: 'কয়টি আছে?',
              currentRound: _currentRound,
              totalRounds: _totalRounds,
              accentColor: const Color(0xFF4CAF50),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),

                    // Question
                    Text(
                      'কয়টি ${_currentQuestion.item.nameBn} আছে?',
                      style: TextStyle(
                        fontFamily: 'NotoSansBengali',
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textMain,
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Items display
                    _buildItemsDisplay(),

                    SizedBox(height: 32.h),

                    // Number options
                    _buildNumberOptions(),

                    const Spacer(),

                    // Result feedback
                    if (_selectedAnswer != null)
                      _buildResultFeedback(),

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsDisplay() {
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4CAF50).withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Center(
        child: Wrap(
          spacing: 16.w,
          runSpacing: 16.w,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: List.generate(_currentQuestion.count, (index) {
            return AnimatedBuilder(
              animation: _itemsController,
              builder: (context, child) {
                final delay = index * 0.15;
                final progress = ((_itemsController.value - delay) / 0.3)
                    .clamp(0.0, 1.0);
                return Transform.scale(
                  scale: Curves.elasticOut.transform(progress),
                  child: child,
                );
              },
              child: Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    _currentQuestion.item.emoji,
                    style: TextStyle(fontSize: 36.sp),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildNumberOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _currentQuestion.options.map((number) {
        final isSelected = _selectedAnswer == number;
        final isCorrectAnswer = number == _currentQuestion.count;
        final showCorrect = _selectedAnswer != null && isCorrectAnswer;
        final showWrong = isSelected && !_isCorrect!;

        return GestureDetector(
          onTap: () => _onAnswerSelected(number),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 70.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: showCorrect
                  ? const Color(0xFF4CAF50).withValues(alpha: 0.2)
                  : showWrong
                      ? const Color(0xFFF44336).withValues(alpha: 0.2)
                      : Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: showCorrect
                    ? const Color(0xFF4CAF50)
                    : showWrong
                        ? const Color(0xFFF44336)
                        : Colors.transparent,
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _toBengaliNumber(number),
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: showCorrect
                        ? const Color(0xFF4CAF50)
                        : showWrong
                            ? const Color(0xFFF44336)
                            : AppColors.textMain,
                  ),
                ),
                Text(
                  '$number',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildResultFeedback() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: _isCorrect!
            ? const Color(0xFF4CAF50).withValues(alpha: 0.15)
            : const Color(0xFFF44336).withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: _isCorrect! ? const Color(0xFF4CAF50) : const Color(0xFFF44336),
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _isCorrect! ? Icons.check_circle_rounded : Icons.cancel_rounded,
            color: _isCorrect! ? const Color(0xFF4CAF50) : const Color(0xFFF44336),
            size: 28.sp,
          ),
          SizedBox(width: 12.w),
          Text(
            _isCorrect!
                ? 'সাবাস! ${_toBengaliNumber(_currentQuestion.count)}টি ঠিক!'
                : 'উত্তর: ${_toBengaliNumber(_currentQuestion.count)}টি',
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: _isCorrect! ? const Color(0xFF4CAF50) : const Color(0xFFF44336),
            ),
          ),
        ],
      ),
    );
  }

  String _toBengaliNumber(int number) {
    const bengaliDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    return number.toString().split('').map((d) => bengaliDigits[int.parse(d)]).join();
  }
}

// ============ DATA ============

class _CountQuestion {
  final _CountItem item;
  final int count;
  final List<int> options;

  _CountQuestion({
    required this.item,
    required this.count,
    required this.options,
  });
}

class _CountItem {
  final String id;
  final String emoji;
  final String nameBn;

  const _CountItem({
    required this.id,
    required this.emoji,
    required this.nameBn,
  });
}

const List<_CountItem> _countItems = [
  _CountItem(id: '1', emoji: '🍎', nameBn: 'আপেল'),
  _CountItem(id: '2', emoji: '🍌', nameBn: 'কলা'),
  _CountItem(id: '3', emoji: '⭐', nameBn: 'তারা'),
  _CountItem(id: '4', emoji: '🐟', nameBn: 'মাছ'),
  _CountItem(id: '5', emoji: '🌸', nameBn: 'ফুল'),
  _CountItem(id: '6', emoji: '🦋', nameBn: 'প্রজাপতি'),
  _CountItem(id: '7', emoji: '❤️', nameBn: 'হৃদয়'),
  _CountItem(id: '8', emoji: '🐦', nameBn: 'পাখি'),
  _CountItem(id: '9', emoji: '🥭', nameBn: 'আম'),
  _CountItem(id: '10', emoji: '🌙', nameBn: 'চাঁদ'),
];
