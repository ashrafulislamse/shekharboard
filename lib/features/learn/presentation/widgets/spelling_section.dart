import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Spelling breakdown section showing word parts for Item Detail Page
class SpellingSection extends StatelessWidget {
  final List<String> parts;
  final String fullWord;
  final Color accentColor;

  const SpellingSection({
    super.key,
    required this.parts,
    required this.fullWord,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          // Label
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              'বানান করো',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primary.withOpacity(0.6),
              ),
            ),
          ),

          SizedBox(height: 12.h),

          // Spelling boxes
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...parts.asMap().entries.expand((entry) {
                final isLast = entry.key == parts.length - 1;
                return [
                  _SpellingBox(letter: entry.value),
                  if (!isLast) ...[
                    SizedBox(width: 8.w),
                    Text(
                      '+',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    SizedBox(width: 8.w),
                  ],
                ];
              }),
              SizedBox(width: 8.w),
              Text(
                '=',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey.shade300,
                ),
              ),
              SizedBox(width: 8.w),
              _SpellingBox(
                letter: fullWord,
                isResult: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Individual spelling box
class _SpellingBox extends StatelessWidget {
  final String letter;
  final bool isResult;

  const _SpellingBox({
    required this.letter,
    this.isResult = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 56.w),
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: isResult ? 20.w : 0),
      decoration: BoxDecoration(
        color: isResult ? const Color(0xFFE8F5E9) : Colors.white,
        border: Border.all(
          color: isResult ? const Color(0xFFC8E6C9) : Colors.grey.shade100,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          letter,
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
            color: isResult ? const Color(0xFF2E7D32) : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
