import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Header with back button, progress indicator, and favorite button for Item Detail Page
class ItemDetailHeader extends StatelessWidget {
  final int currentIndex;
  final int totalCount;
  final bool isFavorite;
  final VoidCallback onBackPressed;
  final VoidCallback onFavoritePressed;

  const ItemDetailHeader({
    super.key,
    required this.currentIndex,
    required this.totalCount,
    required this.isFavorite,
    required this.onBackPressed,
    required this.onFavoritePressed,
  });

  String _toBengaliNumber(int number) {
    const bengaliDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    return number.toString().split('').map((d) => bengaliDigits[int.parse(d)]).join();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Back button
            _CircleButton(
              icon: Icons.arrow_back_rounded,
              onTap: onBackPressed,
            ),

            // Progress indicator
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                '${_toBengaliNumber(currentIndex + 1)}/${_toBengaliNumber(totalCount)}',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  letterSpacing: 1,
                ),
              ),
            ),

            // Favorite button
            _CircleButton(
              icon: Icons.favorite_rounded,
              iconColor: isFavorite ? Colors.red.shade500 : Colors.red.shade400,
              onTap: onFavoritePressed,
            ),
          ],
        ),
      ),
    );
  }
}

/// Circular button for header actions
class _CircleButton extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final VoidCallback onTap;

  const _CircleButton({
    required this.icon,
    this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44.w,
        height: 44.w,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 24.sp,
          color: iconColor ?? AppColors.primary,
        ),
      ),
    );
  }
}
