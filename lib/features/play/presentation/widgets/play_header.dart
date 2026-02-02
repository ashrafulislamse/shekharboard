import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Play page header with star pattern and settings button
class PlayHeader extends StatelessWidget {
  const PlayHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.warmCream.withValues(alpha: 0.95),
          ),
          child: Stack(
            children: [
              // Star pattern overlay
              Positioned.fill(
                child: CustomPaint(
                  painter: _StarPatternPainter(),
                ),
              ),
              // Content
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'খেলা',
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  _SettingsButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        // TODO: Open settings
      },
      child: Container(
        width: 44.w,
        height: 44.w,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: Colors.grey.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        child: Icon(
          Icons.settings_outlined,
          color: AppColors.primary,
          size: 24.sp,
        ),
      ),
    );
  }
}

/// Star pattern painter for header background
class _StarPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = const Color(0xFFFFC107).withValues(alpha: 0.15)
      ..style = PaintingStyle.fill;
    final paint2 = Paint()
      ..color = const Color(0xFFFF9800).withValues(alpha: 0.15)
      ..style = PaintingStyle.fill;

    const spacing = 20.0;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1.5, paint1);
        canvas.drawCircle(Offset(x + 10, y + 10), 1.5, paint2);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
