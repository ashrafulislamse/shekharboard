import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Page indicator dots for Item Detail PageView
/// Shows current position with limited dots to avoid overflow
class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalCount;
  final Color accentColor;

  const PageIndicator({
    super.key,
    required this.currentIndex,
    required this.totalCount,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    // For many items, show text indicator instead of dots
    if (totalCount > 10) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          '${currentIndex + 1} / $totalCount',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    }
    
    // For 10 or fewer items, show dots
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalCount, (index) {
        final isActive = index == currentIndex;
        return Container(
          width: 10.w,
          height: 10.w,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.primary.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
