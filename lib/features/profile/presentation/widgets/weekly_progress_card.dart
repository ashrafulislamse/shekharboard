import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Weekly progress card with bar chart and streak badge
class WeeklyProgressCard extends StatelessWidget {
  final int streakDays;
  final List<double> weeklyProgress; // 7 values (0.0 to 1.0) for each day

  const WeeklyProgressCard({
    super.key,
    required this.streakDays,
    required this.weeklyProgress,
  });

  String _toBengaliNumber(int number) {
    const bengaliDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    return number.toString().split('').map((d) => bengaliDigits[int.parse(d)]).join();
  }

  @override
  Widget build(BuildContext context) {
    final dayLabels = ['শ', 'র', 'সো', 'ম', 'বু', 'বৃ', 'শু'];
    final today = DateTime.now().weekday % 7; // 0 = Sunday

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with title and streak badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'সাপ্তাহিক অগ্রগতি',
                style: TextStyle(
                  fontFamily: 'NotoSansBengali',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD54F).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: const Color(0xFFFFD54F).withOpacity(0.5),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('🔥', style: TextStyle(fontSize: 14.sp)),
                    SizedBox(width: 6.w),
                    Text(
                      '${_toBengaliNumber(streakDays)} দিন টানা শিখেছ!',
                      style: TextStyle(
                        fontFamily: 'NotoSansBengali',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFFB45309), // amber-700
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          SizedBox(height: 16.h),
          
          // Chart card
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: Colors.grey.shade50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: SizedBox(
              height: 128.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(7, (index) {
                  final progress = weeklyProgress.length > index 
                      ? weeklyProgress[index] 
                      : 0.0;
                  final isToday = index == today;
                  final isPast = index < today;
                  
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(8.r),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: FractionallySizedBox(
                                heightFactor: progress.clamp(0.1, 1.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: progress > 0
                                        ? (isToday || isPast
                                            ? const Color(0xFF7FBA96)
                                            : const Color(0xFF7FBA96).withOpacity(0.3 + progress * 0.4))
                                        : Colors.grey.shade200,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(8.r),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          dayLabels[index],
                          style: TextStyle(
                            fontFamily: 'NotoSansBengali',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                            color: isToday || isPast
                                ? AppColors.primary
                                : Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
