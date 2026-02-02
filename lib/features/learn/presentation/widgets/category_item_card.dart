import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../models/category_item.dart';

/// Item card in 3-column grid for Category Grid Page
class CategoryItemCard extends StatelessWidget {
  final CategoryItem item;
  final Color accentColor;
  final VoidCallback onTap;

  const CategoryItemCard({
    super.key,
    required this.item,
    required this.accentColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = item.isCompleted;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          border: isCompleted
              ? const Border(
                  bottom: BorderSide(
                    color: Color(0xFF2E7D32),
                    width: 4,
                  ),
                )
              : Border.all(
                  color: Colors.grey.withValues(alpha: 0.2),
                  width: 1,
                ),
        ),
        child: Stack(
          children: [
            // Content
            Column(
              children: [
                // Image area
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: accentColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Text(
                          item.emoji,
                          style: TextStyle(fontSize: 40.sp),
                        ),
                      ),
                    ),
                  ),
                ),

                // Name
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Text(
                    item.nameBn,
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 13.sp,
                      fontWeight: isCompleted ? FontWeight.bold : FontWeight.w500,
                      color: isCompleted ? AppColors.textMain : Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),

            // Completed checkmark
            if (isCompleted)
              Positioned(
                top: 4.w,
                right: 4.w,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_circle,
                    color: Color(0xFF2E7D32),
                    size: 20,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
