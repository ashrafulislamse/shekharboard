import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../models/category_item.dart';
import '../widgets/category_header.dart';
import '../widgets/category_item_card.dart';
import '../widgets/random_button.dart';
import 'item_detail_page.dart';

/// Category Grid Page - Shows items within a category (Animals, Fruits, etc.)
/// Matches HTML design with gradient header, progress bar, and 3-column grid
class CategoryGridPage extends StatelessWidget {
  final String categoryId;
  final String titleBn;
  final String emoji;
  final Color accentColor;
  final List<CategoryItem> items;
  final int completedCount;

  const CategoryGridPage({
    super.key,
    required this.categoryId,
    required this.titleBn,
    required this.emoji,
    required this.accentColor,
    required this.items,
    this.completedCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final progress = items.isEmpty ? 0.0 : completedCount / items.length;
    
    return Scaffold(
      backgroundColor: AppColors.warmCream,
      body: Stack(
        children: [
          // Main content
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Gradient Header
              SliverToBoxAdapter(
                child: CategoryHeader(
                  titleBn: titleBn,
                  emoji: emoji,
                  accentColor: accentColor,
                  totalCount: items.length,
                  completedCount: completedCount,
                  progress: progress,
                  onBackPressed: () => Navigator.of(context).pop(),
                ),
              ),

              // Grid content
              SliverPadding(
                padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 100.h),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.w,
                    childAspectRatio: 0.85,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = items[index];
                      return CategoryItemCard(
                        item: item,
                        accentColor: accentColor,
                        onTap: () {
                          HapticFeedback.lightImpact();
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) => ItemDetailPage(
                                items: items,
                                initialIndex: index,
                                categoryTitleBn: titleBn,
                                accentColor: accentColor,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    childCount: items.length,
                  ),
                ),
              ),
            ],
          ),

          // Floating Random Button
          Positioned(
            bottom: 24.h,
            right: 24.w,
            child: RandomButton(
              accentColor: accentColor,
              onTap: () {
                HapticFeedback.mediumImpact();
                // Navigate to a random item
                final randomIndex = (items.length * (DateTime.now().millisecondsSinceEpoch % 1000) / 1000).floor();
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) => ItemDetailPage(
                      items: items,
                      initialIndex: randomIndex % items.length,
                      categoryTitleBn: titleBn,
                      accentColor: accentColor,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
