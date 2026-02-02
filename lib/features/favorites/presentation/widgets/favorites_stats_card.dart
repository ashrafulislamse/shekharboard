import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Pink stats card showing count of favorited items
class FavoritesStatsCard extends StatelessWidget {
  final int count;

  const FavoritesStatsCard({
    super.key,
    required this.count,
  });

  String _toBengaliNumber(int number) {
    const bengaliDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    return number.toString().split('').map((d) => bengaliDigits[int.parse(d)]).join();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEBEE), // stats-pink
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFFFCE4EC).withOpacity(0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '❤️',
            style: TextStyle(fontSize: 18.sp),
          ),
          SizedBox(width: 8.w),
          Text(
            '${_toBengaliNumber(count)}টি পছন্দ করেছ',
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
