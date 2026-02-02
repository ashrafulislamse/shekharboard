import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/audio_service.dart';
import '../../../../core/utils/favorites_service.dart';
import '../../data/learn_data_repository.dart';
import '../models/category_item.dart';
import '../widgets/item_detail_header.dart';
import '../widgets/item_content.dart';
import '../widgets/page_indicator.dart';
import '../widgets/item_bottom_action_bar.dart';

/// Item Detail Page - Shows individual learning item with audio, spelling, and fun fact
/// Supports PageView swiping between items
/// Matches HTML design with hero image, sound button, spelling breakdown, and bottom actions
class ItemDetailPage extends StatefulWidget {
  final List<CategoryItem> items;
  final int initialIndex;
  final String categoryTitleBn;
  final Color accentColor;
  final String categoryId;  // For audio path (animals, fruits, etc.)

  const ItemDetailPage({
    super.key,
    required this.items,
    required this.initialIndex,
    required this.categoryTitleBn,
    required this.accentColor,
    this.categoryId = 'animals',  // Default category
  });

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  late PageController _pageController;
  late int _currentIndex;
  final Set<int> _learnedItems = {};
  final AudioService _audioService = AudioService();
  final FavoritesService _favoritesService = FavoritesService();

  // Get category folder name from Bengali title
  String get _categoryFolder => LearnDataRepository.getCategoryFolder(widget.categoryTitleBn);

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
    _favoritesService.init();
    
    // Mark already completed items as learned
    for (int i = 0; i < widget.items.length; i++) {
      if (widget.items[i].isCompleted) {
        _learnedItems.add(i);
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPrevious() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNext() {
    if (_currentIndex < widget.items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _markAsLearned() {
    setState(() {
      _learnedItems.add(_currentIndex);
    });
    
    // Auto advance to next if not last item
    if (_currentIndex < widget.items.length - 1) {
      Future.delayed(const Duration(milliseconds: 300), _goToNext);
    }
  }

  void _playSound() async {
    HapticFeedback.mediumImpact();
    
    final item = widget.items[_currentIndex];
    // Use item.id directly as the audio file name (e.g., 'goru', 'biral')
    await _audioService.playWord(_categoryFolder, item.id);
  }

  void _toggleFavorite() {
    HapticFeedback.lightImpact();
    final item = widget.items[_currentIndex];
    
    if (_favoritesService.isFavorite(item.id)) {
      _favoritesService.removeFavorite(item.id);
    } else {
      _favoritesService.addFavorite(FavoriteItem(
        id: item.id,
        nameBn: item.nameBn,
        nameEn: item.nameEn,
        emoji: item.emoji,
        categoryBn: widget.categoryTitleBn,
        categoryId: _categoryFolder,
        audioBn: '${_categoryFolder}/${item.id}_word.mp3',
      ));
    }
    setState(() {}); // Refresh UI
  }

  bool _isFavorite() {
    final item = widget.items[_currentIndex];
    return _favoritesService.isFavorite(item.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // PageView for swiping between items
          PageView.builder(
            controller: _pageController,
            itemCount: widget.items.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
              HapticFeedback.selectionClick();
            },
            itemBuilder: (context, index) {
              final item = widget.items[index];
              return ItemContent(
                item: item,
                accentColor: widget.accentColor,
                onPlaySound: _playSound,
              );
            },
          ),

          // Header with back, progress, favorite
          ItemDetailHeader(
            currentIndex: _currentIndex,
            totalCount: widget.items.length,
            isFavorite: _isFavorite(),
            onBackPressed: () => Navigator.of(context).pop(),
            onFavoritePressed: _toggleFavorite,
          ),

          // Page indicator dots
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45 - 24.h,
            left: 0,
            right: 0,
            child: PageIndicator(
              currentIndex: _currentIndex,
              totalCount: widget.items.length,
              accentColor: widget.accentColor,
            ),
          ),

          // Bottom action bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ItemBottomActionBar(
              currentIndex: _currentIndex,
              totalCount: widget.items.length,
              isLearned: _learnedItems.contains(_currentIndex),
              onPrevious: _goToPrevious,
              onNext: _goToNext,
              onMarkLearned: _markAsLearned,
            ),
          ),
        ],
      ),
    );
  }
}
