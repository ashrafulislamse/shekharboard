/// Design Tokens - Spacing System
/// From wireframe: 01-foundation-screens.md
class AppSpacing {
  AppSpacing._();

  // ═══════════════════════════════════════════════════════════════════════════
  // SPACING (dp)
  // ═══════════════════════════════════════════════════════════════════════════
  
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  // ═══════════════════════════════════════════════════════════════════════════
  // RADIUS (dp)
  // ═══════════════════════════════════════════════════════════════════════════
  
  static const double radiusSmall = 8.0;   // buttons, inputs
  static const double radiusMedium = 16.0; // cards, dialogs
  static const double radiusLarge = 24.0;  // tiles, containers
  static const double radiusFull = 999.0;  // circular elements

  // ═══════════════════════════════════════════════════════════════════════════
  // TOUCH TARGETS (dp)
  // ═══════════════════════════════════════════════════════════════════════════
  
  static const double touchMinimum = 44.0;  // icons, small buttons
  static const double touchStandard = 56.0; // primary buttons
  static const double touchLarge = 72.0;    // main tiles - children
  static const double touchXL = 88.0;       // accessibility mode
}
