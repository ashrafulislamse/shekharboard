import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Alphabet Card - Square cards for alphabet/numbers section
class AlphabetCard extends StatelessWidget {
  final String titleBn;
  final Color color;
  final String symbol;
  final VoidCallback? onTap;

  const AlphabetCard({
    super.key,
    required this.titleBn,
    required this.color,
    required this.symbol,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Symbol area
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      color.withValues(alpha: 0.15),
                      color.withValues(alpha: 0.08),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    symbol,
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ),
              ),
            ),

            // Title
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Text(
                titleBn,
                style: TextStyle(
                  fontFamily: 'NotoSansBengali',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
