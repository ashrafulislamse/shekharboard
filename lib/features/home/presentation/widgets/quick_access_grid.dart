import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../learn/data/learn_data_repository.dart';
import '../../../learn/presentation/pages/category_grid_page.dart';

/// Quick Access Grid - 2x2 grid of main categories
/// Matches HTML: শেখা, খেলা, গল্প, বর্ণমালা
class QuickAccessGrid extends StatelessWidget {
  const QuickAccessGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16.w,
      mainAxisSpacing: 16.w,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        _QuickAccessTile(
          icon: Icons.school_rounded,
          titleBn: 'শেখা',
          titleEn: 'Learn',
          backgroundColor: Color(0xFF7FBA96),
          iconColor: Color(0xFF7FBA96),
          textColor: Colors.white,
          route: '/learn',
          decorativeEmoji: '📚',
        ),
        _QuickAccessTile(
          icon: Icons.sports_esports_rounded,
          titleBn: 'খেলা',
          titleEn: 'Play',
          backgroundColor: Color(0xFF87CEEB),
          iconColor: Color(0xFF479ABF),
          textColor: Color(0xFF0D3B66),
          route: '/play',
          decorativeEmoji: '🪴',
        ),
        _QuickAccessTile(
          icon: Icons.auto_stories_rounded,
          titleBn: 'গল্প',
          titleEn: 'Stories',
          backgroundColor: Color(0xFFFFC94D),
          iconColor: Color(0xFFD97706),
          textColor: Color(0xFF5D4037),
          route: '/learn', // Goes to Learn page with stories section
          isStories: true,
        ),
        _QuickAccessTile(
          icon: Icons.font_download_rounded,
          titleBn: 'বর্ণমালা',
          titleEn: 'Alphabet',
          backgroundColor: Color(0xFFBF4E4E),
          iconColor: Color(0xFFBF4E4E),
          textColor: Colors.white,
          route: '/learn', // Goes to Learn page with alphabet section
          isAlphabet: true,
        ),
      ],
    );
  }
}

class _QuickAccessTile extends StatelessWidget {
  final IconData icon;
  final String titleBn;
  final String titleEn;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  final String route;
  final String? decorativeEmoji;
  final bool isStories;
  final bool isAlphabet;
  final bool isAnimals;

  const _QuickAccessTile({
    required this.icon,
    required this.titleBn,
    required this.titleEn,
    required this.backgroundColor,
    required this.iconColor,
    required this.textColor,
    required this.route,
    this.decorativeEmoji,
    this.isStories = false,
    this.isAlphabet = false,
    this.isAnimals = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        if (isAnimals) {
          // Navigate to Animals category
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (context) => CategoryGridPage(
                categoryId: 'animals',
                titleBn: 'প্রাণী',
                emoji: '🐾',
                accentColor: const Color(0xFF7FBA96),
                items: LearnDataRepository.animals,
                completedCount: 0,
              ),
            ),
          );
        } else {
          // Regular navigation via GoRouter
          context.go(route);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Decorative blur blob top-right
            Positioned(
              top: -20.w,
              right: -20.w,
              child: Container(
                width: 80.w,
                height: 80.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.15),
                ),
              ),
            ),

            // Decorative image/emoji at bottom-right corner
            if (decorativeEmoji != null)
              Positioned(
                bottom: 8.h,
                right: 8.w,
                child: Opacity(
                  opacity: 0.3,
                  child: Text(
                    decorativeEmoji!,
                    style: TextStyle(fontSize: 40.sp),
                  ),
                ),
              ),

            // Content
            Padding(
              padding: EdgeInsets.all(14.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon in white circle
                  Container(
                    width: 36.w,
                    height: 36.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Icon(
                      icon,
                      size: 20.sp,
                      color: iconColor,
                    ),
                  ),

                  // Titles
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titleBn,
                        style: TextStyle(
                          fontFamily: 'NotoSansBengali',
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        titleEn,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: textColor.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
