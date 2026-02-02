import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Screen 3: Welcome Screen (One-Time)
/// Purpose: Build trust with parents - show 4 key features
/// Design: Updated to match uisample.md with trust cards
class WelcomePage extends StatefulWidget {
  final VoidCallback onStart;

  const WelcomePage({
    super.key,
    required this.onStart,
  });

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  late AnimationController _staggerController;
  late List<Animation<double>> _cardAnimations;
  late Animation<double> _buttonAnimation;
  late Animation<double> _headerAnimation;

  // Feature data (from uisample.md)
  final List<_FeatureData> _features = [
    _FeatureData(
      icon: Icons.check_circle,
      titleBn: 'সম্পূর্ণ অফলাইন',
      subtitleBn: 'ইন্টারনেট সংযোগ প্রয়োজন নেই',
    ),
    _FeatureData(
      icon: Icons.check_circle,
      titleBn: 'কোনো বিজ্ঞাপন নেই',
      subtitleBn: 'শিশুদের জন্য নিরাপদ পরিবেশ',
    ),
    _FeatureData(
      icon: Icons.check_circle,
      titleBn: 'বাংলাদেশী শিশুদের জন্য',
      subtitleBn: 'সাংস্কৃতিক ও ভাষাগতভাবে উপযুক্ত',
    ),
    _FeatureData(
      icon: Icons.check_circle,
      titleBn: 'নিরাপদ ও শিক্ষামূলক ডিজাইন',
      subtitleBn: 'অভিভাবকদের দ্বারা পরীক্ষিত',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    _staggerController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..forward();

    // Header fade in + slide down
    _headerAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _staggerController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    // Staggered card animations
    _cardAnimations = List.generate(4, (index) {
      final start = 0.15 + (index * 0.1);
      final end = start + 0.25;
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _staggerController,
          curve: Interval(start, end.clamp(0.0, 1.0), curve: Curves.easeOut),
        ),
      );
    });

    // Button scale up + fade (use easeOutBack instead of elasticOut to stay <= 1.0)
    _buttonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _staggerController,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOutCubic),
      ),
    );
  }

  @override
  void dispose() {
    _staggerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Cream background like uisample.md (#FAF6F0)
    const backgroundColor = AppColors.warmCream;
    
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 16.h),
              
              // Hero Section (Header) - reduced size
              AnimatedBuilder(
                animation: _headerAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _headerAnimation.value,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - _headerAnimation.value)),
                      child: child,
                    ),
                  );
                },
                child: _buildHeader(),
              ),

              SizedBox(height: 16.h),

              // Feature Cards (scrollable if needed)
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: List.generate(_features.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: AnimatedBuilder(
                          animation: _cardAnimations[index],
                          builder: (context, child) {
                            return Opacity(
                              opacity: _cardAnimations[index].value,
                              child: Transform.translate(
                                offset: Offset(
                                  -30 * (1 - _cardAnimations[index].value),
                                  0,
                                ),
                                child: child,
                              ),
                            );
                          },
                          child: _buildFeatureCard(_features[index]),
                        ),
                      );
                    }),
                  ),
              ),
            ),

            // Sticky Bottom CTA Button
            AnimatedBuilder(
              animation: _buttonAnimation,
              builder: (context, child) {
                final value = _buttonAnimation.value.clamp(0.0, 1.0);
                return Transform.scale(
                  scale: 0.9 + (0.1 * value),
                  child: Opacity(
                    opacity: value,
                    child: child,
                  ),
                );
              },
              child: _buildStartButton(),
            ),
          ],
        ),
      ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          // Circular Logo (from uisample.md)
          Container(
            width: 100.w,
            height: 100.w,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 12.r,
                  offset: Offset(0, 3.h),
                ),
              ],
            ),
            padding: EdgeInsets.all(12.w),
            child: ClipOval(
              child: Image.asset(
                'assets/images/mascot.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text('🐄', style: TextStyle(fontSize: 40.sp)),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 16.h),
          // Welcome Text (স্বাগতম!)
          Text(
            'স্বাগতম!',
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.darkTeal,
              fontFamily: 'NotoSansBengali',
              letterSpacing: -0.5,
            ),
          ),
          SizedBox(height: 4.h),
          // Subtitle
          Text(
            'শেখার বোর্ড-এ আপনাকে স্বাগতম',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF4B5563),
              fontFamily: 'NotoSansBengali',
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(_FeatureData feature) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Row(
        children: [
          // Check icon in circle (from uisample.md)
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: AppColors.accentGreen.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_circle,
              color: AppColors.accentGreen,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 12.w),
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  feature.titleBn,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF141514),
                    fontFamily: 'NotoSansBengali',
                    height: 1.2,
                  ),
                ),
                Text(
                  feature.subtitleBn,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: const Color(0xFF6B7280),
                    fontFamily: 'NotoSansBengali',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: () {
                HapticFeedback.lightImpact();
                widget.onStart();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentGreen,
                foregroundColor: Colors.white,
                elevation: 4,
                shadowColor: AppColors.accentGreen.withValues(alpha: 0.15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'শুরু করুন',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSansBengali',
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Icon(Icons.arrow_forward, size: 18.sp),
                ],
              ),
            ),
          ),
          SizedBox(height: 8.h),
          // Terms text
          Text(
            'By continuing you agree to our Terms & Privacy Policy',
            style: TextStyle(
              fontSize: 10.sp,
              color: const Color(0xFF9CA3AF),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Feature data model
class _FeatureData {
  final IconData icon;
  final String titleBn;
  final String subtitleBn;

  _FeatureData({
    required this.icon,
    required this.titleBn,
    required this.subtitleBn,
  });
}
