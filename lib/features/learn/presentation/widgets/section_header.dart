import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Section Header with optional "See All" button
class SectionHeader extends StatelessWidget {
  final String titleBn;
  final String? actionText;
  final VoidCallback? onActionTap;
  final bool isFirst;

  const SectionHeader({
    super.key,
    required this.titleBn,
    this.actionText,
    this.onActionTap,
    this.isFirst = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, isFirst ? 16.h : 24.h, 20.w, 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleBn,
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textMain,
            ),
          ),
          if (actionText != null)
            GestureDetector(
              onTap: onActionTap,
              child: Text(
                actionText!,
                style: TextStyle(
                  fontFamily: 'NotoSansBengali',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
