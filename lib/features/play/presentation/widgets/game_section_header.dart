import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Section header with colored accent bar
class GameSectionHeader extends StatelessWidget {
  final String titleBn;
  final Color accentColor;

  const GameSectionHeader({
    super.key,
    required this.titleBn,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          // Emoji indicator instead of colored bar
          Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              _getIconForColor(accentColor),
              color: accentColor,
              size: 16.sp,
            ),
          ),
          SizedBox(width: 10.w),
          // Title
          Text(
            titleBn,
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textMain,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForColor(Color color) {
    if (color == const Color(0xFF4CAF50)) return Icons.sentiment_satisfied_rounded;
    if (color == const Color(0xFF2196F3)) return Icons.extension_rounded;
    if (color == const Color(0xFF9C27B0)) return Icons.psychology_rounded;
    return Icons.games_rounded;
  }
}
