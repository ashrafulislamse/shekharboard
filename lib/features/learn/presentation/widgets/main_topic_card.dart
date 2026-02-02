import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Main Topic Card - Large cards with image area and colored bottom border
class MainTopicCard extends StatelessWidget {
  final String titleBn;
  final String count;
  final Color color;
  final String emoji;
  final VoidCallback? onTap;

  const MainTopicCard({
    super.key,
    required this.titleBn,
    required this.count,
    required this.color,
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
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
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
            // Image Area with emoji and gradient
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      color.withValues(alpha: 0.15),
                      color.withValues(alpha: 0.08),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Center(
                  child: Text(
                    emoji,
                    style: TextStyle(fontSize: 44.sp),
                  ),
                ),
              ),
            ),

            // Title and count
            Padding(
              padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      titleBn,
                      style: TextStyle(
                        fontFamily: 'NotoSansBengali',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textMain,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      count,
                      style: TextStyle(
                        fontFamily: 'NotoSansBengali',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
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
