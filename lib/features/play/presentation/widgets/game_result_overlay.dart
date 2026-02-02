import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Success/Fail overlay for games with mascot feedback
class GameResultOverlay extends StatefulWidget {
  final bool isSuccess;
  final String messageBn;
  final String? messageEn;
  final VoidCallback? onContinue;
  final VoidCallback? onTryAgain;

  const GameResultOverlay({
    super.key,
    required this.isSuccess,
    required this.messageBn,
    this.messageEn,
    this.onContinue,
    this.onTryAgain,
  });

  @override
  State<GameResultOverlay> createState() => _GameResultOverlayState();
}

class _GameResultOverlayState extends State<GameResultOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();

    if (widget.isSuccess) {
      HapticFeedback.mediumImpact();
    } else {
      HapticFeedback.lightImpact();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Container(
            color: Colors.black.withValues(alpha: 0.6),
            child: Center(
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 32.w),
                  padding: EdgeInsets.all(32.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Emoji/Icon
                      Container(
                        width: 100.w,
                        height: 100.w,
                        decoration: BoxDecoration(
                          color: widget.isSuccess
                              ? const Color(0xFF4CAF50).withValues(alpha: 0.15)
                              : const Color(0xFFF44336).withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            widget.isSuccess ? '🎉' : '💪',
                            style: TextStyle(fontSize: 48.sp),
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // Message
                      Text(
                        widget.messageBn,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'NotoSansBengali',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: widget.isSuccess
                              ? const Color(0xFF4CAF50)
                              : const Color(0xFFF44336),
                        ),
                      ),

                      if (widget.messageEn != null) ...[
                        SizedBox(height: 4.h),
                        Text(
                          widget.messageEn!,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],

                      SizedBox(height: 32.h),

                      // Buttons
                      if (widget.isSuccess && widget.onContinue != null)
                        _buildButton(
                          'চালিয়ে যাও',
                          const Color(0xFF4CAF50),
                          widget.onContinue!,
                        ),

                      if (!widget.isSuccess) ...[
                        _buildButton(
                          'আবার চেষ্টা করো',
                          AppColors.primary,
                          widget.onTryAgain ?? () {},
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
