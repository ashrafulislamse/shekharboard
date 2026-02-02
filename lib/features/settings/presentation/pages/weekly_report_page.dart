import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Screen 18: Weekly Progress Report
/// Purpose: Shows child's learning progress for the week
/// Design: Bilingual (Bengali + English) for parents
/// Privacy: No internet sharing, device-only data
class WeeklyReportPage extends StatefulWidget {
  const WeeklyReportPage({super.key});

  @override
  State<WeeklyReportPage> createState() => _WeeklyReportPageState();
}

class _WeeklyReportPageState extends State<WeeklyReportPage> {
  String _selectedPeriod = 'এই সপ্তাহ';

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
                  // Period Selector
                  _buildPeriodSelector(),
                  SizedBox(height: 20.h),

                  // Summary Stats
                  _buildSummaryStats(),
                  SizedBox(height: 20.h),

                  // Time Spent Chart
                  _buildTimeChart(),
                  SizedBox(height: 20.h),

                  // Category Breakdown
                  _buildCategoryBreakdown(),
                  SizedBox(height: 20.h),

                  // Privacy Notice
                  _buildPrivacyNotice(),
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
                  'সাপ্তাহিক রিপোর্ট',
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkTeal,
                  ),
                ),
                Text(
                  'Weekly Report',
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

  Widget _buildPeriodSelector() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          _buildPeriodOption('এই সপ্তাহ', 'This Week'),
          _buildPeriodOption('গত সপ্তাহ', 'Last Week'),
        ],
      ),
    );
  }

  Widget _buildPeriodOption(String bengali, String english) {
    final isSelected = _selectedPeriod == bengali;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          HapticFeedback.lightImpact();
          setState(() => _selectedPeriod = bengali);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: isSelected
                ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4.r)]
                : null,
          ),
          child: Center(
            child: Text(
              bengali,
              style: TextStyle(
                fontFamily: 'NotoSansBengali',
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? AppColors.darkTeal : Colors.grey[500],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryStats() {
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
          Text(
            'Learning Summary',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[500],
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              _buildStatItem(
                value: '৪৫',
                labelBn: 'মিনিট',
                labelEn: 'Minutes',
                icon: Icons.timer,
                color: Colors.blue,
              ),
              Container(width: 1, height: 50.h, color: Colors.grey[200]),
              _buildStatItem(
                value: '১২',
                labelBn: 'আইটেম শিখেছে',
                labelEn: 'Items Learned',
                icon: Icons.school,
                color: Colors.green,
              ),
              Container(width: 1, height: 50.h, color: Colors.grey[200]),
              _buildStatItem(
                value: '৩',
                labelBn: 'সেশন',
                labelEn: 'Sessions',
                icon: Icons.play_circle_fill,
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required String value,
    required String labelBn,
    required String labelEn,
    required IconData icon,
    required Color color,
  }) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: color, size: 28.w),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.darkTeal,
            ),
          ),
          Text(
            labelEn,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeChart() {
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
          Text(
            'Daily Activity',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[500],
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildDayBar('শনি', 'Sat', 0.4),
              _buildDayBar('রবি', 'Sun', 0.7),
              _buildDayBar('সোম', 'Mon', 0.3),
              _buildDayBar('মঙ্গল', 'Tue', 0.8),
              _buildDayBar('বুধ', 'Wed', 0.5),
              _buildDayBar('বৃহ', 'Thu', 0.6),
              _buildDayBar('শুক্র', 'Fri', 0.2),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 12.w,
                height: 12.w,
                decoration: BoxDecoration(
                  color: AppColors.accentGreen,
                  borderRadius: BorderRadius.circular(3.r),
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                'Time Spent (Minutes)',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDayBar(String bengali, String english, double fillPercent) {
    final maxHeight = 100.h;
    return Column(
      children: [
        Container(
          width: 32.w,
          height: maxHeight,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 32.w,
              height: maxHeight * fillPercent,
              decoration: BoxDecoration(
                color: AppColors.accentGreen,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          english,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryBreakdown() {
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
          Text(
            'Category Breakdown',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[500],
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              // Pie chart placeholder
              Container(
                width: 80.w,
                height: 80.w,
                child: Stack(
                  children: [
                    // This would be a real pie chart in production
                    // Using custom paint or fl_chart package
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: SweepGradient(
                          colors: [
                            Colors.green,
                            Colors.green,
                            Colors.orange,
                            Colors.orange,
                            Colors.blue,
                            Colors.blue,
                            Colors.green,
                          ],
                          stops: const [0.0, 0.4, 0.4, 0.7, 0.7, 1.0, 1.0],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 50.w,
                        height: 50.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  children: [
                    _buildCategoryLegend('প্রাণী', 'Animals', '40%', Colors.green),
                    SizedBox(height: 8.h),
                    _buildCategoryLegend('ফল', 'Fruits', '30%', Colors.orange),
                    SizedBox(height: 8.h),
                    _buildCategoryLegend('যানবাহন', 'Vehicles', '30%', Colors.blue),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryLegend(
    String bengali,
    String english,
    String percent,
    Color color,
  ) {
    return Row(
      children: [
        Container(
          width: 12.w,
          height: 12.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3.r),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            '$bengali ($english)',
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 12.sp,
              color: AppColors.darkTeal,
            ),
          ),
        ),
        Text(
          percent,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.darkTeal,
          ),
        ),
      ],
    );
  }

  Widget _buildPrivacyNotice() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.blue[100]!),
      ),
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Icon(Icons.security, color: Colors.blue[700], size: 24.w),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🔒 Privacy Notice',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[700],
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'All progress data is stored locally on this device only and is never sent to the internet.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.blue[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
