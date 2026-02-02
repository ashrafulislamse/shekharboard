import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/unified_tab_header.dart';
import '../../../../core/utils/progress_service.dart';
import '../widgets/score_card.dart';
import '../widgets/easy_game_card.dart';
import '../widgets/medium_game_card.dart';
import '../widgets/locked_game_card.dart';
import '../widgets/daily_badge_card.dart';
import '../widgets/game_section_header.dart';
import '../widgets/achievements_sheet.dart';

/// Play Page - Game center with score card and categorized games
class PlayPage extends StatefulWidget {
  const PlayPage({super.key});

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  final ProgressService _progressService = ProgressService();

  @override
  void initState() {
    super.initState();
    _initProgress();
    _progressService.addListener(_onProgressChanged);
  }

  @override
  void dispose() {
    _progressService.removeListener(_onProgressChanged);
    super.dispose();
  }

  Future<void> _initProgress() async {
    await _progressService.init();
    if (mounted) setState(() {});
  }

  void _onProgressChanged() {
    if (mounted) setState(() {});
  }

  void _showAchievements() {
    HapticFeedback.lightImpact();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => AchievementsSheet(
        gamesPlayed: _progressService.gamesPlayed,
        gamesWon: _progressService.gamesWon,
        totalPoints: _progressService.totalGamePoints,
        streak: _progressService.gameStreak,
      ),
    );
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
        child: Column(
          children: [
            // Unified Header
            UnifiedTabHeader(
              title: 'খেলা',
              subtitle: 'মজার খেলা খেলি! 🎮',
              actionIcon: Icons.emoji_events_rounded,
              onActionTap: _showAchievements,
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h),

                      // Score Card - Real data
                      ScoreCard(
                        points: _progressService.todayGamePoints,
                        played: _progressService.gamesPlayed,
                        won: _progressService.gamesWon,
                        streak: _progressService.gameStreak,
                      ),

                      SizedBox(height: 24.h),

                      // Easy Games Section - Soft mint green
                      const GameSectionHeader(
                        titleBn: 'সহজ খেলা',
                        accentColor: Color(0xFF66BB6A),
                      ),
                      _buildEasyGamesRow(),

                      SizedBox(height: 28.h),

                      // Medium Games Section - Soft sky blue
                      const GameSectionHeader(
                        titleBn: 'মাঝারি খেলা',
                        accentColor: Color(0xFF42A5F5),
                      ),
                      _buildMediumGamesGrid(),

                      SizedBox(height: 28.h),

                      // Hard Games Section (Locked) - Soft violet
                      const GameSectionHeader(
                        titleBn: 'কঠিন খেলা',
                        accentColor: Color(0xFFAB47BC),
                      ),
                      SizedBox(
                        height: 140.h,
                        child: LockedGameCard(
                          titleBn: 'পাজল মেলাও',
                          subtitleBn: 'লজিক পাজল গেম। কঠিন লেভেলের জন্য।',
                          emoji: '🧩',
                          progress: _getUnlockProgress(),
                          onUnlockTap: () => _showUnlockInfo(context),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // Daily Badge Card - Real data
                      DailyBadgeCard(
                        currentPoints: _progressService.todayGamePoints,
                        targetPoints: 100,
                        progress: (_progressService.todayGamePoints / 100).clamp(0.0, 1.0),
                      ),

                      // Bottom spacing for nav bar
                      SizedBox(height: 100.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Easy games horizontal scroll
  Widget _buildEasyGamesRow() {
    return SizedBox(
      height: 165.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        itemCount: _easyGames.length,
        itemBuilder: (context, index) {
          final game = _easyGames[index];
          return Padding(
            padding: EdgeInsets.only(right: 14.w),
            child: EasyGameCard(
              titleBn: game.titleBn,
              subtitleBn: game.subtitleBn,
              emoji: game.emoji,
              accentColor: const Color(0xFF66BB6A),
              onTap: () {
                HapticFeedback.lightImpact();
                _navigateToGame(context, game.gameId);
              },
            ),
          );
        },
      ),
    );
  }

  /// Medium games 2-column grid
  Widget _buildMediumGamesGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.w,
        childAspectRatio: 0.85,
      ),
      itemCount: _mediumGames.length,
      itemBuilder: (context, index) {
        final game = _mediumGames[index];
        return MediumGameCard(
          titleBn: game.titleBn,
          subtitleBn: game.subtitleBn,
          emoji: game.emoji,
          badgeIcon: game.badgeIcon,
          onTap: () {
            HapticFeedback.lightImpact();
            _navigateToGame(context, game.gameId);
          },
        );
      },
    );
  }

  /// Navigate to the specific game page using GoRouter (outside shell)
  void _navigateToGame(BuildContext context, String gameId) {
    String? route;
    
    switch (gameId) {
      case 'find':
        route = AppRouter.gameFind;
        break;
      case 'color':
        route = AppRouter.gameColorMatch;
        break;
      case 'sound':
        route = AppRouter.gameSoundMatch;
        break;
      case 'shadow':
        route = AppRouter.gameShadowMatch;
        break;
      case 'counting':
        route = AppRouter.gameCounting;
        break;
    }
    
    if (route != null) {
      context.push(route);
    }
  }

  /// Calculate unlock progress based on games won
  double _getUnlockProgress() {
    // Unlock hard games after winning 10 games
    const requiredWins = 10;
    return (_progressService.gamesWon / requiredWins).clamp(0.0, 1.0);
  }

  /// Show unlock information dialog
  void _showUnlockInfo(BuildContext context) {
    HapticFeedback.lightImpact();
    final remaining = 10 - _progressService.gamesWon;
    
    if (remaining <= 0) {
      // Already unlocked - navigate to game
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'পাজল খেলা শীঘ্রই আসছে! 🧩',
            style: TextStyle(fontFamily: 'NotoSansBengali'),
          ),
          backgroundColor: const Color(0xFFAB47BC),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    } else {
      // Show progress dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              const Text('🔒', style: TextStyle(fontSize: 24)),
              SizedBox(width: 8.w),
              const Text(
                'লক করা',
                style: TextStyle(
                  fontFamily: 'NotoSansBengali',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Text(
            'কঠিন খেলা খুলতে আরও ${_toBengaliNumber(remaining)} টি খেলায় জিততে হবে! 💪',
            style: const TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'বুঝেছি',
                style: TextStyle(
                  fontFamily: 'NotoSansBengali',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  String _toBengaliNumber(int number) {
    const bengaliDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    return number.toString().split('').map((d) => bengaliDigits[int.parse(d)]).join();
  }

  void _showComingSoon(BuildContext context, String gameName) {
    HapticFeedback.lightImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$gameName - শীঘ্রই আসছে!',
          style: const TextStyle(fontFamily: 'NotoSansBengali'),
        ),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  // ============ DATA ============

  static final List<_GameData> _easyGames = [
    _GameData('খুঁজে বের কর', 'মনোযোগ বৃদ্ধি', '🔍', 'find'),
    _GameData('রঙ চিনো', 'রঙের পরিচয়', '🎨', 'color'),
    _GameData('শব্দ চিনো', 'শোনার দক্ষতা', '🔊', 'sound'),
  ];

  static final List<_MediumGameData> _mediumGames = [
    _MediumGameData('মিল করো', 'মস্তিষ্কের ব্যায়াম', '🧠', Icons.extension, 'shadow'),
    _MediumGameData('গণনা শেখো', 'গাণিতিক দক্ষতা', '🔢', Icons.calculate, 'counting'),
  ];
}

// ============ DATA CLASSES ============

class _GameData {
  final String titleBn;
  final String subtitleBn;
  final String emoji;
  final String gameId;

  const _GameData(this.titleBn, this.subtitleBn, this.emoji, this.gameId);
}

class _MediumGameData {
  final String titleBn;
  final String subtitleBn;
  final String emoji;
  final IconData badgeIcon;
  final String gameId;

  const _MediumGameData(this.titleBn, this.subtitleBn, this.emoji, this.badgeIcon, this.gameId);
}
