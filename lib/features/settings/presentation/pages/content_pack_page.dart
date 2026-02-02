import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Screen 19: Content Pack Management
/// Purpose: Enable/disable and purchase content packs
/// Design: Bilingual (Bengali + English) for parents
class ContentPackPage extends StatefulWidget {
  const ContentPackPage({super.key});

  @override
  State<ContentPackPage> createState() => _ContentPackPageState();
}

class _ContentPackPageState extends State<ContentPackPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Active states for free packs
  final Map<String, bool> _activeStates = {
    'animals': true,
    'fruits': true,
    'vehicles': true,
    'colors': false,
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildMyPacksTab(),
                  _buildPremiumPacksTab(),
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
                  'কন্টেন্ট প্যাক',
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkTeal,
                  ),
                ),
                Text(
                  'Content Packs',
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

  Widget _buildTabBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.all(4.w),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4.r,
            ),
          ],
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: AppColors.darkTeal,
        unselectedLabelColor: Colors.grey[500],
        labelStyle: TextStyle(
          fontFamily: 'NotoSansBengali',
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'NotoSansBengali',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        dividerColor: Colors.transparent,
        tabs: const [
          Tab(text: 'আমার প্যাক'),
          Tab(text: 'প্রিমিয়াম'),
        ],
      ),
    );
  }

  Widget _buildMyPacksTab() {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        // Info banner
        Container(
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.blue[100]!),
          ),
          padding: EdgeInsets.all(12.w),
          child: Row(
            children: [
              Icon(Icons.info_outline, color: Colors.blue[700], size: 20.w),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'Toggle packs ON/OFF for your child\'s learning board',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.blue[700],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),

        // Free Packs
        _buildPackCard(
          id: 'animals',
          icon: '🐘',
          titleBn: 'প্রাণী',
          titleEn: 'Animals',
          items: '15 items',
          badge: 'FREE',
          badgeColor: Colors.green,
        ),
        SizedBox(height: 12.h),

        _buildPackCard(
          id: 'fruits',
          icon: '🍎',
          titleBn: 'ফল',
          titleEn: 'Fruits',
          items: '12 items',
          badge: 'FREE',
          badgeColor: Colors.green,
        ),
        SizedBox(height: 12.h),

        _buildPackCard(
          id: 'vehicles',
          icon: '🚗',
          titleBn: 'যানবাহন',
          titleEn: 'Vehicles',
          items: '10 items',
          badge: 'FREE',
          badgeColor: Colors.green,
        ),
        SizedBox(height: 12.h),

        _buildPackCard(
          id: 'colors',
          icon: '🎨',
          titleBn: 'রং',
          titleEn: 'Colors',
          items: '8 items',
          badge: 'FREE',
          badgeColor: Colors.green,
        ),
        SizedBox(height: 32.h),
      ],
    );
  }

  Widget _buildPackCard({
    required String id,
    required String icon,
    required String titleBn,
    required String titleEn,
    required String items,
    required String badge,
    required Color badgeColor,
  }) {
    final isActive = _activeStates[id] ?? false;

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
      child: Row(
        children: [
          // Icon
          Container(
            width: 56.w,
            height: 56.w,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Text(
                icon,
                style: TextStyle(fontSize: 32.sp),
              ),
            ),
          ),
          SizedBox(width: 16.w),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      titleBn,
                      style: TextStyle(
                        fontFamily: 'NotoSansBengali',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkTeal,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: badgeColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        badge,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: badgeColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  '$titleEn • $items',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),

          // Toggle
          Switch(
            value: isActive,
            onChanged: (val) {
              HapticFeedback.lightImpact();
              setState(() => _activeStates[id] = val);
            },
            activeColor: AppColors.accentGreen,
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumPacksTab() {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        // Premium info banner
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.amber[100]!, Colors.amber[50]!],
            ),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.amber[200]!),
          ),
          padding: EdgeInsets.all(12.w),
          child: Row(
            children: [
              Icon(Icons.star, color: Colors.amber[700], size: 20.w),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'Premium packs include more items and exclusive content!',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.amber[900],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),

        // Premium Packs
        _buildPremiumPackCard(
          icon: '🔤',
          titleBn: 'বর্ণমালা',
          titleEn: 'Bengali Alphabet',
          items: '50 items (স্বরবর্ণ + ব্যঞ্জনবর্ণ)',
          price: '৳49',
          features: ['All vowels', 'All consonants', 'Writing practice'],
        ),
        SizedBox(height: 12.h),

        _buildPremiumPackCard(
          icon: '🔢',
          titleBn: 'সংখ্যা',
          titleEn: 'Numbers 1-100',
          items: '100 items',
          price: '৳39',
          features: ['Numbers 1-100', 'Counting exercises', 'Audio pronunciation'],
        ),
        SizedBox(height: 12.h),

        _buildPremiumPackCard(
          icon: '🏠',
          titleBn: 'ঘরোয়া জিনিস',
          titleEn: 'Household Items',
          items: '25 items',
          price: '৳29',
          features: ['Kitchen items', 'Bedroom items', 'Living room items'],
        ),
        SizedBox(height: 12.h),

        _buildPremiumPackCard(
          icon: '👨‍👩‍👧‍👦',
          titleBn: 'পরিবার',
          titleEn: 'Family & Body Parts',
          items: '30 items',
          price: '৳29',
          features: ['Family members', 'Body parts', 'Relationships'],
        ),
        SizedBox(height: 32.h),
      ],
    );
  }

  Widget _buildPremiumPackCard({
    required String icon,
    required String titleBn,
    required String titleEn,
    required String items,
    required String price,
    required List<String> features,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.amber[200]!),
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
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Container(
                width: 56.w,
                height: 56.w,
                decoration: BoxDecoration(
                  color: Colors.amber[50],
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    icon,
                    style: TextStyle(fontSize: 32.sp),
                  ),
                ),
              ),
              SizedBox(width: 16.w),

              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            titleBn,
                            style: TextStyle(
                              fontFamily: 'NotoSansBengali',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkTeal,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            price,
                            style: TextStyle(
                              fontFamily: 'NotoSansBengali',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '$titleEn • $items',
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
          SizedBox(height: 12.h),

          // Features
          ...features.map((feature) => Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: AppColors.accentGreen,
                      size: 16.w,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      feature,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              )),

          SizedBox(height: 12.h),

          // Buy button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                HapticFeedback.mediumImpact();
                _showPurchaseDialog(context, titleBn, titleEn, price);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentGreen,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.h),
              ),
              child: Text(
                'কিনুন (Buy Now)',
                style: TextStyle(
                  fontFamily: 'NotoSansBengali',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPurchaseDialog(BuildContext context, String titleBn, String titleEn, String price) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.accentGreen.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shopping_cart,
                color: AppColors.accentGreen,
                size: 40.w,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              titleBn,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'NotoSansBengali',
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.darkTeal,
              ),
            ),
            Text(
              titleEn,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.amber[50],
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.amber[200]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.construction, color: Colors.amber[700], size: 24.w),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'শীঘ্রই আসছে!',
                          style: TextStyle(
                            fontFamily: 'NotoSansBengali',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber[900],
                          ),
                        ),
                        Text(
                          'Coming Soon!',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.amber[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'In-app purchases will be available in a future update. Stay tuned!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkTeal,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.h),
              ),
              child: Text(
                'ঠিক আছে (OK)',
                style: TextStyle(
                  fontFamily: 'NotoSansBengali',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
