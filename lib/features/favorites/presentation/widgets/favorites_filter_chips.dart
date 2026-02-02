import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Filter chips for Favorites page - All, Animals, Fruits, etc.
class FavoritesFilterChips extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;
  final List<String> filters;

  const FavoritesFilterChips({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
    this.filters = const ['সব', 'প্রাণী', 'ফল', 'যানবাহন', 'গল্প'],
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        itemCount: filters.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = filter == selectedFilter;
          
          return _FilterChip(
            label: filter,
            isSelected: isSelected,
            onTap: () {
              HapticFeedback.selectionClick();
              onFilterChanged(filter);
            },
          );
        },
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF7FBA96) : Colors.transparent,
          borderRadius: BorderRadius.circular(24.r),
          border: isSelected
              ? null
              : Border.all(
                  color: AppColors.primary.withOpacity(0.3),
                  width: 1,
                ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF2E7D32).withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'NotoSansBengali',
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: isSelected ? Colors.white : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
