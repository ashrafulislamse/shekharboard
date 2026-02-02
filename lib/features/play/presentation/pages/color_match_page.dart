import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/game_header.dart';
import '../widgets/game_completion_screen.dart';

/// Color Match Game - Match items with their correct colors
/// Blueprint Screen #36
class ColorMatchPage extends StatefulWidget {
  const ColorMatchPage({super.key});

  @override
  State<ColorMatchPage> createState() => _ColorMatchPageState();
}

class _ColorMatchPageState extends State<ColorMatchPage>
    with SingleTickerProviderStateMixin {
  // Game state
  int _currentRound = 1;
  static const int _totalRounds = 5;
  int _score = 0;
  bool _isGameComplete = false;
  Color? _selectedColor;
  bool? _isCorrect;

  // Current question
  late _ColorQuestion _currentQuestion;
  final Random _random = Random();

  // Animation
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _generateQuestion();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _generateQuestion() {
    final shuffled = List<_ColorItem>.from(_colorItems)..shuffle(_random);
    final item = shuffled[0];

    // Get 4 unique colors including correct one
    final colorOptions = <Color>{item.color};
    final availableColors = _allColors.where((c) => c != item.color).toList()..shuffle(_random);
    while (colorOptions.length < 4 && availableColors.isNotEmpty) {
      colorOptions.add(availableColors.removeLast());
    }
    final shuffledColors = colorOptions.toList()..shuffle(_random);

    _currentQuestion = _ColorQuestion(
      item: item,
      colorOptions: shuffledColors,
    );
    _selectedColor = null;
    _isCorrect = null;
  }

  void _onColorSelected(Color color) {
    if (_selectedColor != null) return;

    final correct = color == _currentQuestion.item.color;
    setState(() {
      _selectedColor = color;
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
        gameTitleBn: 'রঙ চিনো',
        onPlayAgain: _resetGame,
        onBackToGames: () => context.pop(),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.warmCream,
      body: SafeArea(
        child: LayoutBuilder(
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
                        titleBn: 'রঙ চিনো',
                        subtitleBn: 'সঠিক রঙ বেছে নাও',
                        currentRound: _currentRound,
                        totalRounds: _totalRounds,
                        accentColor: const Color(0xFFE91E63),
                      ),

                      SizedBox(height: 24.h),

                      // Question
                      Text(
                        '${_currentQuestion.item.nameBn} কোন রঙের?',
                        style: TextStyle(
                          fontFamily: 'NotoSansBengali',
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textMain,
                        ),
                      ),

                      SizedBox(height: 32.h),

                      // Item display (grayscale)
                      _buildItemDisplay(),

                      SizedBox(height: 40.h),

                      // Color palette
                      _buildColorPalette(),

                      SizedBox(height: 40.h),

                      // Result feedback
                      if (_selectedColor != null)
                        _buildResultFeedback(),

                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildItemDisplay() {
    return Container(
      width: 180.w,
      height: 180.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE91E63).withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background with subtle pattern
          Container(
            margin: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),

          // Item (shown in selected color if selected, otherwise grayscale)
          if (_selectedColor != null)
            Text(
              _currentQuestion.item.emoji,
              style: TextStyle(fontSize: 80.sp),
            )
          else
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.saturation,
              ),
              child: Text(
                _currentQuestion.item.emoji,
                style: TextStyle(fontSize: 80.sp),
              ),
            ),

          // Question mark overlay (only when not selected)
          if (_selectedColor == null)
            Positioned(
              bottom: 12.w,
              right: 12.w,
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFE91E63),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFE91E63).withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.palette_rounded,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildColorPalette() {
    return Column(
      children: [
        Text(
          'রঙ বেছে নাও',
          style: TextStyle(
            fontFamily: 'NotoSansBengali',
            fontSize: 16.sp,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 16.h),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 12.w,
          runSpacing: 12.h,
          children: _currentQuestion.colorOptions.map((color) {
            final isSelected = _selectedColor == color;
            final isCorrect = color == _currentQuestion.item.color;
            final showCorrect = _selectedColor != null && isCorrect;
            final showWrong = isSelected && !_isCorrect!;

            return GestureDetector(
              onTap: () => _onColorSelected(color),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 65.w,
                height: 65.w,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: showCorrect
                        ? const Color(0xFF4CAF50)
                        : showWrong
                            ? const Color(0xFFF44336)
                            : Colors.white,
                    width: showCorrect || showWrong ? 4 : 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: 0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: showCorrect || showWrong
                    ? Center(
                        child: Icon(
                          showCorrect
                              ? Icons.check_rounded
                              : Icons.close_rounded,
                          color: Colors.white,
                          size: 32.sp,
                        ),
                      )
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildResultFeedback() {
    final colorName = _getColorName(_currentQuestion.item.color);

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
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: _currentQuestion.item.color,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            _isCorrect!
                ? 'সঠিক! $colorName রঙ!'
                : 'উত্তর: $colorName',
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

  String _getColorName(Color color) {
    final colorNames = {
      const Color(0xFFFF0000): 'লাল',
      const Color(0xFFFF9800): 'কমলা',
      const Color(0xFFFFEB3B): 'হলুদ',
      const Color(0xFF4CAF50): 'সবুজ',
      const Color(0xFF2196F3): 'নীল',
      const Color(0xFF9C27B0): 'বেগুনি',
      const Color(0xFFE91E63): 'গোলাপি',
      const Color(0xFF795548): 'বাদামি',
      const Color(0xFF000000): 'কালো',
      const Color(0xFFFFFFFF): 'সাদা',
    };
    return colorNames[color] ?? 'অজানা';
  }
}

// ============ DATA ============

class _ColorQuestion {
  final _ColorItem item;
  final List<Color> colorOptions;

  _ColorQuestion({
    required this.item,
    required this.colorOptions,
  });
}

class _ColorItem {
  final String id;
  final String emoji;
  final String nameBn;
  final Color color;

  const _ColorItem({
    required this.id,
    required this.emoji,
    required this.nameBn,
    required this.color,
  });
}

const List<Color> _allColors = [
  Color(0xFFFF0000), // Red
  Color(0xFFFF9800), // Orange
  Color(0xFFFFEB3B), // Yellow
  Color(0xFF4CAF50), // Green
  Color(0xFF2196F3), // Blue
  Color(0xFF9C27B0), // Purple
  Color(0xFFE91E63), // Pink
  Color(0xFF795548), // Brown
];

const List<_ColorItem> _colorItems = [
  _ColorItem(id: '1', emoji: '🍎', nameBn: 'আপেল', color: Color(0xFFFF0000)),
  _ColorItem(id: '2', emoji: '🍌', nameBn: 'কলা', color: Color(0xFFFFEB3B)),
  _ColorItem(id: '3', emoji: '🍊', nameBn: 'কমলা', color: Color(0xFFFF9800)),
  _ColorItem(id: '4', emoji: '🥬', nameBn: 'শাক', color: Color(0xFF4CAF50)),
  _ColorItem(id: '5', emoji: '🫐', nameBn: 'ব্লুবেরি', color: Color(0xFF2196F3)),
  _ColorItem(id: '6', emoji: '🍇', nameBn: 'আঙুর', color: Color(0xFF9C27B0)),
  _ColorItem(id: '7', emoji: '🌸', nameBn: 'ফুল', color: Color(0xFFE91E63)),
  _ColorItem(id: '8', emoji: '🥥', nameBn: 'নারকেল', color: Color(0xFF795548)),
  _ColorItem(id: '9', emoji: '🍅', nameBn: 'টমেটো', color: Color(0xFFFF0000)),
  _ColorItem(id: '10', emoji: '🥭', nameBn: 'আম', color: Color(0xFFFFEB3B)),
];
