import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Stats row showing learned, favorites, badges count
class ProfileStatsRow extends StatelessWidget {
  final int learnedCount;
  final int favoritesCount;
  final int badgesCount;

  const ProfileStatsRow({
    super.key,
    required this.learnedCount,
    required this.favoritesCount,
    required this.badgesCount,
  });

  String _toBengaliNumber(int number) {
    const bengaliDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    return number.toString().split('').map((d) => bengaliDigits[int.parse(d)]).join();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          Expanded(
            child: _StatCard(
              value: _toBengaliNumber(learnedCount),
              label: 'শিখেছ',
              color: const Color(0xFF7FBA96), // badge-green
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: _StatCard(
              value: _toBengaliNumber(favoritesCount),
              label: 'পছন্দ',
              color: const Color(0xFFC75146), // heart-red
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: _StatCard(
              value: _toBengaliNumber(badgesCount),
              label: 'ব্যাজ',
              color: const Color(0xFFFFD54F), // badge-yellow
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _StatCard({
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 24.sp,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 11.sp,
              fontWeight: FontWeight.w700,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}
