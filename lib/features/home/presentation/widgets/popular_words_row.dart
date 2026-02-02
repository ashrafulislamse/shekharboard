import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/audio_service.dart';
import '../../../learn/data/learn_data_repository.dart';
import '../../../learn/presentation/pages/item_detail_page.dart';
import '../../../learn/presentation/models/category_item.dart';

/// Popular Words Horizontal Scroll with Images
/// Matches screenshot: গরু, আম, রিকশা, বিড়াল with actual images in circles
class PopularWordsRow extends StatelessWidget {
  const PopularWordsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: _popularWords.length,
        itemBuilder: (context, index) {
          final word = _popularWords[index];
          return Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: _WordCircle(
              nameBn: word['nameBn']!,
              imagePath: word['image']!,
              fallbackEmoji: word['emoji']!,
              itemId: word['id']!,
              category: word['category']!,
            ),
          );
        },
      ),
    );
  }

  static final List<Map<String, String>> _popularWords = [
    {'id': 'goru', 'nameBn': 'গরু', 'image': 'assets/images/cow.png', 'emoji': '🐄', 'category': 'animals'},
    {'id': 'am', 'nameBn': 'আম', 'image': 'assets/images/mango.png', 'emoji': '🥭', 'category': 'fruits'},
    {'id': 'riksha', 'nameBn': 'রিকশা', 'image': 'assets/images/rickshaw.png', 'emoji': '🛺', 'category': 'vehicles'},
    {'id': 'biral', 'nameBn': 'বিড়াল', 'image': 'assets/images/cat.png', 'emoji': '🐱', 'category': 'animals'},
    {'id': 'kola', 'nameBn': 'কলা', 'image': 'assets/images/banana.png', 'emoji': '🍌', 'category': 'fruits'},
    {'id': 'kukur', 'nameBn': 'কুকুর', 'image': 'assets/images/dog.png', 'emoji': '🐕', 'category': 'animals'},
  ];
}

class _WordCircle extends StatelessWidget {
  final String nameBn;
  final String imagePath;
  final String fallbackEmoji;
  final String itemId;
  final String category;

  const _WordCircle({
    required this.nameBn,
    required this.imagePath,
    required this.fallbackEmoji,
    required this.itemId,
    required this.category,
  });

  List<CategoryItem> _getItemsForCategory() {
    switch (category) {
      case 'animals':
        return LearnDataRepository.animals;
      case 'fruits':
        return LearnDataRepository.fruits;
      case 'vehicles':
        return LearnDataRepository.vehicles;
      default:
        return LearnDataRepository.animals;
    }
  }

  int _getItemIndex(List<CategoryItem> items) {
    return items.indexWhere((item) => item.id == itemId);
  }

  Color _getCategoryColor() {
    switch (category) {
      case 'animals':
        return const Color(0xFF7FBA96);
      case 'fruits':
        return const Color(0xFFF4A261);
      case 'vehicles':
        return const Color(0xFF87CEEB);
      default:
        return const Color(0xFF7FBA96);
    }
  }

  String _getCategoryTitle() {
    switch (category) {
      case 'animals':
        return 'প্রাণী';
      case 'fruits':
        return 'ফল';
      case 'vehicles':
        return 'যানবাহন';
      default:
        return 'প্রাণী';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        // Play audio
        AudioService().playWord(category, itemId);
        
        // Navigate to item detail page
        final items = _getItemsForCategory();
        final index = _getItemIndex(items);
        if (index >= 0) {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (context) => ItemDetailPage(
                items: items,
                initialIndex: index,
                categoryTitleBn: _getCategoryTitle(),
                accentColor: _getCategoryColor(),
              ),
            ),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Circle with image - double ring effect
          Container(
            width: 72.w,
            height: 72.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF5F5F5),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Text(
                        fallbackEmoji,
                        style: TextStyle(fontSize: 32.sp),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          SizedBox(height: 8.h),

          // Bengali name
          Text(
            nameBn,
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textMain,
            ),
          ),
        ],
      ),
    );
  }
}
