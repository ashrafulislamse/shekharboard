/// App-wide constants
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'শেখার বোর্ড';
  static const String appNameBn = 'শেখার বোর্ড';
  static const String appNameEn = 'Shekhar Board';
  static const String packageName = 'com.zingswift.shekharboard';
  
  // Target Audience
  static const int minAge = 1;
  static const int maxAge = 5;
  
  // Device Targets
  static const int minAndroidSdk = 23; // Android 6.0
  static const double minIosVersion = 12.0;
  
  // Performance Targets
  static const int targetApkSizeMb = 50;
  static const int minRamMb = 2048; // 2GB
  
  // Grid Layout
  static const int phoneGridColumns = 2;
  static const int tabletGridColumns = 3;
  static const int phoneGridRows = 3;
  static const int tabletGridRows = 4;
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 400);
  static const Duration longAnimation = Duration(milliseconds: 600);
  
  // Audio
  static const String defaultVoice = 'female'; // Uses bn-female folder
  static const List<String> availableVoices = ['male', 'female', 'anime'];
  
  // Storage Keys
  static const String keyLanguage = 'app_language';
  static const String keyVoice = 'selected_voice';
  static const String keyFirstLaunch = 'is_first_launch';
  static const String keyParentPin = 'parent_pin';
  
  // Categories
  static const List<String> categories = [
    'animals',
    'fruits', 
    'vehicles',
    'numbers',
    'colors',
    'alphabet',
  ];
}
