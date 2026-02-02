import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';

/// Shared game header with close button, title, and progress
class GameHeader extends StatelessWidget {
  final String titleBn;
  final String? subtitleBn;
  final int currentRound;
  final int totalRounds;
  final VoidCallback? onClose;
  final Color accentColor;

  const GameHeader({
    super.key,
    required this.titleBn,
    this.subtitleBn,
    this.currentRound = 1,
    this.totalRounds = 5,
    this.onClose,
    this.accentColor = const Color(0xFF7FBA96),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          // Close button
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              if (onClose != null) {
                onClose!();
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.close_rounded,
                color: AppColors.textSecondary,
                size: 24.sp,
              ),
            ),
          ),

          SizedBox(width: 16.w),

          // Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleBn,
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain,
                  ),
                ),
                if (subtitleBn != null) ...[
                  SizedBox(height: 2.h),
                  Text(
                    subtitleBn!,
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 12.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Round indicator
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              '$currentRound/$totalRounds',
              style: TextStyle(
                fontFamily: 'NotoSansBengali',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
