import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

/// Screen 6: Offline Verification (Background)
/// Purpose: Check audio/image integrity on launch
class OfflineVerificationPage extends StatefulWidget {
  final Stream<VerificationProgress> progressStream;
  final VoidCallback onComplete;
  final VoidCallback onFailed;

  const OfflineVerificationPage({
    super.key,
    required this.progressStream,
    required this.onComplete,
    required this.onFailed,
  });

  @override
  State<OfflineVerificationPage> createState() => _OfflineVerificationPageState();
}

class _OfflineVerificationPageState extends State<OfflineVerificationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _spinController;
  double _progress = 0.0;
  final List<CategoryStatus> _categories = [
    CategoryStatus(id: 'animals', name: 'প্রাণী', nameEn: 'Animals', icon: Icons.pets),
    CategoryStatus(id: 'fruits', name: 'ফল', nameEn: 'Fruits', icon: Icons.eco),
    CategoryStatus(id: 'vehicles', name: 'যানবাহন', nameEn: 'Vehicles', icon: Icons.directions_car),
  ];

  @override
  void initState() {
    super.initState();
    _spinController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();

    // Listen to progress updates
    widget.progressStream.listen(
      (progress) {
        setState(() {
          _progress = progress.percentage;
          // Update category statuses
          for (var cat in _categories) {
            if (progress.completedCategories.contains(cat.id)) {
              cat.isComplete = true;
            }
            if (progress.currentCategory == cat.id) {
              cat.isLoading = true;
            }
          }
        });

        if (progress.isComplete) {
          widget.onComplete();
        }
      },
      onError: (error) {
        widget.onFailed();
      },
    );
  }

  @override
  void dispose() {
    _spinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmCream,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),

                // Spinning search icon
                _buildSearchIcon(),

                SizedBox(height: AppSpacing.lg.h),

                // Title
                Text(
                  '🔍 পরীক্ষা চলছে...',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkTeal,
                    fontFamily: 'NotoSansBengali',
                  ),
                ),
                SizedBox(height: AppSpacing.sm.h),
                Text(
                  'Checking files...',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.mutedTeal,
                  ),
                ),

                SizedBox(height: AppSpacing.xl.h),

                // Progress bar
                _buildProgressBar(),

                SizedBox(height: AppSpacing.lg.h),

                // Category checklist
                _buildCategoryChecklist(),

                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchIcon() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Ping effect
        Container(
          width: 96.w,
          height: 96.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.accentGreen.withValues(alpha: 0.1),
          ),
        ),
        // Icon container
        Container(
          width: 96.w,
          height: 96.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
            border: Border.all(
              color: AppColors.accentGreen.withValues(alpha: 0.2),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 8.r,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
          child: AnimatedBuilder(
            animation: _spinController,
            builder: (context, child) {
              return Transform.rotate(
                angle: _spinController.value * 2 * 3.14159,
                child: child,
              );
            },
            child: Icon(
              Icons.search,
              color: AppColors.accentGreen,
              size: 48.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Progress',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.mutedTeal,
              ),
            ),
            Text(
              '${(_progress * 100).toInt()}%',
              style: TextStyle(
                fontSize: 48.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.accentGreen,
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm.h),
        Container(
          height: 24.h,
          decoration: BoxDecoration(
            color: AppColors.darkTeal.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.all(4.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentGreen),
              minHeight: 16.h,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryChecklist() {
    return Column(
      children: _categories.map((category) {
        return Padding(
          padding: EdgeInsets.only(bottom: AppSpacing.sm.h),
          child: _CategoryCheckItem(category: category),
        );
      }).toList(),
    );
  }
}

class _CategoryCheckItem extends StatelessWidget {
  final CategoryStatus category;

  const _CategoryCheckItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md.w),
      decoration: BoxDecoration(
        color: category.isComplete
            ? AppColors.white
            : AppColors.white.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium.r),
        border: Border.all(
          color: category.isComplete
              ? AppColors.accentGreen.withValues(alpha: 0.3)
              : AppColors.darkTeal.withValues(alpha: 0.1),
          style: category.isLoading && !category.isComplete
              ? BorderStyle.solid
              : BorderStyle.solid,
        ),
        boxShadow: category.isComplete
            ? [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 4.r,
                  offset: Offset(0, 2.h),
                ),
              ]
            : null,
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: category.isComplete
                  ? AppColors.accentGreen.withValues(alpha: 0.1)
                  : AppColors.darkTeal.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            ),
            child: Icon(
              category.icon,
              color: category.isComplete
                  ? AppColors.accentGreen
                  : AppColors.mutedTeal,
              size: 20.sp,
            ),
          ),
          SizedBox(width: AppSpacing.md.w),

          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.name,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: category.isComplete
                        ? AppColors.darkTeal
                        : AppColors.mutedTeal,
                    fontFamily: 'NotoSansBengali',
                  ),
                ),
                Text(
                  category.nameEn,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.mutedTeal,
                  ),
                ),
              ],
            ),
          ),

          // Status indicator
          if (category.isComplete)
            Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: AppColors.accentGreen,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                color: AppColors.white,
                size: 18.sp,
              ),
            )
          else if (category.isLoading)
            SizedBox(
              width: 24.w,
              height: 24.w,
              child: CircularProgressIndicator(
                strokeWidth: 2.w,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentGreen),
              ),
            )
          else
            Text(
              '...',
              style: TextStyle(
                fontSize: 24.sp,
                color: AppColors.mutedTeal,
              ),
            ),
        ],
      ),
    );
  }
}

/// Data class for category verification status
class CategoryStatus {
  final String id;
  final String name;
  final String nameEn;
  final IconData icon;
  bool isComplete;
  bool isLoading;

  CategoryStatus({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.icon,
    this.isComplete = false,
    this.isLoading = false,
  });
}

/// Data class for verification progress
class VerificationProgress {
  final double percentage;
  final String? currentCategory;
  final List<String> completedCategories;
  final bool isComplete;

  VerificationProgress({
    required this.percentage,
    this.currentCategory,
    this.completedCategories = const [],
    this.isComplete = false,
  });
}
