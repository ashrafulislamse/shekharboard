import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Bottom action bar with previous/next and learned button for Item Detail Page
class ItemBottomActionBar extends StatelessWidget {
  final int currentIndex;
  final int totalCount;
  final bool isLearned;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onMarkLearned;

  const ItemBottomActionBar({
    super.key,
    required this.currentIndex,
    required this.totalCount,
    required this.isLearned,
    required this.onPrevious,
    required this.onNext,
    required this.onMarkLearned,
  });

  @override
  Widget build(BuildContext context) {
    final isFirst = currentIndex == 0;
    final isLast = currentIndex == totalCount - 1;

    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 32.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.shade100),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Previous button
          _NavButton(
            label: 'আগের',
            icon: Icons.arrow_left_rounded,
            iconFirst: true,
            isEnabled: !isFirst,
            onTap: onPrevious,
          ),

          // Learned button
          GestureDetector(
            onTap: isLearned ? null : onMarkLearned,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: isLearned ? Colors.grey.shade300 : const Color(0xFF2E7D32),
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: isLearned
                    ? null
                    : [
                        BoxShadow(
                          color: const Color(0xFF1B5E20).withOpacity(0.2),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check_rounded,
                    size: 24.sp,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    isLearned ? 'শিখেছি ✓' : 'শিখেছি',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Next button
          _NavButton(
            label: 'পরের',
            icon: Icons.arrow_right_rounded,
            iconFirst: false,
            isEnabled: !isLast,
            onTap: onNext,
          ),
        ],
      ),
    );
  }
}

/// Navigation button (previous/next)
class _NavButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool iconFirst;
  final bool isEnabled;
  final VoidCallback onTap;

  const _NavButton({
    required this.label,
    required this.icon,
    required this.iconFirst,
    required this.isEnabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isEnabled ? AppColors.primary : Colors.grey.shade300;
    
    final children = [
      if (iconFirst) Icon(icon, size: 24.sp, color: color),
      Text(
        label,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
      if (!iconFirst) Icon(icon, size: 24.sp, color: color),
    ];

    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Row(children: children),
    );
  }
}
