import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/unified_tab_header.dart';
import '../../data/learn_data_repository.dart';
import '../widgets/main_topic_card.dart';
import '../widgets/alphabet_card.dart';
import '../widgets/story_card.dart';
import '../widgets/culture_list_item.dart';
import '../widgets/section_header.dart';
import 'category_grid_page.dart';

/// Learn Page - Category hub for learning content
/// Uses clean architecture with separate widget files
class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

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
        child: Column(
          children: [
            // Compact Header
            UnifiedTabHeader(
              title: 'শেখা',
              subtitle: 'নতুন কিছু শিখি আজ! 📚',
              actionIcon: Icons.search_rounded,
              onActionTap: () {
                HapticFeedback.lightImpact();
                // TODO: Open search
              },
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Main Topics Section
                    SizedBox(height: 8.h),
                    const SectionHeader(titleBn: 'প্রধান বিষয়', isFirst: true),
                    _buildMainTopicsGrid(),

                    // Alphabet & Numbers Section
                    const SectionHeader(titleBn: 'বর্ণমালা ও সংখ্যা'),
                    _buildAlphabetGrid(),

                    // Stories Section
                    SectionHeader(
                      titleBn: 'গল্প',
                      actionText: 'সব দেখুন →',
                      onActionTap: () {
                        HapticFeedback.lightImpact();
                        // TODO: Navigate to all stories
                      },
                    ),
                    _buildStoriesRow(),

                    // Culture Section
                    const SectionHeader(titleBn: 'সংস্কৃতি'),
                    _buildCultureList(),

                    // Bottom spacing for nav bar
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Main Topics 2-column Grid
  Widget _buildMainTopicsGrid() {
    final categories = LearnDataRepository.allCategories;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14.w,
          mainAxisSpacing: 14.w,
          childAspectRatio: 0.95,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          return MainTopicCard(
            titleBn: cat.titleBn,
            count: cat.countBn,
            color: cat.color,
            emoji: cat.emoji,
            onTap: () {
              _navigateToCategory(context, cat);
            },
          );
        },
      ),
    );
  }

  void _navigateToCategory(BuildContext context, CategoryInfo category) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => CategoryGridPage(
          categoryId: category.id,
          titleBn: category.titleBn,
          emoji: category.emoji,
          accentColor: category.color,
          items: category.items,
          completedCount: 0, // TODO: Get from progress repository
        ),
      ),
    );
  }

  /// Alphabet 3-column Grid
  Widget _buildAlphabetGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.w,
          childAspectRatio: 0.85,
        ),
        itemCount: _alphabetItems.length,
        itemBuilder: (context, index) {
          final item = _alphabetItems[index];
          return AlphabetCard(
            titleBn: item.titleBn,
            color: item.color,
            symbol: item.symbol,
            onTap: () {
              // TODO: Navigate to alphabet/numbers
            },
          );
        },
      ),
    );
  }

  /// Stories Horizontal Scroll
  Widget _buildStoriesRow() {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: _stories.length,
        itemBuilder: (context, index) {
          final story = _stories[index];
          return Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: StoryCard(
              titleBn: story.titleBn,
              emoji: story.emoji,
              color: story.color,
              onTap: () {
                // TODO: Navigate to story
              },
            ),
          );
        },
      ),
    );
  }

  /// Culture Vertical List
  Widget _buildCultureList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: _cultureItems.map((item) {
          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: CultureListItem(
              titleBn: item.titleBn,
              subtitleBn: item.subtitleBn,
              emoji: item.emoji,
              onTap: () {
                // TODO: Navigate to culture item
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  // ============ STATIC DATA (Alphabet, Stories, Culture) ============

  static final List<_AlphabetData> _alphabetItems = [
    _AlphabetData('বর্ণমালা', const Color(0xFFFF7F50), 'অ'),
    _AlphabetData('সংখ্যা', const Color(0xFF009688), '১'),
    _AlphabetData('আকার', const Color(0xFF9C27B0), '⬡'),
  ];

  static final List<_StoryData> _stories = [
    _StoryData('বোকা কুমির', '🐊', const Color(0xFF4CAF50)),
    _StoryData('লালন শাহ', '🎵', const Color(0xFFFF9800)),
    _StoryData('রাজার গল্প', '👑', const Color(0xFF9C27B0)),
  ];

  static final List<_CultureData> _cultureItems = [
    _CultureData('উৎসব', 'বাঙালির বারো মাসে তেরো পার্বণ', '🎉'),
    _CultureData('ঋতু', 'ছয় ঋতুর বাংলাদেশ', '🌸'),
    _CultureData('খাবার', 'ঐতিহ্যবাহী বাঙালি খাবার', '🍛'),
  ];
}

// ============ DATA CLASSES ============

class _AlphabetData {
  final String titleBn;
  final Color color;
  final String symbol;

  const _AlphabetData(this.titleBn, this.color, this.symbol);
}

class _StoryData {
  final String titleBn;
  final String emoji;
  final Color color;

  const _StoryData(this.titleBn, this.emoji, this.color);
}

class _CultureData {
  final String titleBn;
  final String subtitleBn;
  final String emoji;

  const _CultureData(this.titleBn, this.subtitleBn, this.emoji);
}
