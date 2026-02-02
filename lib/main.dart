import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'core/constants/app_constants.dart';
import 'core/constants/app_colors.dart';
import 'core/router/app_router.dart';
import 'core/utils/audio_service.dart';
import 'core/utils/favorites_service.dart';
import 'core/utils/progress_service.dart';
import 'l10n/app_localizations.dart';
import 'features/settings/presentation/providers/settings_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Synchronous system UI setup only - NO async work before first frame
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarContrastEnforced: false,
    ),
  );
  
  // Run app IMMEDIATELY - no awaits
  runApp(const ShekharBoardApp());
}

class ShekharBoardApp extends StatefulWidget {
  const ShekharBoardApp({super.key});

  @override
  State<ShekharBoardApp> createState() => _ShekharBoardAppState();
}

class _ShekharBoardAppState extends State<ShekharBoardApp> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    // Defer ALL heavy work to after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeApp();
    });
  }

  Future<void> _initializeApp() async {
    // Now safe to do async work - first frame already rendered
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    
    // Initialize router (reads SharedPreferences)
    await AppRouter.initialize();
    
    // Initialize services in parallel
    await Future.wait([
      AudioService().init(),
      FavoritesService().init(),
      ProgressService().init(),
    ]);
    
    if (mounted) {
      setState(() => _initialized = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Phase 1: Show lightweight loading screen IMMEDIATELY
    if (!_initialized) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const _LightweightLoadingScreen(),
      );
    }

    // Phase 2: Show full app after initialization
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => SettingsProvider()),
          ],
          child: Consumer<SettingsProvider>(
            builder: (context, settings, _) {
              return MaterialApp.router(
                title: AppConstants.appName,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                
                // Go Router configuration
                routerConfig: AppRouter.router,
                
                // Localization setup
                locale: Locale(settings.language),
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('bn'),
                  Locale('en'),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

/// Ultra-lightweight loading screen - NO animations, NO async, NO logic
/// Purpose: Render first frame INSTANTLY to avoid dropped frames
class _LightweightLoadingScreen extends StatelessWidget {
  const _LightweightLoadingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmCream,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Simple static text - no images to decode
            Text(
              '🐄',
              style: TextStyle(fontSize: 64),
            ),
            SizedBox(height: 16),
            Text(
              'শেখার বোর্ড',
              style: TextStyle(
                fontFamily: 'NotoSansBengali',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.darkTeal,
              ),
            ),
            SizedBox(height: 24),
            // Simple loading indicator
            SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
