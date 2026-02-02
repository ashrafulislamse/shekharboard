import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

/// Screen 7: Critical Error Screen
/// Purpose: Graceful failure if audio missing
class CriticalErrorPage extends StatefulWidget {
  final String? errorMessage;
  final VoidCallback onClose;

  const CriticalErrorPage({
    super.key,
    this.errorMessage,
    required this.onClose,
  });

  @override
  State<CriticalErrorPage> createState() => _CriticalErrorPageState();
}

class _CriticalErrorPageState extends State<CriticalErrorPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _wobbleController;
  late Animation<double> _wobbleAnimation;

  @override
  void initState() {
    super.initState();
    _wobbleController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat(reverse: true);

    _wobbleAnimation = Tween<double>(begin: -0.05, end: 0.05).animate(
      CurvedAnimation(parent: _wobbleController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _wobbleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0), // Warm cream variant
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
          child: Column(
            children: [
              const Spacer(),

              // Sad mascot with wobble animation
              AnimatedBuilder(
                animation: _wobbleController,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _wobbleAnimation.value,
                    child: child,
                  );
                },
                child: _buildSadMascot(),
              ),

              SizedBox(height: AppSpacing.xl.h),

              // Error headline
              Text(
                'কিছু সমস্যা হয়েছে',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkTeal,
                  fontFamily: 'NotoSansBengali',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.sm.h),
              Text(
                'Something went wrong',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.mutedTeal,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: AppSpacing.lg.h),

              // Error details card
              _buildErrorCard(),

              const Spacer(),

              // Close button
              _buildCloseButton(),

              SizedBox(height: AppSpacing.xl.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSadMascot() {
    return Container(
      width: 140.w,
      height: 140.w,
      decoration: BoxDecoration(
        color: const Color(0xFFFFE4D6),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Center(
        child: Text(
          '😔🐄',
          style: TextStyle(fontSize: 60.sp),
        ),
      ),
    );
  }

  Widget _buildErrorCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.errorLight,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium.r),
        border: Border.all(
          color: AppColors.accentRed.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.broken_image,
            color: AppColors.accentRed,
            size: 28.sp,
          ),
          SizedBox(width: AppSpacing.md.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'অডিও ফাইল খুঁজে পাওয়া যায়নি',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF991B1B),
                    fontFamily: 'NotoSansBengali',
                  ),
                ),
                Text(
                  'Audio files are missing',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF991B1B),
                  ),
                ),
                SizedBox(height: AppSpacing.md.h),
                Text(
                  'অ্যাপ পুনরায় ইনস্টল করুন',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF7F1D1D),
                    fontFamily: 'NotoSansBengali',
                  ),
                ),
                Text(
                  'Please reinstall the app',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFF7F1D1D),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCloseButton() {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: () {
          HapticFeedback.mediumImpact();
          widget.onClose();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentRed,
          foregroundColor: AppColors.white,
          elevation: 4,
          shadowColor: AppColors.accentRed.withValues(alpha: 0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMedium.r),
          ),
        ),
        child: Text(
          'বন্ধ করুন / Close App',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'NotoSansBengali',
          ),
        ),
      ),
    );
  }
}
