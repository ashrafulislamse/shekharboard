import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Favorite Item Model
class FavoriteItem {
  final String id;
  final String nameBn;
  final String nameEn;
  final String emoji;
  final String categoryBn;
  final String categoryId;
  final String audioBn;
  final DateTime addedAt;

  FavoriteItem({
    required this.id,
    required this.nameBn,
    required this.nameEn,
    required this.emoji,
    required this.categoryBn,
    required this.categoryId,
    required this.audioBn,
    DateTime? addedAt,
  }) : addedAt = addedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'id': id,
    'nameBn': nameBn,
    'nameEn': nameEn,
    'emoji': emoji,
    'categoryBn': categoryBn,
    'categoryId': categoryId,
    'audioBn': audioBn,
    'addedAt': addedAt.toIso8601String(),
  };

  factory FavoriteItem.fromJson(Map<String, dynamic> json) => FavoriteItem(
    id: json['id'] ?? '',
    nameBn: json['nameBn'] ?? '',
    nameEn: json['nameEn'] ?? '',
    emoji: json['emoji'] ?? '❓',
    categoryBn: json['categoryBn'] ?? '',
    categoryId: json['categoryId'] ?? '',
    audioBn: json['audioBn'] ?? '',
    addedAt: json['addedAt'] != null 
        ? DateTime.parse(json['addedAt']) 
        : DateTime.now(),
  );
}

/// Favorites Service - Manages favorite items with persistence
class FavoritesService extends ChangeNotifier {
  static final FavoritesService _instance = FavoritesService._internal();
  factory FavoritesService() => _instance;
  FavoritesService._internal();

  static const String _storageKey = 'favorites_list';
  
  List<FavoriteItem> _favorites = [];
  bool _isInitialized = false;

  /// Get all favorites
  List<FavoriteItem> get favorites => List.unmodifiable(_favorites);

  /// Get favorites count
  int get count => _favorites.length;

  /// Check if initialized
  bool get isInitialized => _isInitialized;

  /// Initialize and load favorites from storage
  Future<void> init() async {
    if (_isInitialized) return;
    
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_storageKey);
      
      if (jsonString != null && jsonString.isNotEmpty) {
        final List<dynamic> jsonList = json.decode(jsonString);
        _favorites = jsonList
            .map((item) => FavoriteItem.fromJson(item as Map<String, dynamic>))
            .toList();
      }
      
      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      debugPrint('FavoritesService init error: $e');
      _isInitialized = true;
    }
  }

  /// Save favorites to storage
  Future<void> _save() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = json.encode(_favorites.map((f) => f.toJson()).toList());
      await prefs.setString(_storageKey, jsonString);
    } catch (e) {
      debugPrint('FavoritesService save error: $e');
    }
  }

  /// Check if item is favorited
  bool isFavorite(String itemId) {
    return _favorites.any((f) => f.id == itemId);
  }

  /// Add item to favorites
  Future<void> addFavorite(FavoriteItem item) async {
    if (!isFavorite(item.id)) {
      _favorites.insert(0, item); // Add to beginning
      notifyListeners();
      await _save();
    }
  }

  /// Remove item from favorites
  Future<void> removeFavorite(String itemId) async {
    _favorites.removeWhere((f) => f.id == itemId);
    notifyListeners();
    await _save();
  }

  /// Toggle favorite status
  Future<bool> toggleFavorite(FavoriteItem item) async {
    if (isFavorite(item.id)) {
      await removeFavorite(item.id);
      return false;
    } else {
      await addFavorite(item);
      return true;
    }
  }

  /// Get favorites by category
  List<FavoriteItem> getFavoritesByCategory(String categoryId) {
    if (categoryId == 'all' || categoryId.isEmpty) return _favorites;
    return _favorites.where((f) => f.categoryId == categoryId).toList();
  }

  /// Get category counts
  Map<String, int> getCategoryCounts() {
    final counts = <String, int>{};
    for (final fav in _favorites) {
      counts[fav.categoryId] = (counts[fav.categoryId] ?? 0) + 1;
    }
    return counts;
  }

  /// Clear all favorites
  Future<void> clearAll() async {
    _favorites.clear();
    notifyListeners();
    await _save();
  }
}
