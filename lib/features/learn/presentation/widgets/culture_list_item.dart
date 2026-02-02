import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Culture List Item - Horizontal card with emoji thumbnail and text
class CultureListItem extends StatelessWidget {
  final String titleBn;
  final String subtitleBn;
  final String emoji;
  final VoidCallback? onTap;

  const CultureListItem({
    super.key,
    required this.titleBn,
    required this.subtitleBn,
    required this.emoji,
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
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Emoji thumbnail area
            Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary.withValues(alpha: 0.12),
                    AppColors.primary.withValues(alpha: 0.06),
                  ],
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  emoji,
                  style: TextStyle(fontSize: 26.sp),
                ),
              ),
            ),

            SizedBox(width: 14.w),

            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleBn,
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textMain,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitleBn,
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 12.sp,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),

            // Arrow icon
            Icon(
              Icons.chevron_right_rounded,
              color: Colors.grey[350],
              size: 22.sp,
            ),
          ],
        ),
      ),
    );
  }
}
