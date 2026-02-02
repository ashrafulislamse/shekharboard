import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/learning_item.dart';

/// Learning Tile Widget
/// Displays a learning item with image and bilingual text
/// Bengali (primary) on top, English (secondary) smaller below
class LearningTile extends StatelessWidget {
  final LearningItem item;
  final VoidCallback? onTap;
  final bool showEnglish;
  final Color? backgroundColor;
  
  const LearningTile({
    super.key,
    required this.item,
    this.onTap,
    this.showEnglish = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image placeholder (will show actual image when assets exist)
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Icon(
                    Icons.image_outlined,
                    size: 48.sp,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
            
            // Text section
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Bengali name (primary - large)
                    Text(
                      item.nameBn,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1B5E5E),
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    if (showEnglish) ...[
                      SizedBox(height: 2.h),
                      // English name (secondary - smaller)
                      Text(
                        item.nameEn,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Category Tile Widget
/// Displays a category button with emoji and name
class CategoryTile extends StatelessWidget {
  final String nameBn;
  final String nameEn;
  final String emoji;
  final Color color;
  final VoidCallback? onTap;
  final bool showEnglish;
  
  const CategoryTile({
    super.key,
    required this.nameBn,
    required this.nameEn,
    required this.emoji,
    required this.color,
    this.onTap,
    this.showEnglish = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: color.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Emoji icon
            Text(
              emoji,
              style: TextStyle(fontSize: 32.sp),
            ),
            SizedBox(height: 8.h),
            
            // Bengali name (primary)
            Text(
              nameBn,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1B5E5E),
              ),
              textAlign: TextAlign.center,
            ),
            
            if (showEnglish) ...[
              SizedBox(height: 2.h),
              // English name (secondary)
              Text(
                nameEn,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
