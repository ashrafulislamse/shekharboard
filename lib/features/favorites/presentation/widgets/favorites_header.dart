import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Header for Favorites page with title and subtitle
class FavoritesHeader extends StatelessWidget {
  const FavoritesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 56.h, 24.w, 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'পছন্দ',
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 32.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
              height: 1.1,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'তোমার প্রিয় জিনিস',
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primary.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
