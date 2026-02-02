import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_colors.dart';

/// Main Shell with Bottom Navigation
/// Matches screenshot: হোম, শেখা, খেলা, পছন্দ, প্রোফাইল with dot indicator
class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.warmCream,
        body: child,
        bottomNavigationBar: const _BottomNavBar(),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/learn')) return 1;
    if (location.startsWith('/play')) return 2;
    if (location.startsWith('/favorites')) return 3;
    if (location.startsWith('/profile')) return 4;
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    HapticFeedback.lightImpact();
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/learn');
        break;
      case 2:
        context.go('/play');
        break;
      case 3:
        context.go('/favorites');
        break;
      case 4:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getCurrentIndex(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 70.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                icon: Icons.home_rounded,
                label: 'হোম',
                isSelected: currentIndex == 0,
                onTap: () => _onTap(context, 0),
              ),
              _NavItem(
                icon: Icons.menu_book_rounded,
                label: 'শেখা',
                isSelected: currentIndex == 1,
                onTap: () => _onTap(context, 1),
              ),
              _NavItem(
                icon: Icons.sports_esports_rounded,
                label: 'খেলা',
                isSelected: currentIndex == 2,
                onTap: () => _onTap(context, 2),
              ),
              _NavItem(
                icon: Icons.favorite_rounded,
                label: 'পছন্দ',
                isSelected: currentIndex == 3,
                onTap: () => _onTap(context, 3),
              ),
              _NavItem(
                icon: Icons.person_rounded,
                label: 'প্রোফাইল',
                isSelected: currentIndex == 4,
                onTap: () => _onTap(context, 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.activeTeal : AppColors.textMuted;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 60.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Icon(
              icon,
              color: color,
              size: 24.sp,
            ),

            SizedBox(height: 4.h),

            // Label
            Text(
              label,
              style: TextStyle(
                fontFamily: 'NotoSansBengali',
                fontSize: 11.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: color,
              ),
            ),

            SizedBox(height: 4.h),

            // Dot indicator for selected item
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isSelected ? 6.w : 0,
              height: isSelected ? 6.w : 0,
              decoration: BoxDecoration(
                color: AppColors.activeTeal,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
