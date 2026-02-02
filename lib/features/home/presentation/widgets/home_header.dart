import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/progress_service.dart';

/// Modern Animated Home Header - Edge to edge with smooth animations
/// Features: Dynamic greeting, streak counter, animated notification bell
class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> with TickerProviderStateMixin {
  late AnimationController _greetingController;
  late AnimationController _bellController;
  late Animation<double> _greetingFade;
  late Animation<Offset> _greetingSlide;
  late Animation<double> _bellRotation;
  
  final ProgressService _progressService = ProgressService();
  bool _showNotificationBadge = true;

  @override
  void initState() {
    super.initState();
    _initProgress();
    _progressService.addListener(_onProgressChanged);
    
    // Greeting animation
    _greetingController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _greetingFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _greetingController, curve: Curves.easeOut),
    );
    _greetingSlide = Tween<Offset>(
      begin: const Offset(-0.2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _greetingController, curve: Curves.easeOutCubic));
    
    // Bell animation
    _bellController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _bellRotation = Tween<double>(begin: 0, end: 0.1).animate(
      CurvedAnimation(parent: _bellController, curve: Curves.elasticIn),
    );
    
    // Start animations
    _greetingController.forward();
    
    // Wiggle bell if there's a notification
    if (_showNotificationBadge) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (mounted) _wiggleBell();
      });
    }
  }

  Future<void> _initProgress() async {
    await _progressService.init();
    if (mounted) setState(() {});
  }

  void _onProgressChanged() {
    if (mounted) setState(() {});
  }

  void _wiggleBell() async {
    await _bellController.forward();
    await _bellController.reverse();
    await _bellController.forward();
    await _bellController.reverse();
  }

  @override
  void dispose() {
    _greetingController.dispose();
    _bellController.dispose();
    _progressService.removeListener(_onProgressChanged);
    super.dispose();
  }

  String _toBengaliNumber(int number) {
    const bengaliDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    return number.toString().split('').map((d) => bengaliDigits[int.parse(d)]).join();
  }

  String get _greeting {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) return 'সুপ্রভাত!';
    if (hour >= 12 && hour < 17) return 'শুভ দুপুর!';
    if (hour >= 17 && hour < 21) return 'শুভ সন্ধ্যা!';
    return 'শুভ রাত্রি!';
  }

  String get _greetingEmoji {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) return '☀️';
    if (hour >= 12 && hour < 17) return '🌤️';
    if (hour >= 17 && hour < 21) return '🌅';
    return '🌙';
  }

  void _showNotificationSheet(BuildContext context) {
    HapticFeedback.mediumImpact();
    setState(() => _showNotificationBadge = false);
    
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        margin: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: EdgeInsets.only(top: 12.h),
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  // Header
                  Row(
                    children: [
                      Icon(
                        Icons.notifications_active_rounded,
                        color: const Color(0xFF1B5E5E),
                        size: 24.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'বিজ্ঞপ্তি',
                        style: TextStyle(
                          fontFamily: 'NotoSansBengali',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textMain,
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 20.h),
                  
                  // Notification items
                  _NotificationItem(
                    emoji: '🎉',
                    title: 'দারুণ শুরু!',
                    subtitle: 'তুমি আজ ${_toBengaliNumber(_progressService.todayLearned)}টি নতুন শব্দ শিখেছ',
                    time: 'এইমাত্র',
                    color: const Color(0xFFE8F5E9),
                  ),
                  SizedBox(height: 12.h),
                  _NotificationItem(
                    emoji: '🔥',
                    title: '${_toBengaliNumber(_progressService.currentStreak)} দিনের স্ট্রিক!',
                    subtitle: 'প্রতিদিন শিখে স্ট্রিক ধরে রাখো',
                    time: 'আজ',
                    color: const Color(0xFFFFF3E0),
                  ),
                  SizedBox(height: 12.h),
                  _NotificationItem(
                    emoji: '🎮',
                    title: 'খেলায় জিতেছ!',
                    subtitle: 'মোট ${_toBengaliNumber(_progressService.gamesWon)}টি খেলায় জয়ী',
                    time: 'গতকাল',
                    color: const Color(0xFFE3F2FD),
                  ),
                  
                  SizedBox(height: 20.h),
                  
                  // Close button
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF1B5E5E).withOpacity(0.1),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        'বন্ধ করুন',
                        style: TextStyle(
                          fontFamily: 'NotoSansBengali',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1B5E5E),
                        ),
                      ),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.warmCream, // Match page background
      child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Animated Greeting
              SlideTransition(
                position: _greetingSlide,
                child: FadeTransition(
                  opacity: _greetingFade,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            _greeting,
                            style: TextStyle(
                              fontFamily: 'NotoSansBengali',
                              fontSize: 26.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textMain,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            _greetingEmoji,
                            style: TextStyle(fontSize: 24.sp),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      // Streak indicator
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF3E0),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('🔥', style: TextStyle(fontSize: 12.sp)),
                                SizedBox(width: 4.w),
                                Text(
                                  '${_toBengaliNumber(_progressService.currentStreak)} দিন',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansBengali',
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFD97706),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'আজ শিখেছ: ${_toBengaliNumber(_progressService.todayLearned)}টি শব্দ',
                            style: TextStyle(
                              fontFamily: 'NotoSansBengali',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              // Animated Notification Bell
              GestureDetector(
                onTap: () => _showNotificationSheet(context),
                child: AnimatedBuilder(
                  animation: _bellController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _bellRotation.value * 3.14159,
                      child: child,
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: 48.w,
                        height: 48.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.notifications_none_rounded,
                          size: 24.sp,
                          color: const Color(0xFF1B5E5E),
                        ),
                      ),
                      // Notification badge
                      if (_showNotificationBadge)
                        Positioned(
                          right: 2.w,
                          top: 2.h,
                          child: Container(
                            width: 14.w,
                            height: 14.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEF4444),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Center(
                              child: Text(
                                '3',
                                style: TextStyle(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}

/// Notification Item Widget
class _NotificationItem extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final String time;
  final Color color;

  const _NotificationItem({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Text(emoji, style: TextStyle(fontSize: 28.sp)),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 12.sp,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 11.sp,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
