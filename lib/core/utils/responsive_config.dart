import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Responsive Design System for Low-End Devices
class ResponsiveConfig {
  ResponsiveConfig._();

  /// Initialize ScreenUtil based on device size
  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    
    // Determine device category
    if (width < 360) {
      // Small phone (low-end devices)
      ScreenUtil.init(context, designSize: const Size(320, 568));
    } else if (width < 400) {
      // Medium phone (most common in Bangladesh)
      ScreenUtil.init(context, designSize: const Size(360, 640));
    } else if (width < 600) {
      // Large phone
      ScreenUtil.init(context, designSize: const Size(400, 720));
    } else {
      // Tablet
      ScreenUtil.init(context, designSize: const Size(600, 960));
    }
  }
  
  /// Get tile size based on screen width
  static double getTileSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 360) return 100.w;
    if (width < 400) return 120.w;
    if (width < 600) return 140.w;
    return 160.w;
  }
  
  /// Get grid columns (2 for phone, 3 for tablet)
  static int getGridColumns(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 600 ? 2 : 3;
  }
  
  /// Get font scale factor
  static double getFontScale(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 360) return 0.9;
    if (width < 400) return 1.0;
    if (width < 600) return 1.1;
    return 1.2;
  }
  
  /// Check if device is tablet
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600;
  }
  
  /// Check if device is small phone
  static bool isSmallPhone(BuildContext context) {
    return MediaQuery.of(context).size.width < 360;
  }
}
