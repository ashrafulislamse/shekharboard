import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_colors.dart';

/// Screen 22: Help & FAQ Page
/// Purpose: How to play guide, FAQ, troubleshooting
/// Design: Bilingual (Bengali + English) for parents
class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final Set<int> _expandedFAQs = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.w),
                children: [
                  // How to Play Section
                  _buildHowToPlaySection(),
                  SizedBox(height: 24.h),

                  // FAQ Section
                  _buildFAQSection(),
                  SizedBox(height: 24.h),

                  // Contact Support
                  _buildContactSection(),
                  SizedBox(height: 32.h),
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
                  'সাহায্য',
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkTeal,
                  ),
                ),
                Text(
                  'Help & FAQ',
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

  Widget _buildHowToPlaySection() {
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
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.play_circle_fill, color: AppColors.accentGreen, size: 24.w),
              SizedBox(width: 8.w),
              Text(
                'How to Play',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkTeal,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Step 1
          _buildHowToStep(
            step: 1,
            emoji: '👆',
            titleBn: 'ট্যাপ করুন',
            titleEn: 'Tap the card',
            descBn: 'যেকোনো কার্ডে ট্যাপ করুন',
            descEn: 'Tap any card to hear the word pronounced in Bengali',
          ),
          SizedBox(height: 16.h),

          // Step 2
          _buildHowToStep(
            step: 2,
            emoji: '👈👉',
            titleBn: 'সোয়াইপ করুন',
            titleEn: 'Swipe to explore',
            descBn: 'বাম বা ডানে সোয়াইপ করুন',
            descEn: 'Swipe left or right to see more cards',
          ),
          SizedBox(height: 16.h),

          // Step 3
          _buildHowToStep(
            step: 3,
            emoji: '🔄',
            titleBn: 'পুনরায় শুনুন',
            titleEn: 'Repeat to learn',
            descBn: 'আবার ট্যাপ করুন',
            descEn: 'Tap again to hear the word repeated',
          ),
          SizedBox(height: 16.h),

          // Step 4
          _buildHowToStep(
            step: 4,
            emoji: '⬆️',
            titleBn: 'উপরে সোয়াইপ',
            titleEn: 'Swipe up to exit',
            descBn: 'বের হতে উপরে সোয়াইপ করুন',
            descEn: 'Swipe up to return to the home screen',
          ),
        ],
      ),
    );
  }

  Widget _buildHowToStep({
    required int step,
    required String emoji,
    required String titleBn,
    required String titleEn,
    required String descBn,
    required String descEn,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Step number
        Container(
          width: 32.w,
          height: 32.w,
          decoration: BoxDecoration(
            color: AppColors.accentGreen.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$step',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.accentGreen,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),

        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    emoji,
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    titleEn,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkTeal,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                descEn,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey[600],
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFAQSection() {
    final faqs = [
      _FAQ(
        questionBn: 'অ্যাপটি কি বিনামূল্যে?',
        questionEn: 'Is the app free?',
        answerEn: 'Yes! The basic app with 4 content packs is completely free. Premium packs with additional content can be purchased separately.',
      ),
      _FAQ(
        questionBn: 'কোন বয়সের জন্য উপযুক্ত?',
        questionEn: 'What age is this app for?',
        answerEn: 'শেখার বোর্ড is designed for toddlers aged 2-5 years. The simple interface and colorful visuals are perfect for early learners.',
      ),
      _FAQ(
        questionBn: 'ইন্টারনেট লাগবে কি?',
        questionEn: 'Do I need internet?',
        answerEn: 'No! Once installed, the app works completely offline. All audio and images are stored on your device.',
      ),
      _FAQ(
        questionBn: 'শব্দ কাজ করছে না?',
        questionEn: 'Sound not working?',
        answerEn: 'Please check:\n• Device volume is turned up\n• Sound is enabled in Parent Settings\n• The device is not on silent mode',
      ),
      _FAQ(
        questionBn: 'অগ্রগতি ডেটা কোথায় সংরক্ষিত?',
        questionEn: 'Where is progress data stored?',
        answerEn: 'All progress data is stored locally on your device only. We never send any data to external servers. Your child\'s privacy is our priority.',
      ),
      _FAQ(
        questionBn: 'কিভাবে কন্টেন্ট প্যাক যোগ করব?',
        questionEn: 'How do I add content packs?',
        answerEn: 'Go to Parent Settings → Content Packs. You can toggle free packs ON/OFF or purchase premium packs for more learning content.',
      ),
    ];

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Row(
              children: [
                Icon(Icons.help_outline, color: Colors.orange, size: 24.w),
                SizedBox(width: 8.w),
                Text(
                  'Frequently Asked Questions',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkTeal,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey[100]),
          ...faqs.asMap().entries.map((entry) => _buildFAQItem(entry.key, entry.value)),
        ],
      ),
    );
  }

  Widget _buildFAQItem(int index, _FAQ faq) {
    final isExpanded = _expandedFAQs.contains(index);

    return Column(
      children: [
        InkWell(
          onTap: () {
            HapticFeedback.lightImpact();
            setState(() {
              if (isExpanded) {
                _expandedFAQs.remove(index);
              } else {
                _expandedFAQs.add(index);
              }
            });
          },
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        faq.questionBn,
                        style: TextStyle(
                          fontFamily: 'NotoSansBengali',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkTeal,
                        ),
                      ),
                      Text(
                        faq.questionEn,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.expand_more,
                    color: Colors.grey[400],
                    size: 24.w,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox(width: double.infinity),
          secondChild: Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                faq.answerEn,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),
            ),
          ),
          crossFadeState: isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
        if (index < 5) Divider(height: 1, color: Colors.grey[100]),
      ],
    );
  }

  Widget _buildContactSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.blue[100]!),
      ),
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          Icon(Icons.support_agent, color: Colors.blue[700], size: 40.w),
          SizedBox(height: 12.h),
          Text(
            'Still need help?',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'এখনও সাহায্য দরকার?',
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 14.sp,
              color: Colors.blue[700],
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () async {
                HapticFeedback.lightImpact();
                final url = Uri.parse('mailto:support@zingswift.com?subject=Shekhar%20Board%20Help');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Could not open email client'),
                        backgroundColor: Colors.red[400],
                      ),
                    );
                  }
                }
              },
              icon: const Icon(Icons.email),
              label: const Text('Contact Support'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.h),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'support@zingswift.com',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.blue[700],
            ),
          ),
        ],
      ),
    );
  }
}

class _FAQ {
  final String questionBn;
  final String questionEn;
  final String answerEn;

  _FAQ({
    required this.questionBn,
    required this.questionEn,
    required this.answerEn,
  });
}
