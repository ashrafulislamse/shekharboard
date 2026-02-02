import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Achievement badge model
class Achievement {
  final String id;
  final String emoji;
  final String label;
  final bool unlocked;
  final Color? gradientStart;
  final Color? gradientEnd;
  final Color? borderColor;

  const Achievement({
    required this.id,
    required this.emoji,
    required this.label,
    required this.unlocked,
    this.gradientStart,
    this.gradientEnd,
    this.borderColor,
  });
}

/// Horizontal scrollable achievements section
class AchievementsSection extends StatelessWidget {
  final List<Achievement> achievements;

  const AchievementsSection({
    super.key,
    required this.achievements,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            'অর্জনসমূহ',
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ),
        
        SizedBox(height: 16.h),
        
        SizedBox(
          height: 120.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            itemCount: achievements.length,
            separatorBuilder: (_, __) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              return _AchievementBadge(achievement: achievements[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _AchievementBadge extends StatelessWidget {
  final Achievement achievement;

  const _AchievementBadge({required this.achievement});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Badge circle
        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: achievement.unlocked
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      achievement.gradientStart ?? const Color(0xFFFFF9C4),
                      achievement.gradientEnd ?? const Color(0xFFFFE0B2),
                    ],
                  )
                : const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFF5F5F5),
                      Color(0xFFEEEEEE),
                    ],
                  ),
            border: Border.all(
              color: achievement.unlocked
                  ? (achievement.borderColor ?? const Color(0xFFFFCC80))
                  : const Color(0xFFE0E0E0),
              width: 2,
            ),
            boxShadow: [
              if (achievement.unlocked)
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                )
              else
                const BoxShadow(
                  color: Color(0x0D000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
            ],
          ),
          child: Center(
            child: achievement.unlocked
                ? Text(
                    achievement.emoji,
                    style: TextStyle(fontSize: 32.sp),
                  )
                : Icon(
                    Icons.lock_rounded,
                    size: 28.sp,
                    color: const Color(0xFFBDBDBD),
                  ),
          ),
        ),
        
        SizedBox(height: 10.h),
        
        // Label
        Text(
          achievement.unlocked ? achievement.label : 'লক করা',
          style: TextStyle(
            fontFamily: 'NotoSansBengali',
            fontSize: 11.sp,
            fontWeight: FontWeight.w700,
            color: achievement.unlocked
                ? AppColors.primary
                : const Color(0xFF9E9E9E),
          ),
        ),
      ],
    );
  }
}
