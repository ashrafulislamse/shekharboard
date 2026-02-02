import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Achievements Bottom Sheet - Shows game achievements and stats
class AchievementsSheet extends StatelessWidget {
  final int gamesPlayed;
  final int gamesWon;
  final int totalPoints;
  final int streak;

  const AchievementsSheet({
    super.key,
    required this.gamesPlayed,
    required this.gamesWon,
    required this.totalPoints,
    required this.streak,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.warmCream,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: EdgeInsets.only(top: 12.h),
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),

          // Title
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Row(
              children: [
                Icon(
                  Icons.emoji_events_rounded,
                  color: const Color(0xFFFFB300),
                  size: 28.sp,
                ),
                SizedBox(width: 12.w),
                Text(
                  'অর্জন',
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain,
                  ),
                ),
              ],
            ),
          ),

          // Stats Grid
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Expanded(
                  child: _StatCard(
                    emoji: '🎮',
                    value: _toBengaliNumber(gamesPlayed),
                    label: 'খেলা',
                    color: const Color(0xFF66BB6A),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _StatCard(
                    emoji: '🏆',
                    value: _toBengaliNumber(gamesWon),
                    label: 'জয়',
                    color: const Color(0xFFFFB300),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 12.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Expanded(
                  child: _StatCard(
                    emoji: '⭐',
                    value: _toBengaliNumber(totalPoints),
                    label: 'পয়েন্ট',
                    color: const Color(0xFFFF9966),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _StatCard(
                    emoji: '🔥',
                    value: _toBengaliNumber(streak),
                    label: 'টানা জয়',
                    color: const Color(0xFFFF6B6B),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 24.h),

          // Badges Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ব্যাজ সংগ্রহ',
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _Badge(
                      emoji: '🌟',
                      label: 'প্রথম জয়',
                      isUnlocked: gamesWon >= 1,
                    ),
                    _Badge(
                      emoji: '🎯',
                      label: '৫ জয়',
                      isUnlocked: gamesWon >= 5,
                    ),
                    _Badge(
                      emoji: '👑',
                      label: '১০ জয়',
                      isUnlocked: gamesWon >= 10,
                    ),
                    _Badge(
                      emoji: '🔥',
                      label: '৩ টানা',
                      isUnlocked: streak >= 3,
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 24.h),

          // Win Rate
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              padding: EdgeInsets.all(16.w),
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
              child: Row(
                children: [
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF66BB6A).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Text('📊', style: TextStyle(fontSize: 24.sp)),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'জয়ের হার',
                          style: TextStyle(
                            fontFamily: 'NotoSansBengali',
                            fontSize: 14.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          gamesPlayed > 0
                              ? '${((gamesWon / gamesPlayed) * 100).toInt()}%'
                              : '০%',
                          style: TextStyle(
                            fontFamily: 'NotoSansBengali',
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF66BB6A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 32.h),
        ],
      ),
    );
  }

  String _toBengaliNumber(int number) {
    const bengaliDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    return number.toString().split('').map((d) => bengaliDigits[int.parse(d)]).join();
  }
}

class _StatCard extends StatelessWidget {
  final String emoji;
  final String value;
  final String label;
  final Color color;

  const _StatCard({
    required this.emoji,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
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
        children: [
          Text(emoji, style: TextStyle(fontSize: 28.sp)),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 12.sp,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String emoji;
  final String label;
  final bool isUnlocked;

  const _Badge({
    required this.emoji,
    required this.label,
    required this.isUnlocked,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56.w,
          height: 56.w,
          decoration: BoxDecoration(
            color: isUnlocked 
                ? const Color(0xFFFFE082) 
                : Colors.grey[200],
            shape: BoxShape.circle,
            boxShadow: isUnlocked
                ? [
                    BoxShadow(
                      color: const Color(0xFFFFB300).withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: isUnlocked
                ? Text(emoji, style: TextStyle(fontSize: 28.sp))
                : Icon(Icons.lock_outline, color: Colors.grey[400], size: 24.sp),
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'NotoSansBengali',
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            color: isUnlocked ? AppColors.textMain : Colors.grey[400],
          ),
        ),
      ],
    );
  }
}
