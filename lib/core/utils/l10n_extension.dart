import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

/// Extension to easily access localization from BuildContext
extension LocalizationExtension on BuildContext {
  /// Get AppLocalizations instance
  AppLocalizations get l10n => AppLocalizations.of(this)!;
  
  /// Check if current locale is Bengali
  bool get isBengali => Localizations.localeOf(this).languageCode == 'bn';
  
  /// Check if current locale is English
  bool get isEnglish => Localizations.localeOf(this).languageCode == 'en';
}
