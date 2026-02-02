import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/unified_tab_header.dart';
import '../../../../core/utils/progress_service.dart';
import '../../../../core/utils/favorites_service.dart';
import '../../../settings/presentation/widgets/math_gate_dialog.dart';
import '../widgets/profile_card.dart';
import '../widgets/profile_stats_row.dart';
import '../widgets/weekly_progress_card.dart';
import '../widgets/achievements_section.dart';
import '../widgets/settings_section.dart';

/// Profile Page - Child's profile and progress
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProgressService _progressService = ProgressService();
  final FavoritesService _favoritesService = FavoritesService();

  // Replace with your actual URLs
  static const String _privacyPolicyUrl = 'https://zingswift.com/shekharboard/privacy';
  static const String _termsUrl = 'https://zingswift.com/shekharboard/terms';

  @override
  void initState() {
    super.initState();
    _initServices();
    _progressService.addListener(_onDataChanged);
    _favoritesService.addListener(_onDataChanged);
  }

  @override
  void dispose() {
    _progressService.removeListener(_onDataChanged);
    _favoritesService.removeListener(_onDataChanged);
    super.dispose();
  }

  Future<void> _initServices() async {
    await _progressService.init();
    await _favoritesService.init();
    if (mounted) setState(() {});
  }

  void _onDataChanged() {
    if (mounted) setState(() {});
  }

  void _openPrivacyPolicy(BuildContext context) {
    HapticFeedback.lightImpact();
    _launchUrl(_privacyPolicyUrl);
  }

  void _openTerms(BuildContext context) {
    HapticFeedback.lightImpact();
    _launchUrl(_termsUrl);
  }

  Future<void> _launchUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      // URL couldn't be launched
      debugPrint('Could not launch $url');
    }
  }

  int get _badgesCount {
    // Count unlocked achievements based on progress
    int badges = 0;
    if (_progressService.totalItemsLearned >= 1) badges++; // First Learn
    if (_progressService.totalItemsLearned >= 5) badges++; // Explorer
    if (_progressService.totalItemsLearned >= 10) badges++; // Fast Learner
    if (_progressService.currentStreak >= 3) badges++; // Streak 3
    if (_progressService.currentStreak >= 7) badges++; // Week Warrior
    if (_favoritesService.count >= 5) badges++; // Collector
    return badges;
  }

  List<Achievement> get _achievements {
    return [
      Achievement(
        id: 'first_learn',
        emoji: '🏅',
        label: 'প্রথম শেখা',
        unlocked: _progressService.totalItemsLearned >= 1,
        gradientStart: const Color(0xFFFFF9C4),
        gradientEnd: const Color(0xFFFFE0B2),
        borderColor: const Color(0xFFFFCC80),
      ),
      Achievement(
        id: 'explorer',
        emoji: '🌟',
        label: 'অনুসন্ধানী',
        unlocked: _progressService.totalItemsLearned >= 5,
        gradientStart: const Color(0xFFE8F5E9),
        gradientEnd: const Color(0xFFE0F2F1),
        borderColor: const Color(0xFFA5D6A7),
      ),
      Achievement(
        id: 'streak_3',
        emoji: '🔥',
        label: '৩ দিন স্ট্রিক',
        unlocked: _progressService.currentStreak >= 3,
        gradientStart: const Color(0xFFFFE0B2),
        gradientEnd: const Color(0xFFFFCCBC),
        borderColor: const Color(0xFFFFAB91),
      ),
      Achievement(
        id: 'collector',
        emoji: '❤️',
        label: 'সংগ্রাহক',
        unlocked: _favoritesService.count >= 5,
        gradientStart: const Color(0xFFFCE4EC),
        gradientEnd: const Color(0xFFF8BBD9),
        borderColor: const Color(0xFFF48FB1),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Set status bar to match background
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.warmCream,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    
    return Container(
      color: AppColors.warmCream,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Unified Header
              const UnifiedTabHeader(
                title: 'প্রোফাইল',
                subtitle: 'তোমার অগ্রগতি দেখো 🌟',
              ),

              // Profile Card
              const ProfileCard(
                name: 'সোনা',
                age: '৩',
                avatarEmoji: '👶',
              ),

            SizedBox(height: 24.h),

            // Stats Row - Now using real data
            ProfileStatsRow(
              learnedCount: _progressService.totalItemsLearned,
              favoritesCount: _favoritesService.count,
              badgesCount: _badgesCount,
            ),

            SizedBox(height: 32.h),

            // Weekly Progress - Now using real data
            WeeklyProgressCard(
              streakDays: _progressService.currentStreak,
              weeklyProgress: _progressService.getWeeklyProgress(),
            ),

            SizedBox(height: 32.h),

            // Achievements - Now using real data
            AchievementsSection(achievements: _achievements),

            SizedBox(height: 32.h),

            // Settings - Basic settings
            SettingsSection(
              items: [
                SettingsItem(
                  id: 'sound',
                  icon: Icons.volume_up_rounded,
                  label: 'শব্দ',
                  iconBgColor: const Color(0xFFE0F2F1),
                  iconColor: AppColors.primary,
                  isToggle: true,
                  toggleValue: true,
                ),
                SettingsItem(
                  id: 'language',
                  icon: Icons.language_rounded,
                  label: 'ভাষা',
                  iconBgColor: const Color(0xFFE3F2FD),
                  iconColor: const Color(0xFF1976D2),
                  subtitle: 'বাংলা',
                  onTap: () => context.push('/settings/language'),
                ),
                SettingsItem(
                  id: 'parent',
                  icon: Icons.admin_panel_settings_rounded,
                  label: 'অভিভাবক নিয়ন্ত্রণ',
                  iconBgColor: const Color(0xFFFFEBEE),
                  iconColor: const Color(0xFFE53935),
                  onTap: () async {
                    final verified = await MathGateDialog.show(context);
                    if (verified && context.mounted) {
                      context.push('/settings/parent');
                    }
                  },
                ),
              ],
            ),

            SizedBox(height: 24.h),

            // Direct Legal Links - Google Play Compliance (no gate required)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _openPrivacyPolicy(context),
                    child: Text(
                      'গোপনীয়তা নীতি',
                      style: TextStyle(
                        fontFamily: 'NotoSansBengali',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Text(
                      '•',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _openTerms(context),
                    child: Text(
                      'শর্তাবলী',
                      style: TextStyle(
                        fontFamily: 'NotoSansBengali',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Text(
                      '•',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.push('/settings/about'),
                    child: Text(
                      'সম্পর্কে',
                      style: TextStyle(
                        fontFamily: 'NotoSansBengali',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // Version
            Center(
              child: Text(
                'সংস্করণ ১.০.০',
                style: TextStyle(
                  fontFamily: 'NotoSansBengali',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade400,
                ),
              ),
            ),

            SizedBox(height: 100.h), // Space for bottom nav
          ],
        ),
        ),
      ),
    );
  }
}
