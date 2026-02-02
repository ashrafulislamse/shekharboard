import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Horizontal scrollable game card (for Easy games section)
class EasyGameCard extends StatelessWidget {
  final String titleBn;
  final String subtitleBn;
  final String emoji;
  final Color accentColor;
  final VoidCallback? onTap;

  const EasyGameCard({
    super.key,
    required this.titleBn,
    required this.subtitleBn,
    required this.emoji,
    this.accentColor = const Color(0xFF4CAF50),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap?.call();
      },
      child: Container(
        width: 150.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image area with emoji and gradient
            Container(
              height: 90.h,
              width: double.infinity,
              margin: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    accentColor.withValues(alpha: 0.15),
                    accentColor.withValues(alpha: 0.08),
                  ],
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  emoji,
                  style: TextStyle(fontSize: 42.sp),
                ),
              ),
            ),

            // Text content
            Padding(
              padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleBn,
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textMain,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitleBn,
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 10.sp,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
