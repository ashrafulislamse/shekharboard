import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Profile card with avatar, name, age, and edit button
class ProfileCard extends StatelessWidget {
  final String name;
  final String age;
  final String? avatarUrl;
  final String avatarEmoji;
  final VoidCallback? onEditTap;

  const ProfileCard({
    super.key,
    required this.name,
    required this.age,
    this.avatarUrl,
    this.avatarEmoji = '👶',
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFFE0F2F1).withOpacity(0.6),
                AppColors.warmCream,
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  // Avatar
                  Container(
                    width: 100.w,
                    height: 100.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF9C4),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: avatarUrl != null
                          ? Image.network(
                              avatarUrl!,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => _buildEmojiAvatar(),
                            )
                          : _buildEmojiAvatar(),
                    ),
                  ),
                  
                  SizedBox(height: 12.h),
                  
                  // Name
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                    ),
                  ),
                  
                  SizedBox(height: 2.h),
                  
                  // Age
                  Text(
                    '$age বছর বয়স',
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary.withOpacity(0.7),
                    ),
                  ),
                  
                  SizedBox(height: 16.h),
                  
                  // Edit button
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      onEditTap?.call();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(24.r),
                        border: Border.all(
                          color: const Color(0xFFE0F2F1),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.edit_outlined,
                            size: 18.sp,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'প্রোফাইল বদলাও',
                            style: TextStyle(
                              fontFamily: 'NotoSansBengali',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmojiAvatar() {
    return Center(
      child: Text(
        avatarEmoji,
        style: TextStyle(fontSize: 48.sp),
      ),
    );
  }
}
