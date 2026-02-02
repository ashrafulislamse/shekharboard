import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/progress_service.dart';
import '../../../learn/data/learn_data_repository.dart';
import '../../../learn/presentation/pages/category_grid_page.dart';

/// Continue Learning Card - Shows last learned category with real progress
class ContinueLearningCard extends StatefulWidget {
  const ContinueLearningCard({super.key});

  @override
  State<ContinueLearningCard> createState() => _ContinueLearningCardState();
}

class _ContinueLearningCardState extends State<ContinueLearningCard> {
  final ProgressService _progressService = ProgressService();

  @override
  void initState() {
    super.initState();
    _initProgress();
    _progressService.addListener(_onProgressChanged);
  }

  @override
  void dispose() {
    _progressService.removeListener(_onProgressChanged);
    super.dispose();
  }

  Future<void> _initProgress() async {
    await _progressService.init();
    if (mounted) setState(() {});
  }

  void _onProgressChanged() {
    if (mounted) setState(() {});
  }

  // Get the category with most progress to continue
  Map<String, dynamic> get _continueCategory {
    final categories = LearnDataRepository.allCategories;
    String bestCategoryId = 'animals';
    int bestProgress = 0;
    
    for (final cat in categories) {
      final progressList = _progressService.getCategoryProgress(cat.id);
      final completedCount = progressList.where((p) => p.isCompleted).length;
      if (completedCount > bestProgress && completedCount < cat.items.length) {
        bestProgress = completedCount;
        bestCategoryId = cat.id;
      }
    }
    
    // If no progress, default to animals
    final category = categories.firstWhere(
      (c) => c.id == bestCategoryId,
      orElse: () => categories.first,
    );
    
    final progressList = _progressService.getCategoryProgress(category.id);
    final completed = progressList.where((p) => p.isCompleted).length;
    final total = category.items.length;
    final percentage = total > 0 ? (completed / total) : 0.0;
    
    return {
      'category': category,
      'completed': completed,
      'total': total,
      'percentage': percentage,
    };
  }

  @override
  Widget build(BuildContext context) {
    final data = _continueCategory;
    final category = data['category'] as CategoryInfo;
    final completed = data['completed'] as int;
    final percentage = data['percentage'] as double;
    final percentText = _toBengaliNumber((percentage * 100).round());

    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (context) => CategoryGridPage(
              categoryId: category.id,
              titleBn: category.titleBn,
              emoji: category.emoji,
              accentColor: category.color,
              items: category.items,
              completedCount: completed,
            ),
          ),
        );
      },
      child: Container(
        height: 120.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              category.color,
              category.color.withOpacity(0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: category.color.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background decoration
            Positioned(
              right: -20.w,
              bottom: -20.h,
              child: Container(
                width: 100.w,
                height: 100.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            
            // Content
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  // Left: Text content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'চালিয়ে যাও',
                          style: TextStyle(
                            fontFamily: 'NotoSansBengali',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          '${category.titleBn} ${category.emoji}',
                          style: TextStyle(
                            fontFamily: 'NotoSansBengali',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        // Progress bar
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 6.h,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(3.r),
                                ),
                                child: FractionallySizedBox(
                                  alignment: Alignment.centerLeft,
                                  widthFactor: percentage.clamp(0.0, 1.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3.r),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              '$percentText%',
                              style: TextStyle(
                                fontFamily: 'NotoSansBengali',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  // Right: Play button
                  Container(
                    width: 52.w,
                    height: 52.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: category.color,
                      size: 32.sp,
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

  String _toBengaliNumber(int number) {
    const bengaliDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    return number.toString().split('').map((d) => bengaliDigits[int.parse(d)]).join();
  }
}
