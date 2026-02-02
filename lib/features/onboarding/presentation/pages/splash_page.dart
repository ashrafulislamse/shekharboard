import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Screen 2: Splash Screen
/// Purpose: Brand intro + asset verification
/// Design: Updated to match uisample.md with floating Bengali letters
class SplashPage extends StatefulWidget {
  final Future<bool> Function() onVerifyAssets;
  final VoidCallback onAssetsVerified;
  final VoidCallback onAssetsFailed;

  const SplashPage({
    super.key,
    required this.onVerifyAssets,
    required this.onAssetsVerified,
    required this.onAssetsFailed,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController? _breatheController;
  AnimationController? _progressController;
  AnimationController? _dotsController;
  AnimationController? _floatController;
  Animation<double>? _breatheAnimation;
  Animation<double>? _opacityAnimation;
  
  bool _animationsInitialized = false;
  double _progress = 0.0;
  
  // Floating letters data: Bengali vowels and numbers (from HTML)
  final List<_FloatingLetter> _floatingLetters = [
    // Top Left 'অ' - w-16 h-16, top 10%, left 8%, -rotate-12
    _FloatingLetter(char: 'অ', top: 0.10, left: 0.08, size: 64, rotation: -12, color: AppColors.darkTeal),
    // Top Right '১' - w-12 h-12, top 15%, right 10%, rotate-6
    _FloatingLetter(char: '১', top: 0.15, right: 0.10, size: 48, rotation: 6, color: const Color(0xFFD97706)),
    // Middle Left 'আ' - w-20 h-20, top 40%, left -2%, rotate-12
    _FloatingLetter(char: 'আ', top: 0.40, left: -0.02, size: 80, rotation: 12, color: AppColors.darkTeal),
    // Middle Right '২' - w-14 h-14, top 50%, right 5%, -rotate-6
    _FloatingLetter(char: '২', top: 0.50, right: 0.05, size: 56, rotation: -6, color: const Color(0xFFD97706)),
    // Bottom Left '৩' - w-10 h-10, bottom 20%, left 12%
    _FloatingLetter(char: '৩', bottom: 0.20, left: 0.12, size: 40, rotation: 0, color: AppColors.darkTeal),
  ];
  
  // Additional floating decorative elements from HTML
  final List<_FloatingDecor> _floatingDecor = [
    // Leaf icon - top 25%, right 30%
    _FloatingDecor(icon: Icons.eco, top: 0.25, right: 0.30, size: 36, color: AppColors.accentGreen, opacity: 0.4),
    // Bird placeholder - top 8%, left 40%  
    _FloatingDecor(icon: Icons.flutter_dash, top: 0.08, left: 0.40, size: 48, color: const Color(0xFF1c5f5f), opacity: 0.6),
    // Tiger cub placeholder - bottom 25%, right 20%
    _FloatingDecor(icon: Icons.pets, bottom: 0.25, right: 0.20, size: 56, color: const Color(0xFFD97706), opacity: 0.7),
  ];

  @override
  void initState() {
    super.initState();
    // Defer heavy work to after first frame renders
    // This prevents blocking the UI thread during startup
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initAnimations();
      // Further defer verification to let animations initialize
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) _startVerification();
      });
    });
  }

  void _initAnimations() {
    if (_animationsInitialized) return;
    _animationsInitialized = true;
    
    // Mascot soft breathe animation (4s like HTML mockup)
    _breatheController = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    )..repeat(reverse: true);

    _breatheAnimation = Tween<double>(begin: 1.0, end: 1.03).animate(
      CurvedAnimation(parent: _breatheController!, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _breatheController!, curve: Curves.easeInOut),
    );

    // Floating letters pulse animation
    _floatController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    // Dots wave animation (1.4s like HTML mockup)
    _dotsController = AnimationController(
      duration: const Duration(milliseconds: 1400),
      vsync: this,
    )..repeat();

    // Progress bar animation
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    
    // Trigger rebuild to show animations
    if (mounted) setState(() {});
  }

  Future<void> _startVerification() async {
    // Minimum splash duration: 500ms (quick since native splash already shown)
    final minDuration = Future.delayed(const Duration(milliseconds: 500));

    // Simulate progress while verifying
    _progressController?.addListener(() {
      if (mounted) {
        setState(() {
          _progress = _progressController?.value ?? 0.0;
        });
      }
    });
    _progressController?.forward();

    try {
      // Wait for both minimum duration and asset verification
      final results = await Future.wait([
        minDuration,
        widget.onVerifyAssets(),
      ]);

      debugPrint('📦 Results: $results');
      final assetsOk = results[1] as bool;
      debugPrint('📦 assetsOk: $assetsOk');

      if (!mounted) return; // Check if widget is still mounted
      
      setState(() {
        _progress = 1.0;
      });

      if (!mounted) return;
      
      if (assetsOk) {
        debugPrint('✅ Calling onAssetsVerified');
        widget.onAssetsVerified();
      } else {
        debugPrint('❌ Calling onAssetsFailed (assetsOk=false)');
        widget.onAssetsFailed();
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Exception in verification: $e');
      debugPrint('$stackTrace');
      widget.onAssetsFailed();
    }
  }

  @override
  void dispose() {
    _breatheController?.dispose();
    _progressController?.dispose();
    _dotsController?.dispose();
    _floatController?.dispose();
    super.dispose();
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
            // Background gradient (from uisample.md: from #E8F5F3 to #FFF8E7)
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFE8F5F3), // Light teal
                    Color(0xFFFFF8E7), // Light cream/yellow
                  ],
                ),
              ),
            ),
            
            // Decorative blur blob at top
            Positioned(
              top: -80.h,
              right: -0.2.sw,
              child: Container(
                width: 0.8.sw,
                height: 0.8.sw,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accentGreen.withValues(alpha: 0.05),
                ),
              ),
            ),
            
            // Decorative blur blob at bottom
            Positioned(
              bottom: -0.05.sh,
              left: -0.1.sw,
              child: Container(
                width: 0.6.sw,
                height: 0.6.sw,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accentGreen.withValues(alpha: 0.1),
                ),
              ),
            ),
            
            // Floating Bengali letters (from uisample.md)
            ..._buildFloatingLetters(),
            
            // Floating decorative icons (tiger, bird, leaf from HTML)
            ..._buildFloatingDecor(),

            // Main content
            SafeArea(
              child: Column(
                children: [
                  // Top spacer (reduced for small screens)
                  SizedBox(height: 0.08.sh),

                  // Center Content: Mascot & Title
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Mascot with glow and breathe animation
                          _buildMascot(),

                          SizedBox(height: 24.h),

                          // Title with subtitle
                          _buildTitle(),
                        ],
                      ),
                    ),
                  ),

                  // Bottom Section: Loading indicators
                  Padding(
                    padding: EdgeInsets.only(bottom: 32.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Wave dots
                        _buildLoadingDots(),

                        SizedBox(height: 16.h),

                        // Progress bar
                        _buildProgressBar(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMascot() {
    // If animations not ready, show static mascot
    if (_breatheController == null) {
      return _buildStaticMascot();
    }
    
    return AnimatedBuilder(
      animation: _breatheController!,
      builder: (context, child) {
        return Transform.scale(
          scale: _breatheAnimation?.value ?? 1.0,
          child: Opacity(
            opacity: (_opacityAnimation?.value ?? 1.0).clamp(0.0, 1.0),
            child: _buildMascotContent(),
          ),
        );
      },
    );
  }
  
  Widget _buildStaticMascot() {
    return _buildMascotContent();
  }
  
  Widget _buildMascotContent() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Glow effect (from HTML: w-64 h-64 bg-white/40 blur-3xl)
        Container(
          width: 256.w,
          height: 256.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.4),
                blurRadius: 60.r,
                spreadRadius: 20.r,
              ),
            ],
          ),
        ),
        // Main mascot container (w-64 h-64 from HTML)
        Container(
          width: 256.w,
          height: 256.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: Image.asset(
              'assets/images/mascot.png',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                // Fallback to owl emoji (HTML shows owl mascot)
                return Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Text('🦉📚', style: TextStyle(fontSize: 80.sp)),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        // Main Title - শেখার বোর্ড (Shekhar Board)
        Text(
          'শেখার বোর্ড',
          style: TextStyle(
            fontSize: 44.sp,
            fontWeight: FontWeight.w800,
            color: AppColors.darkTeal,
            fontFamily: 'NotoSansBengali',
            letterSpacing: -0.5,
            height: 1.1,
            shadows: [
              Shadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        // Decorative line (from uisample.md)
        Container(
          width: 64.w,
          height: 6.h,
          decoration: BoxDecoration(
            color: AppColors.accentGreen,
            borderRadius: BorderRadius.circular(3.r),
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingDots() {
    // 3 dots (from uisample.md) instead of 5
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        // Opacity fades from left to right
        final opacity = index == 0 
            ? 1.0 
            : index == 1 
                ? 0.7 
                : 0.4;

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 6.w),
          width: 14.w,
          height: 14.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.accentGreen.withValues(alpha: opacity),
          ),
        );
      }),
    );
  }

  Widget _buildProgressBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 64.w),
      child: Column(
        children: [
          // Progress bar track
          ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: Container(
              height: 6.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.darkTeal.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: _progress,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.accentGreen,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          // Loading text and percentage
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'LOADING',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkTeal.withValues(alpha: 0.4),
                  letterSpacing: 2,
                ),
              ),
              Text(
                '${(_progress * 100).toInt()}%',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkTeal.withValues(alpha: 0.4),
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  /// Builds floating Bengali letters with pulse animation
  List<Widget> _buildFloatingLetters() {
    // If animations not ready, return static positioned elements
    if (_floatController == null) {
      return _floatingLetters.map((letter) {
        return Builder(builder: (context) {
          return Positioned(
            top: letter.top != null ? letter.top! * MediaQuery.of(context).size.height : null,
            bottom: letter.bottom != null ? letter.bottom! * MediaQuery.of(context).size.height : null,
            left: letter.left != null ? letter.left! * MediaQuery.of(context).size.width : null,
            right: letter.right != null ? letter.right! * MediaQuery.of(context).size.width : null,
            child: _buildLetterContent(letter),
          );
        });
      }).toList();
    }
    
    return _floatingLetters.map((letter) {
      return AnimatedBuilder(
        animation: _floatController!,
        builder: (context, child) {
          // Subtle pulse scale effect
          final scale = 1.0 + 0.05 * math.sin(_floatController!.value * math.pi);
          
          return Positioned(
            top: letter.top != null ? letter.top! * MediaQuery.of(context).size.height : null,
            bottom: letter.bottom != null ? letter.bottom! * MediaQuery.of(context).size.height : null,
            left: letter.left != null ? letter.left! * MediaQuery.of(context).size.width : null,
            right: letter.right != null ? letter.right! * MediaQuery.of(context).size.width : null,
            child: Transform.scale(
              scale: scale,
              child: _buildLetterContent(letter),
            ),
          );
        },
      );
    }).toList();
  }
  
  Widget _buildLetterContent(_FloatingLetter letter) {
    return Transform.rotate(
      angle: letter.rotation * math.pi / 180,
      child: Container(
        width: letter.size.w,
        height: letter.size.w,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.4),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            letter.char,
            style: TextStyle(
              fontSize: (letter.size * 0.6).sp,
              fontWeight: FontWeight.bold,
              color: letter.color.withValues(alpha: 0.8),
              fontFamily: 'NotoSansBengali',
            ),
          ),
        ),
      ),
    );
  }
  
  /// Builds floating decorative icons (tiger, bird, leaf from HTML)
  List<Widget> _buildFloatingDecor() {
    // If animations not ready, return static positioned elements
    if (_floatController == null) {
      return _floatingDecor.map((decor) {
        return Builder(builder: (context) {
          return Positioned(
            top: decor.top != null ? decor.top! * MediaQuery.of(context).size.height : null,
            bottom: decor.bottom != null ? decor.bottom! * MediaQuery.of(context).size.height : null,
            left: decor.left != null ? decor.left! * MediaQuery.of(context).size.width : null,
            right: decor.right != null ? decor.right! * MediaQuery.of(context).size.width : null,
            child: _buildDecorContent(decor),
          );
        });
      }).toList();
    }
    
    return _floatingDecor.map((decor) {
      return AnimatedBuilder(
        animation: _floatController!,
        builder: (context, child) {
          final scale = 1.0 + 0.03 * math.sin(_floatController!.value * math.pi);
          
          return Positioned(
            top: decor.top != null ? decor.top! * MediaQuery.of(context).size.height : null,
            bottom: decor.bottom != null ? decor.bottom! * MediaQuery.of(context).size.height : null,
            left: decor.left != null ? decor.left! * MediaQuery.of(context).size.width : null,
            right: decor.right != null ? decor.right! * MediaQuery.of(context).size.width : null,
            child: Transform.scale(
              scale: scale,
              child: _buildDecorContent(decor),
            ),
          );
        },
      );
    }).toList();
  }
  
  Widget _buildDecorContent(_FloatingDecor decor) {
    return Opacity(
      opacity: decor.opacity,
      child: Container(
        width: decor.size.w,
        height: decor.size.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withValues(alpha: 0.3),
        ),
        child: Icon(
          decor.icon,
          size: (decor.size * 0.6).sp,
          color: decor.color,
        ),
      ),
    );
  }
}

/// Model for floating letter decorations
class _FloatingLetter {
  final String char;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double size;
  final double rotation;
  final Color color;
  
  const _FloatingLetter({
    required this.char,
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.size,
    required this.rotation,
    required this.color,
  });
}

/// Model for floating icon decorations (tiger, bird, leaf)
class _FloatingDecor {
  final IconData icon;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double size;
  final Color color;
  final double opacity;
  
  const _FloatingDecor({
    required this.icon,
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.size,
    required this.color,
    required this.opacity,
  });
}
