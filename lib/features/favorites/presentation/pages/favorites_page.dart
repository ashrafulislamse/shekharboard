import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/unified_tab_header.dart';
import '../../../../core/utils/favorites_service.dart';
import '../../../../core/utils/audio_service.dart';
import '../widgets/favorites_filter_chips.dart';
import '../widgets/favorites_stats_card.dart';
import '../widgets/favorite_item_card.dart';
import '../widgets/favorites_empty_state.dart';

/// Favorites Page - Saved items and words
class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  String _selectedFilter = 'সব';
  final FavoritesService _favoritesService = FavoritesService();
  final AudioService _audioService = AudioService();

  @override
  void initState() {
    super.initState();
    _initFavorites();
    _favoritesService.addListener(_onFavoritesChanged);
  }

  @override
  void dispose() {
    _favoritesService.removeListener(_onFavoritesChanged);
    super.dispose();
  }

  Future<void> _initFavorites() async {
    await _favoritesService.init();
    if (mounted) setState(() {});
  }

  void _onFavoritesChanged() {
    if (mounted) setState(() {});
  }

  List<FavoriteItem> get _filteredFavorites {
    if (_selectedFilter == 'সব') return _favoritesService.favorites;
    
    // Map filter names to category IDs
    final filterMap = {
      'প্রাণী': 'animals',
      'ফল': 'fruits',
      'যানবাহন': 'vehicles',
      'সংখ্যা': 'numbers',
      'রং': 'colors',
    };
    
    final categoryId = filterMap[_selectedFilter] ?? _selectedFilter;
    return _favoritesService.getFavoritesByCategory(categoryId);
  }

  void _removeFavorite(String id) async {
    HapticFeedback.mediumImpact();
    await _favoritesService.removeFavorite(id);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'পছন্দ থেকে সরানো হয়েছে',
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 14.sp,
            ),
          ),
          backgroundColor: AppColors.primary,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          margin: EdgeInsets.all(16.w),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _playAudio(FavoriteItem item) async {
    HapticFeedback.lightImpact();
    if (item.categoryId.isNotEmpty && item.audioBn.isNotEmpty) {
      try {
        await _audioService.playWord(item.categoryId, item.audioBn);
      } catch (e) {
        debugPrint('Audio playback error: $e');
      }
    }
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Unified Header
            UnifiedTabHeader(
              title: 'পছন্দ',
              subtitle: 'তোমার প্রিয় জিনিস ❤️',
            ),

            // Filter chips
            FavoritesFilterChips(
              selectedFilter: _selectedFilter,
              onFilterChanged: (filter) {
                setState(() => _selectedFilter = filter);
              },
            ),

            SizedBox(height: 12.h),

            // Stats card
            FavoritesStatsCard(count: _favoritesService.count),

            SizedBox(height: 16.h),

            // Content
            Expanded(
              child: _favoritesService.favorites.isEmpty
                  ? const FavoritesEmptyState()
                  : _buildFavoritesGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoritesGrid() {
    final filtered = _filteredFavorites;

    if (filtered.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('🔍', style: TextStyle(fontSize: 60.sp)),
            SizedBox(height: 16.h),
            Text(
              'এই ক্যাটেগরিতে কিছু নেই',
              style: TextStyle(
                fontFamily: 'NotoSansBengali',
                fontSize: 16.sp,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 100.h),
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.72,
      ),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final item = filtered[index];
        return FavoriteItemCard(
          id: item.id,
          nameBn: item.nameBn,
          emoji: item.emoji,
          categoryBn: item.categoryBn,
          categoryId: item.categoryId,
          onTap: () => _playAudio(item),
          onUnfavorite: () => _removeFavorite(item.id),
        );
      },
    );
  }
}
