import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Grid game card for medium difficulty games
class MediumGameCard extends StatelessWidget {
  final String titleBn;
  final String subtitleBn;
  final String emoji;
  final IconData badgeIcon;
  final VoidCallback? onTap;

  const MediumGameCard({
    super.key,
    required this.titleBn,
    required this.subtitleBn,
    required this.emoji,
    this.badgeIcon = Icons.extension,
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
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image area with badge
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFF42A5F5).withValues(alpha: 0.12),
                          const Color(0xFF42A5F5).withValues(alpha: 0.06),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Text(
                        emoji,
                        style: TextStyle(fontSize: 36.sp),
                      ),
                    ),
                  ),
                  // Badge icon
                  Positioned(
                    top: 6.w,
                    right: 6.w,
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Icon(
                        badgeIcon,
                        color: const Color(0xFF42A5F5),
                        size: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),

            // Title
            Text(
              titleBn,
              style: TextStyle(
                fontFamily: 'NotoSansBengali',
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textMain,
              ),
            ),
            SizedBox(height: 2.h),

            // Subtitle
            Text(
              subtitleBn,
              style: TextStyle(
                fontFamily: 'NotoSansBengali',
                fontSize: 10.sp,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
