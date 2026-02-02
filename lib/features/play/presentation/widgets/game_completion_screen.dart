import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/progress_service.dart';

/// Game completion celebration screen
class GameCompletionScreen extends StatefulWidget {
  final int score;
  final int totalQuestions;
  final String gameTitleBn;
  final VoidCallback? onPlayAgain;
  final VoidCallback? onBackToGames;

  const GameCompletionScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.gameTitleBn,
    this.onPlayAgain,
    this.onBackToGames,
  });

  @override
  State<GameCompletionScreen> createState() => _GameCompletionScreenState();
}

class _GameCompletionScreenState extends State<GameCompletionScreen>
    with TickerProviderStateMixin {
  late AnimationController _starsController;
  late AnimationController _contentController;
  final ProgressService _progressService = ProgressService();
  bool _resultRecorded = false;

  @override
  void initState() {
    super.initState();
    _starsController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _contentController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _starsController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _contentController.forward();
    });

    HapticFeedback.heavyImpact();
    
    // Record game result
    _recordGameResult();
  }

  Future<void> _recordGameResult() async {
    if (_resultRecorded) return;
    _resultRecorded = true;
    
    await _progressService.init();
    
    // Calculate points earned based on score
    final percentage = widget.score / widget.totalQuestions;
    final pointsEarned = (percentage * 20).round(); // Max 20 points per game
    final won = percentage >= 0.5; // Won if 50%+ correct
    
    await _progressService.recordGameResult(
      won: won,
      pointsEarned: pointsEarned,
    );
  }

  @override
  void dispose() {
    _starsController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  int get _starCount {
    final percentage = widget.score / widget.totalQuestions;
    if (percentage >= 0.8) return 3;
    if (percentage >= 0.5) return 2;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.warmCream,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),

                // Stars animation
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return AnimatedBuilder(
                      animation: _starsController,
                      builder: (context, child) {
                        final delay = index * 0.3;
                        final progress = (_starsController.value - delay).clamp(0.0, 0.3) / 0.3;
                        final isEarned = index < _starCount;

                        return Transform.scale(
                          scale: progress,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Icon(
                              Icons.star_rounded,
                              size: 56.sp,
                              color: isEarned
                                  ? const Color(0xFFFFD700)
                                  : Colors.grey.shade300,
                            ),
                          ),
                        );
                      },
                );
              }),
            ),

            SizedBox(height: 32.h),

            // Content
            FadeTransition(
              opacity: _contentController,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.2),
                  end: Offset.zero,
                ).animate(_contentController),
                child: Column(
                  children: [
                    // Celebration emoji
                    Text(
                      '🎉',
                      style: TextStyle(fontSize: 64.sp),
                    ),

                    SizedBox(height: 20.h),

                    // Message
                    Text(
                      _getMessage(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'NotoSansBengali',
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textMain,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      'তুমি ${widget.score}/${widget.totalQuestions} সঠিক করেছো!',
                      style: TextStyle(
                        fontFamily: 'NotoSansBengali',
                        fontSize: 16.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),

                    SizedBox(height: 40.h),

                    // Buttons
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: Column(
                        children: [
                          // Play Again
                          _buildButton(
                            'আবার খেলো',
                            Icons.replay_rounded,
                            AppColors.primary,
                            Colors.white,
                            widget.onPlayAgain ?? () {},
                          ),

                          SizedBox(height: 12.h),

                          // Back to Games
                          _buildButton(
                            'অন্য খেলা',
                            Icons.grid_view_rounded,
                            Colors.white,
                            AppColors.textMain,
                            widget.onBackToGames ?? () => context.pop(),
                            hasBorder: true,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          ],
        ),
          ),
        ),
      ),
    );
  }

  String _getMessage() {
    if (_starCount == 3) return 'অসাধারণ!';
    if (_starCount == 2) return 'বাহ্ চমৎকার!';
    return 'ভালো চেষ্টা!';
  }

  Widget _buildButton(
    String text,
    IconData icon,
    Color bgColor,
    Color textColor,
    VoidCallback onTap, {
    bool hasBorder = false,
  }) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16.r),
          border: hasBorder
              ? Border.all(color: AppColors.textSecondary.withValues(alpha: 0.3), width: 2)
              : null,
          boxShadow: !hasBorder
              ? [
                  BoxShadow(
                    color: bgColor.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: textColor, size: 24.sp),
            SizedBox(width: 12.w),
            Text(
              text,
              style: TextStyle(
                fontFamily: 'NotoSansBengali',
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
