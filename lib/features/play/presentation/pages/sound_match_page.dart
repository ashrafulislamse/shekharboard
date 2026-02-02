import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/audio_service.dart';
import '../widgets/game_header.dart';
import '../widgets/game_completion_screen.dart';

/// Sound Match Game - Listen and match the correct item
/// Blueprint Screen #40
class SoundMatchPage extends StatefulWidget {
  const SoundMatchPage({super.key});

  @override
  State<SoundMatchPage> createState() => _SoundMatchPageState();
}

class _SoundMatchPageState extends State<SoundMatchPage>
    with TickerProviderStateMixin {
  // Game state
  int _currentRound = 1;
  static const int _totalRounds = 5;
  int _score = 0;
  bool _isGameComplete = false;
  bool _isPlaying = false;
  int? _selectedIndex;
  bool? _lastAnswerCorrect;

  // Audio service
  final AudioService _audioService = AudioService();

  // Current question
  late _SoundQuestion _currentQuestion;
  final Random _random = Random();

  // Animation
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  late AnimationController _correctController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _correctController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _generateQuestion();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _correctController.dispose();
    super.dispose();
  }

  void _generateQuestion() {
    final shuffled = List<_SoundItem>.from(_soundItems)..shuffle(_random);
    final answer = shuffled[0];
    final options = shuffled.take(4).toList()..shuffle(_random);

    _currentQuestion = _SoundQuestion(
      answer: answer,
      options: options,
    );
    _selectedIndex = null;
    _lastAnswerCorrect = null;
  }

  void _playSound() async {
    setState(() {
      _isPlaying = true;
    });
    _pulseController.repeat(reverse: true);

    // Play the actual audio using AudioService
    final answer = _currentQuestion.answer;
    await _audioService.playWord(answer.category, answer.id);

    // Wait a bit then stop animation
    await Future.delayed(const Duration(milliseconds: 500));

    if (mounted) {
      _pulseController.stop();
      _pulseController.reset();
      setState(() {
        _isPlaying = false;
      });
    }
  }

  void _onOptionSelected(int index) {
    if (_selectedIndex != null) return;

    final selected = _currentQuestion.options[index];
    final correct = selected.id == _currentQuestion.answer.id;

    setState(() {
      _selectedIndex = index;
      _lastAnswerCorrect = correct;
      if (correct) {
        _score++;
        HapticFeedback.mediumImpact();
      } else {
        HapticFeedback.heavyImpact();
      }
    });

    // Auto proceed after delay
    Future.delayed(const Duration(milliseconds: 1200), () {
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
        gameTitleBn: 'শব্দ চিনো',
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
                        titleBn: 'শব্দ চিনো',
                        subtitleBn: 'শুনে মেলাও',
                        currentRound: _currentRound,
                        totalRounds: _totalRounds,
                        accentColor: const Color(0xFF2196F3),
                      ),

                      SizedBox(height: 20.h),

                      // Sound play button
                      _buildSoundButton(),

                      SizedBox(height: 24.h),

                      // Instruction
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2196F3).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 8.w,
                          children: [
                            Icon(
                              Icons.lightbulb_outline_rounded,
                              color: const Color(0xFF2196F3),
                              size: 20.sp,
                            ),
                            Text(
                              'শব্দটি শোনো এবং সঠিক ছবি বেছে নাও',
                              style: TextStyle(
                                fontFamily: 'NotoSansBengali',
                                fontSize: 14.sp,
                                color: const Color(0xFF2196F3),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 32.h),

                      // Options grid
                      _buildOptionsGrid(),

                      SizedBox(height: 32.h),

                      // Current answer (shown after selection)
                      if (_selectedIndex != null)
                        Container(
                          margin: EdgeInsets.only(bottom: 24.h),
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: _lastAnswerCorrect!
                                ? const Color(0xFF4CAF50).withValues(alpha: 0.1)
                                : const Color(0xFFF44336).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(
                              color: _lastAnswerCorrect!
                                  ? const Color(0xFF4CAF50)
                                  : const Color(0xFFF44336),
                              width: 2,
                            ),
                          ),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 12.w,
                            children: [
                              Icon(
                                _lastAnswerCorrect!
                                    ? Icons.check_circle_rounded
                                    : Icons.cancel_rounded,
                                color: _lastAnswerCorrect!
                                    ? const Color(0xFF4CAF50)
                                    : const Color(0xFFF44336),
                                size: 28.sp,
                              ),
                              Text(
                                _lastAnswerCorrect!
                                    ? 'সঠিক! "${_currentQuestion.answer.nameBn}"'
                                    : 'উত্তর: "${_currentQuestion.answer.nameBn}"',
                                style: TextStyle(
                                  fontFamily: 'NotoSansBengali',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: _lastAnswerCorrect!
                                      ? const Color(0xFF4CAF50)
                                      : const Color(0xFFF44336),
                                ),
                              ),
                            ],
                          ),
                        ),
                      
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

  Widget _buildSoundButton() {
    return GestureDetector(
      onTap: _isPlaying ? null : _playSound,
      child: AnimatedBuilder(
        animation: _pulseAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _isPlaying ? _pulseAnimation.value : 1.0,
            child: Container(
              width: 140.w,
              height: 140.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF2196F3),
                    const Color(0xFF1976D2),
                  ],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2196F3).withValues(alpha: 0.4),
                    blurRadius: _isPlaying ? 30 : 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  _isPlaying ? Icons.volume_up_rounded : Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 64.sp,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildOptionsGrid() {
    return Wrap(
      spacing: 16.w,
      runSpacing: 16.w,
      alignment: WrapAlignment.center,
      children: List.generate(_currentQuestion.options.length, (index) {
        final item = _currentQuestion.options[index];
        final isSelected = _selectedIndex == index;
        final isCorrectAnswer = item.id == _currentQuestion.answer.id;
        final showCorrect = _selectedIndex != null && isCorrectAnswer;
        final showWrong = isSelected && !_lastAnswerCorrect!;

        return GestureDetector(
          onTap: () => _onOptionSelected(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 150.w,
            height: 130.h,
            decoration: BoxDecoration(
              color: showCorrect
                  ? const Color(0xFF4CAF50).withValues(alpha: 0.15)
                  : showWrong
                      ? const Color(0xFFF44336).withValues(alpha: 0.15)
                      : Colors.white,
              borderRadius: BorderRadius.circular(20.r),
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
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.emoji,
                  style: TextStyle(fontSize: 48.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  item.nameBn,
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

// ============ DATA ============

class _SoundQuestion {
  final _SoundItem answer;
  final List<_SoundItem> options;

  _SoundQuestion({
    required this.answer,
    required this.options,
  });
}

class _SoundItem {
  final String id;
  final String emoji;
  final String nameBn;
  final String category; // 'animals', 'fruits', 'vehicles'

  const _SoundItem({
    required this.id,
    required this.emoji,
    required this.nameBn,
    required this.category,
  });
}

// Items with audio IDs matching our audio files
const List<_SoundItem> _soundItems = [
  // Animals
  _SoundItem(id: 'goru', emoji: '🐄', nameBn: 'গরু', category: 'animals'),
  _SoundItem(id: 'biral', emoji: '🐱', nameBn: 'বিড়াল', category: 'animals'),
  _SoundItem(id: 'kukur', emoji: '🐕', nameBn: 'কুকুর', category: 'animals'),
  _SoundItem(id: 'hati', emoji: '🐘', nameBn: 'হাতি', category: 'animals'),
  _SoundItem(id: 'singho', emoji: '🦁', nameBn: 'সিংহ', category: 'animals'),
  _SoundItem(id: 'bagh', emoji: '🐅', nameBn: 'বাঘ', category: 'animals'),
  _SoundItem(id: 'machh', emoji: '🐟', nameBn: 'মাছ', category: 'animals'),
  _SoundItem(id: 'hash', emoji: '🦆', nameBn: 'হাঁস', category: 'animals'),
  _SoundItem(id: 'murgi', emoji: '🐔', nameBn: 'মুরগি', category: 'animals'),
  _SoundItem(id: 'ghora', emoji: '🐴', nameBn: 'ঘোড়া', category: 'animals'),
  _SoundItem(id: 'banor', emoji: '🐒', nameBn: 'বানর', category: 'animals'),
  _SoundItem(id: 'khorgosh', emoji: '🐰', nameBn: 'খরগোশ', category: 'animals'),
  // Fruits
  _SoundItem(id: 'am', emoji: '🥭', nameBn: 'আম', category: 'fruits'),
  _SoundItem(id: 'kola', emoji: '🍌', nameBn: 'কলা', category: 'fruits'),
  _SoundItem(id: 'apel', emoji: '🍎', nameBn: 'আপেল', category: 'fruits'),
  _SoundItem(id: 'komla', emoji: '🍊', nameBn: 'কমলা', category: 'fruits'),
  _SoundItem(id: 'angur', emoji: '🍇', nameBn: 'আঙুর', category: 'fruits'),
  _SoundItem(id: 'tormuj', emoji: '🍉', nameBn: 'তরমুজ', category: 'fruits'),
  // Vehicles
  _SoundItem(id: 'gari', emoji: '🚗', nameBn: 'গাড়ি', category: 'vehicles'),
  _SoundItem(id: 'bus', emoji: '🚌', nameBn: 'বাস', category: 'vehicles'),
  _SoundItem(id: 'train', emoji: '🚂', nameBn: 'ট্রেন', category: 'vehicles'),
  _SoundItem(id: 'nouka', emoji: '⛵', nameBn: 'নৌকা', category: 'vehicles'),
  _SoundItem(id: 'cycle', emoji: '🚲', nameBn: 'সাইকেল', category: 'vehicles'),
  _SoundItem(id: 'riksha', emoji: '🛺', nameBn: 'রিকশা', category: 'vehicles'),
];
