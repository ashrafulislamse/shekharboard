import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import 'weekly_report_page.dart';
import 'content_pack_page.dart';
import 'session_timer_page.dart';
import 'about_page.dart';
import 'help_page.dart';

/// Screen 17: Parent Settings Dashboard
/// Purpose: Central hub for parent controls
/// Design: Bilingual - Bengali primary, English subtitle
class ParentSettingsPage extends StatefulWidget {
  const ParentSettingsPage({super.key});

  @override
  State<ParentSettingsPage> createState() => _ParentSettingsPageState();
}

class _ParentSettingsPageState extends State<ParentSettingsPage> {
  bool _isSoundOn = true;
  bool _isBengaliUI = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmCream,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.w),
                children: [
                  // Sound & Language Section
                  _buildSettingsCard(),
                  SizedBox(height: 16.h),
                  
                  // Content Packs
                  _buildNavigationCard(
                    icon: Icons.inventory_2_rounded,
                    iconColor: const Color(0xFF7FBA96),
                    titleBn: 'বিষয় প্যাক',
                    titleEn: 'Content Packs',
                    subtitleBn: '৩টি সক্রিয়',
                    subtitleEn: '3 active packs',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ContentPackPage()),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  
                  // Session Timer
                  _buildNavigationCard(
                    icon: Icons.timer_rounded,
                    iconColor: const Color(0xFFF57C00),
                    titleBn: 'সেশন টাইমার',
                    titleEn: 'Session Timer',
                    subtitleBn: '৩০ মিনিট',
                    subtitleEn: '30 minutes',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SessionTimerPage()),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  
                  // Weekly Report
                  _buildNavigationCard(
                    icon: Icons.bar_chart_rounded,
                    iconColor: const Color(0xFF1976D2),
                    titleBn: 'সাপ্তাহিক রিপোর্ট',
                    titleEn: 'Weekly Report',
                    subtitleBn: 'শেখার অগ্রগতি দেখুন',
                    subtitleEn: 'View learning progress',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const WeeklyReportPage()),
                    ),
                  ),
                  
                  SizedBox(height: 24.h),
                  
                  // Legal & Info Section Header
                  Padding(
                    padding: EdgeInsets.only(left: 4.w, bottom: 12.h),
                    child: Text(
                      'তথ্য ও সহায়তা',
                      style: TextStyle(
                        fontFamily: 'NotoSansBengali',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  
                  // Help
                  _buildNavigationCard(
                    icon: Icons.help_outline_rounded,
                    iconColor: const Color(0xFF43A047),
                    titleBn: 'সাহায্য',
                    titleEn: 'Help & FAQ',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HelpPage()),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  
                  // About (Privacy, Terms inside)
                  _buildNavigationCard(
                    icon: Icons.info_outline_rounded,
                    iconColor: const Color(0xFF5C6BC0),
                    titleBn: 'সম্পর্কে',
                    titleEn: 'About',
                    subtitleBn: 'গোপনীয়তা নীতি • শর্তাবলী',
                    subtitleEn: 'Privacy Policy • Terms',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AboutPage()),
                    ),
                  ),
                  
                  SizedBox(height: 32.h),
                  
                  // Version
                  Center(
                    child: Text(
                      'সংস্করণ ১.০.৪',
                      style: TextStyle(
                        fontFamily: 'NotoSansBengali',
                        fontSize: 12.sp,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.warmCream,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Row(
        children: [
          // Back button
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              Navigator.pop(context);
            },
            child: Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_back_rounded,
                color: AppColors.textSecondary,
                size: 24.sp,
              ),
            ),
          ),
          
          SizedBox(width: 16.w),
          
          // Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'অভিভাবক সেটিংস',
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textMain,
                  ),
                ),
                Text(
                  'Parent Settings',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          
          // Lock icon (verified)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: const Color(0xFF4CAF50).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.verified_user_rounded,
                  size: 16.sp,
                  color: const Color(0xFF4CAF50),
                ),
                SizedBox(width: 4.w),
                Text(
                  'যাচাইকৃত',
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF4CAF50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Sound Toggle
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Container(
                  width: 44.w,
                  height: 44.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4CAF50).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    _isSoundOn ? Icons.volume_up_rounded : Icons.volume_off_rounded,
                    color: const Color(0xFF4CAF50),
                    size: 24.sp,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'শব্দ',
                        style: TextStyle(
                          fontFamily: 'NotoSansBengali',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textMain,
                        ),
                      ),
                      Text(
                        'Sound Effects',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                // Toggle pills
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  padding: EdgeInsets.all(4.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildTogglePill('চালু', true, _isSoundOn),
                      _buildTogglePill('বন্ধ', false, !_isSoundOn),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          Divider(height: 1, color: Colors.grey[100]),
          
          // Language Toggle
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Container(
                  width: 44.w,
                  height: 44.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1976D2).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.translate_rounded,
                    color: const Color(0xFF1976D2),
                    size: 24.sp,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ইন্টারফেস ভাষা',
                        style: TextStyle(
                          fontFamily: 'NotoSansBengali',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textMain,
                        ),
                      ),
                      Text(
                        'Parent UI Language',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                // Language pills
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  padding: EdgeInsets.all(4.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildLanguagePill('বাংলা', true),
                      _buildLanguagePill('EN', false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTogglePill(String label, bool isOn, bool isSelected) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        setState(() => _isSoundOn = isOn);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'NotoSansBengali',
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.grey[500],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguagePill(String label, bool isBengali) {
    final isSelected = _isBengaliUI == isBengali;
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        setState(() => _isBengaliUI = isBengali);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1976D2) : Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: isBengali ? 'NotoSansBengali' : null,
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.grey[500],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationCard({
    required IconData icon,
    required Color iconColor,
    required String titleBn,
    required String titleEn,
    String? subtitleBn,
    String? subtitleEn,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Icon(icon, color: iconColor, size: 26.sp),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleBn,
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textMain,
                    ),
                  ),
                  if (subtitleBn != null) ...[
                    SizedBox(height: 2.h),
                    Text(
                      subtitleBn,
                      style: TextStyle(
                        fontFamily: 'NotoSansBengali',
                        fontSize: 13.sp,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                  SizedBox(height: 2.h),
                  Text(
                    subtitleEn ?? titleEn,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: Colors.grey[400],
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }
}
