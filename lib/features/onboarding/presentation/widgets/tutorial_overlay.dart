import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

/// Screen 4: Tutorial Overlay (3-Step Progressive)
/// Purpose: Teach gestures progressively
/// Design: Updated to match uisample.md - dark overlay with highlighted elements
class TutorialOverlay extends StatefulWidget {
  final VoidCallback onComplete;
  final VoidCallback onSkip;

  const TutorialOverlay({
    super.key,
    required this.onComplete,
    required this.onSkip,
  });

  @override
  State<TutorialOverlay> createState() => _TutorialOverlayState();
}

class _TutorialOverlayState extends State<TutorialOverlay>
    with TickerProviderStateMixin {
  int _currentStep = 0;
  bool _showSkipButton = false;
  Timer? _autoAdvanceTimer;
  Timer? _skipButtonTimer;

  late AnimationController _handController;
  late AnimationController _glowController;
  late Animation<double> _handAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _startSkipButtonTimer();
  }

  void _initAnimations() {
    _handController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _glowController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0.2, end: 0.5).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    _updateHandAnimation();
  }

  void _updateHandAnimation() {
    switch (_currentStep) {
      case 0: // Tap - bounce down
        _handAnimation = Tween<double>(begin: 0, end: 20).animate(
          CurvedAnimation(parent: _handController, curve: Curves.easeOut),
        );
        break;
      case 1: // Swipe - slide left-right
        _handAnimation = Tween<double>(begin: -60, end: 60).animate(
          CurvedAnimation(parent: _handController, curve: Curves.easeInOut),
        );
        break;
      case 2: // Exit - point up
        _handAnimation = Tween<double>(begin: 0, end: -15).animate(
          CurvedAnimation(parent: _handController, curve: Curves.easeOut),
        );
        break;
    }
  }

  void _startSkipButtonTimer() {
    _skipButtonTimer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _showSkipButton = true;
        });
      }
    });
  }

  void _nextStep() {
    HapticFeedback.lightImpact();
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
        _updateHandAnimation();
      });
    } else {
      widget.onComplete();
    }
  }

  @override
  void dispose() {
    _autoAdvanceTimer?.cancel();
    _skipButtonTimer?.cancel();
    _handController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Dark overlay (70% black with blur - from uisample.md)
          Container(
            color: Colors.black.withValues(alpha: 0.7),
          ),

          // Content based on step
          SafeArea(
            child: Column(
              children: [
                // Top area - Exit button highlight for step 3
                if (_currentStep == 2) _buildExitButtonArea(),
                
                // Spacer
                if (_currentStep != 2) SizedBox(height: 80.h),

                // Instructions text
                _buildInstructions(),

                const Spacer(),

                // Highlighted content area
                if (_currentStep != 2) _buildHighlightedContent(),
                
                const Spacer(),

                // Step indicators (pagination dots)
                _buildStepIndicators(),

                SizedBox(height: AppSpacing.lg.h),

                // Skip / Got it button
                _buildBottomButton(),

                SizedBox(height: AppSpacing.xl.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExitButtonArea() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
      child: Row(
        children: [
          // Highlighted X button (from uisample.md - Exit Tutorial)
          GestureDetector(
            onTap: _nextStep,
            child: AnimatedBuilder(
              animation: _glowController,
              builder: (context, child) {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withValues(alpha: _glowAnimation.value),
                        blurRadius: 20.r,
                        spreadRadius: 5.r,
                      ),
                    ],
                  ),
                  child: Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.w),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 28.sp,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 16.w),
          // Animated hand pointing to X button
          AnimatedBuilder(
            animation: _handController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _handAnimation.value),
                child: Transform.rotate(
                  angle: math.pi / 2, // Point left
                  child: Icon(
                    Icons.pan_tool_alt,
                    color: Colors.white,
                    size: 48.sp,
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 0.5),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInstructions() {
    final instructions = [
      'ছবিতে টিপুন',     // Tap the picture
      'পাশে সোয়াইপ করো',  // Swipe sideways
      'বের হতে এখানে টিপুন',  // Tap here to exit
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
      child: Text(
        instructions[_currentStep],
        style: TextStyle(
          fontSize: _currentStep == 2 ? 28.sp : 32.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
          fontFamily: 'NotoSansBengali',
          shadows: [
            Shadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildHighlightedContent() {
    return AnimatedBuilder(
      animation: _handController,
      builder: (context, child) {
        if (_currentStep == 0) {
          // Step 1: Tap tutorial - show animal card grid with one highlighted
          return _buildTapTutorialContent();
        } else {
          // Step 2: Swipe tutorial - show card carousel
          return _buildSwipeTutorialContent();
        }
      },
    );
  }

  Widget _buildTapTutorialContent() {
    return Column(
      children: [
        // Highlighted card with glow (Cow - গরু)
        GestureDetector(
          onTap: _nextStep,
          child: AnimatedBuilder(
            animation: _glowController,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accentGreen.withValues(alpha: _glowAnimation.value),
                      blurRadius: 30.r,
                      spreadRadius: 5.r,
                    ),
                  ],
                ),
                child: Container(
                  width: 160.w,
                  height: 120.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1f2321),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: AppColors.accentGreen,
                      width: 4.w,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Image placeholder
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Container(
                          color: const Color(0xFF2a302c),
                          child: Center(
                            child: Text('🐄', style: TextStyle(fontSize: 48.sp)),
                          ),
                        ),
                      ),
                      // Gradient overlay
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.r),
                              bottomRight: Radius.circular(12.r),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withValues(alpha: 0.8),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Label
                      Positioned(
                        bottom: 12.h,
                        left: 12.w,
                        child: Text(
                          'গরু',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'NotoSansBengali',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 24.h),
        // Animated hand
        AnimatedBuilder(
          animation: _handController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _handAnimation.value),
              child: Icon(
                Icons.pan_tool_alt,
                color: Colors.white,
                size: 64.sp,
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSwipeTutorialContent() {
    return GestureDetector(
      onHorizontalDragEnd: (_) => _nextStep,
      onTap: _nextStep,
      child: Column(
        children: [
          // Card carousel representation
          SizedBox(
            height: 200.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Background card (Fish - মাছ)
                Positioned(
                  right: 20.w,
                  child: Container(
                    width: 140.w,
                    height: 180.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1c2620).withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('🐟', style: TextStyle(fontSize: 40.sp)),
                          SizedBox(height: 8.h),
                          Text(
                            'মাছ',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white.withValues(alpha: 0.6),
                              fontFamily: 'NotoSansBengali',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Main card (Cat - বিড়াল)
                AnimatedBuilder(
                  animation: _handController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_handAnimation.value * 0.3, 0),
                      child: Container(
                        width: 160.w,
                        height: 200.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1c2620),
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              blurRadius: 16,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('🐱', style: TextStyle(fontSize: 56.sp)),
                            SizedBox(height: 12.h),
                            Text(
                              'বিড়াল',
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'NotoSansBengali',
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Cat',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFF9db8a8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          // Swipe trail and hand
          AnimatedBuilder(
            animation: _handController,
            builder: (context, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Trail
                  Container(
                    width: 100.w,
                    height: 12.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          AppColors.accentGreen.withValues(alpha: 0.4),
                          AppColors.accentGreen.withValues(alpha: 0.8),
                        ],
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    color: AppColors.accentGreen,
                    size: 36.sp,
                  ),
                  SizedBox(width: 8.w),
                  // Hand
                  Transform.translate(
                    offset: Offset(_handAnimation.value * 0.5, 0),
                    child: Icon(
                      Icons.pan_tool_alt,
                      color: Colors.white,
                      size: 48.sp,
                      shadows: [
                        Shadow(
                          color: Colors.black.withValues(alpha: 0.5),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        final isActive = index == _currentStep;
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 6.w),
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? AppColors.white
                : AppColors.white.withValues(alpha: 0.3),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: Colors.white.withValues(alpha: 0.6),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ]
                : null,
          ),
        );
      }),
    );
  }

  Widget _buildBottomButton() {
    if (_currentStep == 2) {
      // "Got it" button on final step (from uisample.md)
      return SizedBox(
        width: 280.w,
        height: 56.h,
        child: ElevatedButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            widget.onComplete();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accentGreen,
            foregroundColor: AppColors.white,
            elevation: 8,
            shadowColor: AppColors.accentGreen.withValues(alpha: 0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          child: Text(
            'বুঝেছি!',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'NotoSansBengali',
            ),
          ),
        ),
      );
    }

    // Skip button (from uisample.md - এড়িয়ে যান)
    return AnimatedOpacity(
      opacity: _showSkipButton ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: TextButton(
        onPressed: _showSkipButton
            ? () {
                HapticFeedback.lightImpact();
                widget.onSkip();
              }
            : null,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg.w,
            vertical: AppSpacing.sm.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          ),
        ),
        child: Text(
          'এড়িয়ে যান',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.white.withValues(alpha: 0.7),
            fontFamily: 'NotoSansBengali',
          ),
        ),
      ),
    );
  }
}
