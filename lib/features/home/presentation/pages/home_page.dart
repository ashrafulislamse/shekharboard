import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/continue_learning_card.dart';
import '../widgets/quick_access_grid.dart';
import '../widgets/popular_words_row.dart';
import '../widgets/home_header.dart';
import '../widgets/todays_word_card.dart';

/// Home Page - Main landing screen
/// Matches HTML design: Greeting, Continue Learning, Quick Access, Popular Words
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Set status bar to match background
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.warmCream,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    
    return Container(
      color: AppColors.warmCream,
      child: SafeArea(
        child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with greeting and settings
            const HomeHeader(),

            // Continue Learning Card
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const ContinueLearningCard(),
            ),

            SizedBox(height: 16.h),

            // Today's Word Card
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const TodaysWordCard(),
            ),

            SizedBox(height: 20.h),

            // Quick Access Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.w, bottom: 12.h),
                    child: Text(
                      '📌 দ্রুত প্রবেশ',
                      style: TextStyle(
                        fontFamily: 'NotoSansBengali',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textMain,
                      ),
                    ),
                  ),
                  const QuickAccessGrid(),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // Popular Words Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '⭐ জনপ্রিয় শব্দ',
                        style: TextStyle(
                          fontFamily: 'NotoSansBengali',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textMain,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to Learn page (Animals section)
                          context.go('/learn');
                        },
                        child: Text(
                          'সব দেখুন →',
                          style: TextStyle(
                            fontFamily: 'NotoSansBengali',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1B5E5E),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                const PopularWordsRow(),
              ],
            ),

            SizedBox(height: 100.h), // Space for bottom nav
          ],
        ),
      ),
      ),
    );
  }
}
