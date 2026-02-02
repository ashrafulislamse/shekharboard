import 'package:flutter/material.dart';

/// Design Tokens - Color Psychology System for Ages 1-5 (Bangladesh Edition)
/// From wireframe: 01-foundation-screens.md
/// Updated to match HTML design
class AppColors {
  AppColors._();

  // ═══════════════════════════════════════════════════════════════════════════
  // PRIMARY COLOR PALETTE (From HTML Design)
  // ═══════════════════════════════════════════════════════════════════════════
  
  /// Background Primary - Warm Cream (Calm, safe, familiar)
  static const Color warmCream = Color(0xFFFAF6F0);
  
  /// Background Secondary - Pure White
  static const Color white = Color(0xFFFFFFFF);
  
  /// Text Primary - Dark
  static const Color textMain = Color(0xFF131614);
  
  /// Text Secondary - Muted
  static const Color textMuted = Color(0xFF6D7E74);
  
  /// Active Navigation - Dark Teal
  static const Color activeTeal = Color(0xFF00695C);
  
  /// Primary - Soft Green (from HTML #7abd95)
  static const Color primary = Color(0xFF7ABD95);
  
  /// Primary Dark
  static const Color primaryDark = Color(0xFF639C7A);
  
  /// Text Primary - Dark Teal (Legacy - Stability, wisdom)
  static const Color darkTeal = Color(0xFF1B5E5E);
  
  /// Text Secondary - Muted Teal (Legacy)
  static const Color mutedTeal = Color(0xFF5D7A7A);
  
  /// Accent Green - Soft Leaf (Growth, nature, trust - Animal tiles)
  static const Color accentGreen = Color(0xFF7FBA96);
  
  /// Accent Blue - Sky Blue (Peace, clarity, focus - Fruit tiles)
  static const Color accentBlue = Color(0xFF87CEEB);
  
  /// Accent Yellow - Mango Yellow (Joy, energy, optimism - Vehicle tiles)
  static const Color accentYellow = Color(0xFFFFD54F);
  
  /// Accent Red - Clay Red (Warmth, comfort - Story tiles)
  static const Color accentRed = Color(0xFFC75146);
  
  /// Shadow Color - 15% opacity dark teal
  static const Color shadow = Color(0x261B5E5E);
  
  /// Overlay Color - 50% black (for tutorial overlay)
  static const Color overlay = Color(0x80000000);
  
  /// Tutorial Overlay - 70% black
  static const Color tutorialOverlay = Color(0xB3000000);

  // ═══════════════════════════════════════════════════════════════════════════
  // SEMANTIC COLORS
  // ═══════════════════════════════════════════════════════════════════════════
  
  /// Success state
  static const Color success = Color(0xFF4CAF50);
  
  /// Error state (muted for children)
  static const Color error = Color(0xFFE57373);
  
  /// Error background light
  static const Color errorLight = Color(0xFFFEF3F2);
  
  /// Info box background (20% mango yellow)
  static const Color infoBackground = Color(0x33FFD54F);

  // ═══════════════════════════════════════════════════════════════════════════
  // LEGACY ALIASES (for backward compatibility)
  // ═══════════════════════════════════════════════════════════════════════════
  
  static const Color softLeafGreen = accentGreen;
  static const Color skyBlue = accentBlue;
  static const Color mangoYellow = accentYellow;
  static const Color clayRed = accentRed;
  static const Color cardBackground = white;
  static const Color textPrimary = darkTeal;
  static const Color textSecondary = mutedTeal;

  // ═══════════════════════════════════════════════════════════════════════════
  // CATEGORY COLORS
  // ═══════════════════════════════════════════════════════════════════════════
  
  static const Map<String, Color> categoryColors = {
    'animals': accentGreen,
    'fruits': accentBlue,
    'vehicles': accentYellow,
    'numbers': Color(0xFFFFAB91),
    'colors': Color(0xFFCE93D8),
    'alphabet': Color(0xFF90CAF9),
    'stories': accentRed,
  };

  /// Get category color by name
  static Color getCategoryColor(String category) {
    return categoryColors[category.toLowerCase()] ?? accentGreen;
  }
}
