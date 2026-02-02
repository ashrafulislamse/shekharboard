import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Daily badge progress card with circular indicator
class DailyBadgeCard extends StatelessWidget {
  final int currentPoints;
  final int targetPoints;
  final double progress;

  const DailyBadgeCard({
    super.key,
    required this.currentPoints,
    required this.targetPoints,
    this.progress = 0.7,
  });

  @override
  Widget build(BuildContext context) {
    final remaining = targetPoints - currentPoints;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9C4).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFFFFC107).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Circular progress
          SizedBox(
            width: 48.w,
            height: 48.w,
            child: Stack(
              children: [
                // Background circle
                SizedBox.expand(
                  child: CircularProgressIndicator(
                    value: 1,
                    strokeWidth: 4,
                    valueColor: AlwaysStoppedAnimation(
                      const Color(0xFFFFC107).withValues(alpha: 0.3),
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                // Progress circle
                SizedBox.expand(
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 4,
                    strokeCap: StrokeCap.round,
                    valueColor: const AlwaysStoppedAnimation(Color(0xFFFFC107)),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                // Percentage text
                Center(
                  child: Text(
                    '${(progress * 100).toInt()}%',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFFF8F00),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 16.w),

          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'দৈনিক ব্যাজ',
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'আর মাত্র ${_toBengaliNumber(remaining)} পয়েন্ট দরকার!',
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          // Medal icon
          Icon(
            Icons.military_tech,
            color: const Color(0xFFFFC107),
            size: 32.sp,
          ),
        ],
      ),
    );
  }

  String _toBengaliNumber(int number) {
    const bengaliDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    return number.toString().split('').map((d) => bengaliDigits[int.parse(d)]).join();
  }
}
