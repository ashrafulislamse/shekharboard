import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Gradient header with back button, title, and progress bar for Category Grid
class CategoryHeader extends StatelessWidget {
  final String titleBn;
  final String emoji;
  final Color accentColor;
  final int totalCount;
  final int completedCount;
  final double progress;
  final VoidCallback onBackPressed;

  const CategoryHeader({
    super.key,
    required this.titleBn,
    required this.emoji,
    required this.accentColor,
    required this.totalCount,
    required this.completedCount,
    required this.progress,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Create gradient colors from accent
    final gradientStart = Color.lerp(accentColor, Colors.white, 0.85)!;
    final gradientEnd = Color.lerp(accentColor, Colors.white, 0.7)!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [gradientStart, gradientEnd],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 20.h),
          child: Column(
            children: [
              // Top row: Back button + Title
              Row(
                children: [
                  // Back button
                  GestureDetector(
                    onTap: onBackPressed,
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.6),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.primary,
                        size: 24.sp,
                      ),
                    ),
                  ),

                  // Title centered
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          titleBn,
                          style: TextStyle(
                            fontFamily: 'NotoSansBengali',
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          '${_toBengaliNumber(totalCount)}টি $titleBn শিখো!',
                          style: TextStyle(
                            fontFamily: 'NotoSansBengali',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Spacer for balance
                  SizedBox(width: 40.w),
                ],
              ),

              SizedBox(height: 16.h),

              // Progress section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  children: [
                    // Progress labels
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'অগ্রগতি',
                          style: TextStyle(
                            fontFamily: 'NotoSansBengali',
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary.withValues(alpha: 0.7),
                          ),
                        ),
                        Text(
                          '${_toBengaliNumber(completedCount)}/${_toBengaliNumber(totalCount)} শেষ',
                          style: TextStyle(
                            fontFamily: 'NotoSansBengali',
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),

                    // Progress bar
                    Container(
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Stack(
                        children: [
                          AnimatedFractionallySizedBox(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut,
                            alignment: Alignment.centerLeft,
                            widthFactor: progress,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF2E7D32), // success-green
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _toBengaliNumber(int number) {
    const bengaliDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    return number.toString().split('').map((d) => bengaliDigits[int.parse(d)]).join();
  }
}
