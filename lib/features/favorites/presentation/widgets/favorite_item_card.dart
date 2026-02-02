import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Individual favorite item card for 2-column grid
class FavoriteItemCard extends StatelessWidget {
  final String id;
  final String nameBn;
  final String emoji;
  final String? imageUrl;
  final String categoryBn;
  final String categoryId;
  final VoidCallback onTap;
  final VoidCallback onUnfavorite;

  const FavoriteItemCard({
    super.key,
    required this.id,
    required this.nameBn,
    required this.emoji,
    this.imageUrl,
    required this.categoryBn,
    required this.categoryId,
    required this.onTap,
    required this.onUnfavorite,
  });

  Color _getCategoryColor() {
    switch (categoryId) {
      case 'animals':
        return const Color(0xFF7FBA96); // badge-green
      case 'fruits':
        return const Color(0xFFFFD54F); // badge-yellow
      case 'vehicles':
        return const Color(0xFF87CEEB); // badge-blue
      case 'stories':
        return const Color(0xFFB39DDB); // badge-purple
      case 'games':
        return const Color(0xFFFFAB91); // badge-orange
      default:
        return const Color(0xFF7FBA96);
    }
  }

  Color _getCategoryTextColor() {
    switch (categoryId) {
      case 'fruits':
        return const Color(0xFF1B5E5E); // dark-teal for yellow badge
      default:
        return Colors.white;
    }
  }

  Color _getBackgroundColor() {
    switch (categoryId) {
      case 'animals':
        return const Color(0xFFE8F5E9); // green-50
      case 'fruits':
        return const Color(0xFFFFF8E1); // orange/yellow-50
      case 'vehicles':
        return const Color(0xFFE3F2FD); // blue-50
      case 'stories':
        return const Color(0xFFF3E5F5); // purple-50
      case 'games':
        return const Color(0xFFFFF3E0); // orange-50
      default:
        return const Color(0xFFF5F5F5); // gray-50
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.grey.shade50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Main content - use Column with Expanded properly
            Column(
              children: [
                // Image area - takes remaining space
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _getBackgroundColor(),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: _buildImage(),
                    ),
                  ),
                ),
                
                SizedBox(height: 6.h),
                
                // Name
                Text(
                  nameBn,
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade800,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                
                SizedBox(height: 4.h),
                
                // Category badge
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: _getCategoryColor(),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    categoryBn,
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                      color: _getCategoryTextColor(),
                    ),
                  ),
                ),
              ],
            ),
            
            // Heart unfavorite button
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  HapticFeedback.mediumImpact();
                  onUnfavorite();
                },
                child: Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.favorite_rounded,
                    size: 18.sp,
                    color: const Color(0xFFC75146), // heart-red
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return Image.network(
        imageUrl!,
        width: 64.w,
        height: 64.w,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => _buildEmoji(),
      );
    }
    return _buildEmoji();
  }

  Widget _buildEmoji() {
    return Text(
      emoji,
      style: TextStyle(fontSize: 48.sp),
    );
  }
}
