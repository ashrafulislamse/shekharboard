import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Score card with gradient background showing today's points and stats
class ScoreCard extends StatelessWidget {
  final int points;
  final int played;
  final int won;
  final int streak;

  const ScoreCard({
    super.key,
    required this.points,
    required this.played,
    required this.won,
    required this.streak,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        // Child-friendly warm gradient - soft orange to coral
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFF9966), Color(0xFFFF6B6B)],
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF9966).withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative circles - playful touch
          Positioned(
            top: -30.w,
            right: -30.w,
            child: Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.12),
              ),
            ),
          ),
          Positioned(
            bottom: -15.w,
            left: -15.w,
            child: Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow.withValues(alpha: 0.15),
              ),
            ),
          ),

          // Content - Compact layout
          Row(
            children: [
              // Left side - Score
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'আজকের স্কোর ⭐',
                      style: TextStyle(
                        fontFamily: 'NotoSansBengali',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          _toBengaliNumber(points),
                          style: TextStyle(
                            fontFamily: 'NotoSansBengali',
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          'পয়েন্ট',
                          style: TextStyle(
                            fontFamily: 'NotoSansBengali',
                            fontSize: 14.sp,
                            color: Colors.white.withValues(alpha: 0.85),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Right side - Stats
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _CompactStat(label: 'খেলা', value: _toBengaliNumber(played), emoji: '🎮'),
                    SizedBox(width: 12.w),
                    _CompactStat(label: 'জয়', value: _toBengaliNumber(won), emoji: '🏆'),
                    SizedBox(width: 12.w),
                    _CompactStat(label: 'টানা', value: _toBengaliNumber(streak), emoji: '🔥'),
                  ],
                ),
              ),
            ],
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

/// Compact stat item with emoji
class _CompactStat extends StatelessWidget {
  final String label;
  final String value;
  final String emoji;

  const _CompactStat({
    required this.label,
    required this.value,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          emoji,
          style: TextStyle(fontSize: 16.sp),
        ),
        SizedBox(height: 2.h),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'NotoSansBengali',
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
