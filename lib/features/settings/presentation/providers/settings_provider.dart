import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/app_constants.dart';

/// Settings Provider - Manages app settings state
class SettingsProvider extends ChangeNotifier {
  String _language = 'bn'; // Default Bangla
  String _voice = AppConstants.defaultVoice;
  bool _isFirstLaunch = true;

  String get language => _language;
  String get voice => _voice;
  bool get isFirstLaunch => _isFirstLaunch;

  /// Initialize settings from SharedPreferences
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _language = prefs.getString(AppConstants.keyLanguage) ?? 'bn';
    _voice = prefs.getString(AppConstants.keyVoice) ?? AppConstants.defaultVoice;
    _isFirstLaunch = prefs.getBool(AppConstants.keyFirstLaunch) ?? true;
    notifyListeners();
  }

  /// Set language preference
  Future<void> setLanguage(String lang) async {
    _language = lang;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.keyLanguage, lang);
    notifyListeners();
  }

  /// Set voice preference
  Future<void> setVoice(String voice) async {
    if (AppConstants.availableVoices.contains(voice)) {
      _voice = voice;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstants.keyVoice, voice);
      notifyListeners();
    }
  }

  /// Mark first launch complete
  Future<void> completeFirstLaunch() async {
    _isFirstLaunch = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppConstants.keyFirstLaunch, false);
    notifyListeners();
  }
}
