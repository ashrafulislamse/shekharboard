import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Empty state widget when no favorites exist
class FavoritesEmptyState extends StatelessWidget {
  const FavoritesEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '💝',
            style: TextStyle(fontSize: 80.sp),
          ),
          SizedBox(height: 24.h),
          Text(
            'কোনো পছন্দের আইটেম নেই',
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textMain,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'শেখার সময় হৃদয় বাটনে ট্যাপ করে\nতোমার প্রিয় জিনিস সেভ করো!',
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 14.sp,
              color: AppColors.textMuted,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
