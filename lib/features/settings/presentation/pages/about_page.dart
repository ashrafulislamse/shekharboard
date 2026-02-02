import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_colors.dart';

/// Screen 21: About Page
/// Purpose: Developer info, legal, credits
/// Design: Bilingual (Bengali + English) for parents
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.w),
                children: [
                  // App Logo & Version
                  _buildAppHeader(),
                  SizedBox(height: 24.h),

                  // Description
                  _buildDescription(),
                  SizedBox(height: 24.h),

                  // Developer Info
                  _buildDeveloperSection(),
                  SizedBox(height: 24.h),

                  // Links Section
                  _buildLinksSection(context),
                  SizedBox(height: 24.h),

                  // Legal Section
                  _buildLegalSection(context),
                  SizedBox(height: 32.h),

                  // Made with love
                  _buildFooter(),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8F0).withOpacity(0.95),
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!, width: 1),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back, color: AppColors.darkTeal, size: 24.w),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  'সম্পর্কে',
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkTeal,
                  ),
                ),
                Text(
                  'About',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 48.w),
        ],
      ),
    );
  }

  Widget _buildAppHeader() {
    return Column(
      children: [
        // App Icon
        Container(
          width: 100.w,
          height: 100.w,
          decoration: BoxDecoration(
            color: AppColors.darkTeal,
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkTeal.withOpacity(0.3),
                blurRadius: 20.r,
                offset: Offset(0, 8.h),
              ),
            ],
          ),
          child: Center(
            child: Text(
              '📚',
              style: TextStyle(fontSize: 48.sp),
            ),
          ),
        ),
        SizedBox(height: 16.h),

        // App Name
        Text(
          'শেখার বোর্ড',
          style: TextStyle(
            fontFamily: 'NotoSansBengali',
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.darkTeal,
          ),
        ),
        Text(
          'Shekhar Board',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[500],
          ),
        ),
        SizedBox(height: 8.h),

        // Version
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: AppColors.accentGreen.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            'Version 1.0.4 (Build 12)',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.accentGreen,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'আমাদের সম্পর্কে / About Us',
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.darkTeal,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'শেখার বোর্ড is an educational app designed to help Bangladeshi toddlers (ages 2-5) learn Bengali words through interactive flashcards with native pronunciation.',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            '🎯 Ad-free & Child-safe\n🔒 No internet required\n🇧🇩 Made for Bangladeshi children',
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.darkTeal,
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeveloperSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Developer',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[500],
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  color: AppColors.darkTeal,
                  size: 24.w,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BanglaEdu Studio',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkTeal,
                      ),
                    ),
                    Text(
                      'Dhaka, Bangladesh',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLinksSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildLinkItem(
            context: context,
            icon: Icons.star,
            iconColor: Colors.amber,
            title: 'Rate this App',
            titleBn: 'অ্যাপটি রেট করুন',
            onTap: () async {
              final url = Uri.parse('https://play.google.com/store/apps/details?id=com.zingswift.shekharboard');
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
          ),
          Divider(height: 1, color: Colors.grey[100]),
          _buildLinkItem(
            context: context,
            icon: Icons.share,
            iconColor: Colors.blue,
            title: 'Share with Friends',
            titleBn: 'বন্ধুদের সাথে শেয়ার করুন',
            onTap: () {
              Share.share(
                'শেখার বোর্ড - বাংলা শেখার অ্যাপ! 📚\\n\\nDownload: https://play.google.com/store/apps/details?id=com.zingswift.shekharboard',
                subject: 'শেখার বোর্ড App',
              );
            },
          ),
          Divider(height: 1, color: Colors.grey[100]),
          _buildLinkItem(
            context: context,
            icon: Icons.email,
            iconColor: Colors.green,
            title: 'Contact Support',
            titleBn: 'সাপোর্টে যোগাযোগ',
            subtitle: 'support@zingswift.com',
            onTap: () async {
              final url = Uri.parse('mailto:support@zingswift.com?subject=Shekhar%20Board%20Support');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLinkItem({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String titleBn,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(icon, color: iconColor, size: 20.w),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$titleBn / $title',
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkTeal,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[500],
                      ),
                    ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[400], size: 20.w),
          ],
        ),
      ),
    );
  }

  Widget _buildLegalSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildLegalItem(
            context: context,
            title: 'Privacy Policy',
            titleBn: 'গোপনীয়তা নীতি',
            onTap: () {
              _showLegalDialog(context, 'Privacy Policy', _privacyPolicyText);
            },
          ),
          Divider(height: 1, color: Colors.grey[100]),
          _buildLegalItem(
            context: context,
            title: 'Terms of Service',
            titleBn: 'সেবার শর্তাবলী',
            onTap: () {
              _showLegalDialog(context, 'Terms of Service', _termsOfServiceText);
            },
          ),
          Divider(height: 1, color: Colors.grey[100]),
          _buildLegalItem(
            context: context,
            title: 'Open Source Licenses',
            titleBn: 'ওপেন সোর্স লাইসেন্স',
            onTap: () {
              showLicensePage(
                context: context,
                applicationName: 'শেখার বোর্ড',
                applicationVersion: '1.0.4',
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLegalItem({
    required BuildContext context,
    required String title,
    required String titleBn,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '$titleBn / $title',
                style: TextStyle(
                  fontFamily: 'NotoSansBengali',
                  fontSize: 14.sp,
                  color: AppColors.darkTeal,
                ),
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[400], size: 20.w),
          ],
        ),
      ),
    );
  }

  void _showLegalDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: Text(
            content,
            style: TextStyle(fontSize: 13.sp, height: 1.5),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Text(
          'Made with ❤️ in Bangladesh',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[500],
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          '© 2024 BanglaEdu Studio',
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }

  static const _privacyPolicyText = '''
Privacy Policy for শেখার বোর্ড (Shekhar Board)

Last updated: January 2024

1. Information We Collect
This app does NOT collect any personal information. All learning progress data is stored locally on your device only.

2. Data Storage
- All data stays on your device
- No data is sent to external servers
- No internet connection required for app usage

3. Children's Privacy
This app is designed for children aged 2-5. We take children's privacy very seriously:
- No personal data collection
- No advertising
- No in-app purchases without parent verification
- No social features or user accounts

4. Third-Party Services
This app does not use any third-party analytics or advertising services.

5. Contact
For questions about this privacy policy, contact: support@banglaedu.com
''';

  static const _termsOfServiceText = '''
Terms of Service for শেখার বোর্ড (Shekhar Board)

Last updated: January 2024

1. Acceptance of Terms
By using this app, you agree to these terms.

2. Use License
This app is licensed for personal, non-commercial use only.

3. Parental Responsibility
Parents/guardians are responsible for monitoring their child's use of this app.

4. Content
All educational content is created for children aged 2-5 and is appropriate for this age group.

5. Limitations
The app is provided "as is" without warranties of any kind.

6. Contact
For questions about these terms, contact: support@banglaedu.com
''';
}
