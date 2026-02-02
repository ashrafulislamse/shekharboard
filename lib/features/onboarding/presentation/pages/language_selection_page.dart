import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Screen 1: Language Selection (First Launch Only)
/// Purpose: Parent chooses interface language before anything else
/// Design: Updated to match uisample.md - cow mascot, pill buttons
class LanguageSelectionPage extends StatefulWidget {
  final VoidCallback onLanguageSelected;
  final bool showBackButton;

  const LanguageSelectionPage({
    super.key,
    required this.onLanguageSelected,
    this.showBackButton = false,
  });

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage>
    with TickerProviderStateMixin {
  late AnimationController _mascotController;
  late Animation<double> _mascotBounce;
  String _selectedLanguage = 'bn'; // Default to Bengali

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    // Mascot hover/bounce animation
    _mascotController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _mascotBounce = Tween<double>(begin: 0, end: -8).animate(
      CurvedAnimation(parent: _mascotController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _mascotController.dispose();
    super.dispose();
  }

  void _selectLanguage(String languageCode) {
    HapticFeedback.lightImpact();
    setState(() {
      _selectedLanguage = languageCode;
    });
    // Auto-proceed after selection
    Future.delayed(const Duration(milliseconds: 300), () {
      widget.onLanguageSelected();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.warmCream,
        body: Stack(
          children: [
            // Background blur blobs (decorative)
            Positioned(
              top: -0.1.sh,
              right: -0.1.sw,
              child: Container(
                width: 256.w,
                height: 256.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEDD5).withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: 0.2.sh,
              left: -0.1.sw,
              child: Container(
                width: 256.w,
                height: 256.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4).withValues(alpha: 0.6),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 
                      MediaQuery.of(context).padding.top - 
                      MediaQuery.of(context).padding.bottom - 64.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top section
                    Column(
                      children: [
                        // Back button when shown from settings
                        if (widget.showBackButton) ...[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: Icon(
                                Icons.arrow_back,
                                color: AppColors.darkTeal,
                                size: 24.w,
                              ),
                            ),
                          ),
                        ],
                        
                        SizedBox(height: 16.h),

                        // Mascot with bounce animation
                        AnimatedBuilder(
                          animation: _mascotController,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(0, _mascotBounce.value),
                              child: child,
                            );
                          },
                          child: _buildMascot(),
                        ),

                        SizedBox(height: 24.h),

                        // App Title
                        _buildTitle(),
                      ],
                    ),

                    // Bottom section
                    Column(
                      children: [
                        SizedBox(height: 32.h),
                        
                        // Language Buttons
                        _buildLanguageButtons(),

                        SizedBox(height: 24.h),

                        // Info Box
                        _buildInfoBox(),

                        SizedBox(height: 16.h),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildMascot() {
    return Container(
      width: 140.w,
      height: 140.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Image.asset(
          'assets/images/mascot.png',
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            // Fallback to emoji if image not found
            return Container(
              decoration: BoxDecoration(
                color: AppColors.accentGreen.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Center(
                child: Text('🐄💛', style: TextStyle(fontSize: 80.sp)),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        Text(
          'শেখার বোর্ড',
          style: TextStyle(
            fontSize: 36.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF151D19),
            fontFamily: 'NotoSansBengali',
            shadows: [
              Shadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Shekhar Board',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.darkTeal.withValues(alpha: 0.8),
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageButtons() {
    return Column(
      children: [
        // Section Title
        Text(
          'পিতা-মাতার ইন্টারফেস ভাষা',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.darkTeal,
            fontFamily: 'NotoSansBengali',
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 2.h),
        Text(
          '(Choose Parent Language)',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
            color: AppColors.darkTeal.withValues(alpha: 0.6),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24.h),
        
        // Primary: Bengali Button (pill-shaped, filled)
        _LanguageButton(
          isPrimary: true,
          isSelected: _selectedLanguage == 'bn',
          labelBn: 'বাংলা',
          labelEn: 'Bengali',
          onTap: () => _selectLanguage('bn'),
        ),

        SizedBox(height: 16.h),

        // Secondary: English Button (pill-shaped, outlined)
        _LanguageButton(
          isPrimary: false,
          isSelected: _selectedLanguage == 'en',
          labelBn: null,
          labelEn: 'English',
          onTap: () => _selectLanguage('en'),
        ),
      ],
    );
  }

  Widget _buildInfoBox() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD54F).withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFFFFD54F).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline,
            color: const Color(0xFFF9A825),
            size: 20.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'শিশুর কন্টেন্ট সবসময় বাংলায় থাকবে',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkTeal,
                    fontFamily: 'NotoSansBengali',
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Child content will always remain in Bangla',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.darkTeal.withValues(alpha: 0.7),
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Language Button Widget (pill-shaped from uisample.md)
class _LanguageButton extends StatefulWidget {
  final bool isPrimary;
  final bool isSelected;
  final String? labelBn;
  final String labelEn;
  final VoidCallback onTap;

  const _LanguageButton({
    required this.isPrimary,
    required this.isSelected,
    this.labelBn,
    required this.labelEn,
    required this.onTap,
  });

  @override
  State<_LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<_LanguageButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.isPrimary
        ? AppColors.accentGreen
        : Colors.transparent;
    final textColor = widget.isPrimary
        ? Colors.white
        : AppColors.darkTeal;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          width: double.infinity,
          height: 52.h, // Standard button height
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(26.r), // Pill shape
            border: widget.isPrimary
                ? null
                : Border.all(color: AppColors.darkTeal, width: 1.5),
            boxShadow: widget.isPrimary
                ? [
                    BoxShadow(
                      color: AppColors.accentGreen.withValues(alpha: 0.15),
                      blurRadius: 12.r,
                      offset: Offset(0, 3.h),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.labelBn != null) ...[
                // Bengali + English on same line
                Text(
                  widget.labelBn!,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontFamily: 'NotoSansBengali',
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  '(${widget.labelEn})',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: textColor.withValues(alpha: 0.8),
                  ),
                ),
              ] else ...[
                // English only
                Text(
                  widget.labelEn,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
              // Checkmark for selected state
              if (widget.isSelected) ...[
                SizedBox(width: 10.w),
                Icon(
                  Icons.check_circle,
                  color: textColor,
                  size: 20.sp,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
