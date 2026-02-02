import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Header for Profile page with title and settings button
class ProfileHeader extends StatelessWidget {
  final VoidCallback? onSettingsTap;

  const ProfileHeader({
    super.key,
    this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 56.h, 24.w, 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'প্রোফাইল',
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 32.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
              height: 1.1,
            ),
          ),
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              onSettingsTap?.call();
            },
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Icon(
                Icons.settings_outlined,
                size: 26.sp,
                color: AppColors.primary.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
