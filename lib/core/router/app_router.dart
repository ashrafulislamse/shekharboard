import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../../features/learn/presentation/pages/learn_page.dart';
import '../../features/play/presentation/pages/play_page.dart';
import '../../features/play/presentation/pages/shadow_match_page.dart';
import '../../features/play/presentation/pages/sound_match_page.dart';
import '../../features/play/presentation/pages/find_game_page.dart';
import '../../features/play/presentation/pages/counting_game_page.dart';
import '../../features/play/presentation/pages/color_match_page.dart';
import '../../features/favorites/presentation/pages/favorites_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/onboarding/presentation/pages/language_selection_page.dart';
import '../../features/onboarding/presentation/pages/splash_page.dart';
import '../../features/onboarding/presentation/pages/welcome_page.dart';
import '../../features/settings/presentation/pages/parent_settings_page.dart';
import '../../features/settings/presentation/pages/session_timer_page.dart';
import '../../features/settings/presentation/pages/content_pack_page.dart';
import '../../features/settings/presentation/pages/about_page.dart';
import '../../features/settings/presentation/pages/help_page.dart';
import '../widgets/main_shell.dart';

/// App Router using go_router with ShellRoute for bottom navigation
class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static const String splash = '/splash';
  static const String languageSelection = '/language-selection';
  static const String welcome = '/welcome';
  static const String home = '/home';
  static const String learn = '/learn';
  static const String play = '/play';
  static const String favorites = '/favorites';
  static const String profile = '/profile';
  
  // Game routes (outside shell - no bottom nav)
  static const String gameShadowMatch = '/game/shadow-match';
  static const String gameSoundMatch = '/game/sound-match';
  static const String gameFind = '/game/find';
  static const String gameCounting = '/game/counting';
  static const String gameColorMatch = '/game/color-match';
  
  // Settings routes (outside shell - no bottom nav)
  static const String settingsParent = '/settings/parent';
  static const String settingsLanguage = '/settings/language';
  static const String settingsSessionTimer = '/settings/session-timer';
  static const String settingsContentPacks = '/settings/content-packs';
  static const String settingsAbout = '/settings/about';
  static const String settingsHelp = '/settings/help';

  static late final GoRouter router;

  static Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstLaunch = prefs.getBool('first_launch') ?? true;
    final languageCode = prefs.getString('language_code');

    String initialLocation;
    if (isFirstLaunch || languageCode == null) {
      initialLocation = languageSelection;
    } else {
      initialLocation = home;
    }

    router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: initialLocation,
      debugLogDiagnostics: true,
      routes: [
        // Onboarding routes (outside shell)
        GoRoute(
          path: languageSelection,
          name: 'languageSelection',
          builder: (context, state) => LanguageSelectionPage(
            onLanguageSelected: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('language_code', 'bn'); // Default to Bengali
              router.go(splash);
            },
          ),
        ),
        GoRoute(
          path: splash,
          name: 'splash',
          builder: (context, state) => SplashPage(
            onVerifyAssets: () async => true,
            onAssetsVerified: () {
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                final prefs = await SharedPreferences.getInstance();
                final isFirstLaunch = prefs.getBool('first_launch') ?? true;
                if (isFirstLaunch) {
                  router.go(welcome);
                } else {
                  router.go(home);
                }
              });
            },
            onAssetsFailed: () => router.go(home),
          ),
        ),
        GoRoute(
          path: welcome,
          name: 'welcome',
          builder: (context, state) => WelcomePage(
            onStart: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool('first_launch', false);
              router.go(home);
            },
          ),
        ),

        // Game routes (OUTSIDE shell - no bottom nav)
        GoRoute(
          path: gameShadowMatch,
          name: 'gameShadowMatch',
          builder: (context, state) => const ShadowMatchPage(),
        ),
        GoRoute(
          path: gameSoundMatch,
          name: 'gameSoundMatch',
          builder: (context, state) => const SoundMatchPage(),
        ),
        GoRoute(
          path: gameFind,
          name: 'gameFind',
          builder: (context, state) => const FindGamePage(),
        ),
        GoRoute(
          path: gameCounting,
          name: 'gameCounting',
          builder: (context, state) => const CountingGamePage(),
        ),
        GoRoute(
          path: gameColorMatch,
          name: 'gameColorMatch',
          builder: (context, state) => const ColorMatchPage(),
        ),

        // Settings routes (OUTSIDE shell - no bottom nav)
        GoRoute(
          path: settingsParent,
          name: 'settingsParent',
          builder: (context, state) => const ParentSettingsPage(),
        ),
        GoRoute(
          path: settingsLanguage,
          name: 'settingsLanguage',
          builder: (context, state) => LanguageSelectionPage(
            showBackButton: true,
            onLanguageSelected: () => Navigator.of(context).pop(),
          ),
        ),
        GoRoute(
          path: settingsSessionTimer,
          name: 'settingsSessionTimer',
          builder: (context, state) => const SessionTimerPage(),
        ),
        GoRoute(
          path: settingsContentPacks,
          name: 'settingsContentPacks',
          builder: (context, state) => const ContentPackPage(),
        ),
        GoRoute(
          path: settingsAbout,
          name: 'settingsAbout',
          builder: (context, state) => const AboutPage(),
        ),
        GoRoute(
          path: settingsHelp,
          name: 'settingsHelp',
          builder: (context, state) => const HelpPage(),
        ),

        // Main app with shell (bottom navigation)
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => MainShell(child: child),
          routes: [
            GoRoute(
              path: home,
              name: 'home',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomePage(),
              ),
            ),
            GoRoute(
              path: learn,
              name: 'learn',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: LearnPage(),
              ),
            ),
            GoRoute(
              path: play,
              name: 'play',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: PlayPage(),
              ),
            ),
            GoRoute(
              path: favorites,
              name: 'favorites',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: FavoritesPage(),
              ),
            ),
            GoRoute(
              path: profile,
              name: 'profile',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProfilePage(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
