import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/audio_service.dart';
import '../../../learn/data/learn_data_repository.dart';
import '../../../learn/presentation/pages/item_detail_page.dart';
import '../../../learn/presentation/models/category_item.dart';

/// Today's Word Card - Daily featured word with audio
/// Engages children with a new word each day
class TodaysWordCard extends StatelessWidget {
  const TodaysWordCard({super.key});

  List<CategoryItem> _getItemsForCategory(String category) {
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

  String _getCategoryTitle(String category) {
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

  Color _getCategoryColor(String category) {
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

  @override
  Widget build(BuildContext context) {
    // Get word based on day of year for variety
    final dayOfYear = DateTime.now().difference(DateTime(DateTime.now().year, 1, 1)).inDays;
    final word = _dailyWords[dayOfYear % _dailyWords.length];
    final category = word['category'] as String;
    final itemId = word['id'] as String;

    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        // Play audio and navigate to detail
        AudioService().playWord(category, itemId);
        
        final items = _getItemsForCategory(category);
        final index = items.indexWhere((item) => item.id == itemId);
        if (index >= 0) {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (context) => ItemDetailPage(
                items: items,
                initialIndex: index,
                categoryTitleBn: _getCategoryTitle(category),
                accentColor: _getCategoryColor(category),
              ),
            ),
          );
        }
      },
      child: Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFFE8E8E8),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Emoji circle
          Container(
            width: 56.w,
            height: 56.w,
            decoration: BoxDecoration(
              color: word['color'] as Color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                word['emoji'] as String,
                style: TextStyle(fontSize: 28.sp),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '✨ আজকের শব্দ',
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  word['nameBn'] as String,
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1B5E5E),
                  ),
                ),
                Text(
                  word['nameEn'] as String,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          
          // Sound button
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              // Play word audio
              AudioService().playWord(
                word['category'] as String,
                word['id'] as String,
              );
            },
            child: Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: const Color(0xFF1B5E5E).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.volume_up_rounded,
                color: const Color(0xFF1B5E5E),
                size: 24.sp,
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }

  // Daily words rotation - mix of categories
  static const List<Map<String, dynamic>> _dailyWords = [
    {'id': 'goru', 'nameBn': 'গরু', 'nameEn': 'Cow', 'emoji': '🐄', 'color': Color(0xFFE8F5E9), 'category': 'animals'},
    {'id': 'am', 'nameBn': 'আম', 'nameEn': 'Mango', 'emoji': '🥭', 'color': Color(0xFFFFF3E0), 'category': 'fruits'},
    {'id': 'riksha', 'nameBn': 'রিকশা', 'nameEn': 'Rickshaw', 'emoji': '🛺', 'color': Color(0xFFE3F2FD), 'category': 'vehicles'},
    {'id': 'biral', 'nameBn': 'বিড়াল', 'nameEn': 'Cat', 'emoji': '🐱', 'color': Color(0xFFFCE4EC), 'category': 'animals'},
    {'id': 'kola', 'nameBn': 'কলা', 'nameEn': 'Banana', 'emoji': '🍌', 'color': Color(0xFFFFFDE7), 'category': 'fruits'},
    {'id': 'train', 'nameBn': 'ট্রেন', 'nameEn': 'Train', 'emoji': '🚂', 'color': Color(0xFFE8EAF6), 'category': 'vehicles'},
    {'id': 'hati', 'nameBn': 'হাতি', 'nameEn': 'Elephant', 'emoji': '🐘', 'color': Color(0xFFECEFF1), 'category': 'animals'},
    {'id': 'apel', 'nameBn': 'আপেল', 'nameEn': 'Apple', 'emoji': '🍎', 'color': Color(0xFFFFEBEE), 'category': 'fruits'},
    {'id': 'biman', 'nameBn': 'বিমান', 'nameEn': 'Airplane', 'emoji': '✈️', 'color': Color(0xFFE0F7FA), 'category': 'vehicles'},
    {'id': 'kukur', 'nameBn': 'কুকুর', 'nameEn': 'Dog', 'emoji': '🐕', 'color': Color(0xFFFFF8E1), 'category': 'animals'},
    {'id': 'komla', 'nameBn': 'কমলা', 'nameEn': 'Orange', 'emoji': '🍊', 'color': Color(0xFFFFF3E0), 'category': 'fruits'},
    {'id': 'nouka', 'nameBn': 'নৌকা', 'nameEn': 'Boat', 'emoji': '⛵', 'color': Color(0xFFE1F5FE), 'category': 'vehicles'},
    {'id': 'bagh', 'nameBn': 'বাঘ', 'nameEn': 'Tiger', 'emoji': '🐅', 'color': Color(0xFFFFF8E1), 'category': 'animals'},
    {'id': 'tormuj', 'nameBn': 'তরমুজ', 'nameEn': 'Watermelon', 'emoji': '🍉', 'color': Color(0xFFFFEBEE), 'category': 'fruits'},
  ];
}
