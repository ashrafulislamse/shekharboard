import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Locked game card with blur overlay for hard/premium games
class LockedGameCard extends StatelessWidget {
  final String titleBn;
  final String subtitleBn;
  final String emoji;
  final double progress;
  final VoidCallback? onUnlockTap;

  const LockedGameCard({
    super.key,
    required this.titleBn,
    required this.subtitleBn,
    required this.emoji,
    this.progress = 0.33,
    this.onUnlockTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          children: [
            // Blurred content behind
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Opacity(
                opacity: 0.6,
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Row(
                    children: [
                      // Emoji thumbnail
                      Container(
                        width: 80.w,
                        height: 80.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: Text(
                            emoji,
                            style: TextStyle(fontSize: 36.sp),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      // Text content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              titleBn,
                              style: TextStyle(
                                fontFamily: 'NotoSansBengali',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textMain,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              subtitleBn,
                              style: TextStyle(
                                fontFamily: 'NotoSansBengali',
                                fontSize: 12.sp,
                                color: Colors.grey[500],
                              ),
                            ),
                            SizedBox(height: 12.h),
                            // Progress bar
                            Container(
                              height: 8.h,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: progress,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF9C27B0),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Lock overlay
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  color: Colors.white.withValues(alpha: 0.3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Lock icon
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 12,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.lock_outline,
                          color: Colors.grey[400],
                          size: 28.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),

                      // Locked text
                      Text(
                        'লক করা',
                        style: TextStyle(
                          fontFamily: 'NotoSansBengali',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textMain,
                        ),
                      ),
                      SizedBox(height: 12.h),

                      // Unlock button
                      GestureDetector(
                        onTap: onUnlockTap,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF9C27B0), Color(0xFFE91E63)],
                            ),
                            borderRadius: BorderRadius.circular(24.r),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF9C27B0).withValues(alpha: 0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Text(
                            'Upgrade to unlock',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
