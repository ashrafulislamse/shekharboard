import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';

/// Unified Tab Header - Consistent header for all main tabs
/// Matches Home screen design with clean, warm cream background
class UnifiedTabHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? actionIcon;
  final VoidCallback? onActionTap;
  final Widget? trailing;

  const UnifiedTabHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.actionIcon,
    this.onActionTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.warmCream,
      padding: EdgeInsets.fromLTRB(20.w, 4.h, 20.w, 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain,
                  ),
                ),
                if (subtitle != null) ...[
                  SizedBox(height: 2.h),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ],
            ),
          ),
          
          // Action button
          if (trailing != null)
            trailing!
          else if (actionIcon != null)
            GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
                onActionTap?.call();
              },
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  actionIcon,
                  size: 20.sp,
                  color: AppColors.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
