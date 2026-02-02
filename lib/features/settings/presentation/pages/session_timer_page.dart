import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/app_colors.dart';

/// Screen 20: Session Timer Control
/// Purpose: Set maximum play session duration
/// Design: Bilingual (Bengali + English) for parents
class SessionTimerPage extends StatefulWidget {
  const SessionTimerPage({super.key});

  @override
  State<SessionTimerPage> createState() => _SessionTimerPageState();
}

class _SessionTimerPageState extends State<SessionTimerPage> {
  int _selectedMinutes = 20; // Default 20 minutes

  final List<_TimerOption> _options = [
    _TimerOption(minutes: 10, bengali: '১০ মিনিট', english: '10 Minutes'),
    _TimerOption(minutes: 15, bengali: '১৫ মিনিট', english: '15 Minutes'),
    _TimerOption(minutes: 20, bengali: '২০ মিনিট', english: '20 Minutes'),
    _TimerOption(minutes: 30, bengali: '৩০ মিনিট', english: '30 Minutes'),
  ];

  @override
  void initState() {
    super.initState();
    _loadSavedTimer();
  }

  Future<void> _loadSavedTimer() async {
    final prefs = await SharedPreferences.getInstance();
    final savedMinutes = prefs.getInt('session_timer_minutes');
    if (savedMinutes != null && mounted) {
      setState(() {
        _selectedMinutes = savedMinutes;
      });
    }
  }

  Future<void> _saveTimer() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('session_timer_minutes', _selectedMinutes);
  }

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
                  // Info Section
                  _buildInfoSection(),
                  SizedBox(height: 24.h),

                  // Timer Options
                  _buildSectionLabel('Select Session Duration'),
                  SizedBox(height: 12.h),
                  ..._options.map((option) => Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: _buildTimerOption(option),
                      )),

                  SizedBox(height: 24.h),

                  // Visual Preview
                  _buildPreview(),

                  SizedBox(height: 24.h),

                  // Recommendation
                  _buildRecommendation(),

                  SizedBox(height: 32.h),
                ],
              ),
            ),
            _buildSaveButton(),
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
                  'সেশন টাইমার',
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkTeal,
                  ),
                ),
                Text(
                  'Session Timer',
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

  Widget _buildInfoSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber[50],
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.amber[200]!),
      ),
      padding: EdgeInsets.all(16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.timer, color: Colors.amber[700], size: 32.w),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'স্ক্রিন টাইম নিয়ন্ত্রণ',
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[900],
                  ),
                ),
                Text(
                  'Control Screen Time',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.amber[700],
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Set a maximum session duration. When time is up, a friendly reminder will appear encouraging your child to take a break.',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.amber[900],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: Colors.grey[500],
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildTimerOption(_TimerOption option) {
    final isSelected = _selectedMinutes == option.minutes;

    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        setState(() => _selectedMinutes = option.minutes);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accentGreen.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppColors.accentGreen : Colors.grey[200]!,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.accentGreen.withOpacity(0.2),
                    blurRadius: 10.r,
                    offset: Offset(0, 2.h),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 6.r,
                    offset: Offset(0, 2.h),
                  ),
                ],
        ),
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            // Radio indicator
            Container(
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.accentGreen : Colors.grey[300]!,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12.w,
                        height: 12.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.accentGreen,
                        ),
                      ),
                    )
                  : null,
            ),
            SizedBox(width: 16.w),

            // Clock icon
            Icon(
              Icons.access_time_filled,
              color: isSelected ? AppColors.accentGreen : Colors.grey[400],
              size: 28.w,
            ),
            SizedBox(width: 12.w),

            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option.bengali,
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? AppColors.accentGreen : AppColors.darkTeal,
                    ),
                  ),
                  Text(
                    option.english,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),

            // Checkmark
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppColors.accentGreen,
                size: 24.w,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreview() {
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
        children: [
          Text(
            'Preview: Break Reminder',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[500],
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 16.h),

          // Mini preview of break screen
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFF8F0),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey[200]!),
            ),
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                Text(
                  '😴',
                  style: TextStyle(fontSize: 40.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  'বিশ্রামের সময়!',
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkTeal,
                  ),
                ),
                Text(
                  'Time for a break!',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 12.h),
          Text(
            'This friendly message will appear after $_selectedMinutes minutes of play.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendation() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.blue[100]!),
      ),
      padding: EdgeInsets.all(12.w),
      child: Row(
        children: [
          Icon(Icons.lightbulb, color: Colors.blue[700], size: 20.w),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              '👨‍⚕️ Pediatricians recommend limiting screen time to 15-20 minutes for toddlers.',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.blue[700],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10.r,
            offset: Offset(0, -2.h),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              HapticFeedback.mediumImpact();
              await _saveTimer();
              if (context.mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'সেশন টাইমার সংরক্ষিত: $_selectedMinutes মিনিট',
                      style: const TextStyle(fontFamily: 'NotoSansBengali'),
                    ),
                    backgroundColor: AppColors.accentGreen,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accentGreen,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 16.h),
            ),
            child: Text(
              'সংরক্ষণ করুন (Save)',
              style: TextStyle(
                fontFamily: 'NotoSansBengali',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TimerOption {
  final int minutes;
  final String bengali;
  final String english;

  _TimerOption({
    required this.minutes,
    required this.bengali,
    required this.english,
  });
}
