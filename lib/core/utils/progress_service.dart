import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Learning Progress Model
class LearningProgress {
  final String itemId;
  final String categoryId;
  final int viewCount;
  final int listenCount;
  final DateTime lastViewed;
  final bool isCompleted;

  LearningProgress({
    required this.itemId,
    required this.categoryId,
    this.viewCount = 0,
    this.listenCount = 0,
    DateTime? lastViewed,
    this.isCompleted = false,
  }) : lastViewed = lastViewed ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'itemId': itemId,
    'categoryId': categoryId,
    'viewCount': viewCount,
    'listenCount': listenCount,
    'lastViewed': lastViewed.toIso8601String(),
    'isCompleted': isCompleted,
  };

  factory LearningProgress.fromJson(Map<String, dynamic> json) => LearningProgress(
    itemId: json['itemId'] ?? '',
    categoryId: json['categoryId'] ?? '',
    viewCount: json['viewCount'] ?? 0,
    listenCount: json['listenCount'] ?? 0,
    lastViewed: json['lastViewed'] != null 
        ? DateTime.parse(json['lastViewed']) 
        : DateTime.now(),
    isCompleted: json['isCompleted'] ?? false,
  );

  LearningProgress copyWith({
    int? viewCount,
    int? listenCount,
    DateTime? lastViewed,
    bool? isCompleted,
  }) => LearningProgress(
    itemId: itemId,
    categoryId: categoryId,
    viewCount: viewCount ?? this.viewCount,
    listenCount: listenCount ?? this.listenCount,
    lastViewed: lastViewed ?? this.lastViewed,
    isCompleted: isCompleted ?? this.isCompleted,
  );
}

/// Daily Statistics Model
class DailyStats {
  final DateTime date;
  final int itemsLearned;
  final int timeSpentMinutes;
  final int audioPlays;

  DailyStats({
    required this.date,
    this.itemsLearned = 0,
    this.timeSpentMinutes = 0,
    this.audioPlays = 0,
  });

  Map<String, dynamic> toJson() => {
    'date': date.toIso8601String(),
    'itemsLearned': itemsLearned,
    'timeSpentMinutes': timeSpentMinutes,
    'audioPlays': audioPlays,
  };

  factory DailyStats.fromJson(Map<String, dynamic> json) => DailyStats(
    date: DateTime.parse(json['date']),
    itemsLearned: json['itemsLearned'] ?? 0,
    timeSpentMinutes: json['timeSpentMinutes'] ?? 0,
    audioPlays: json['audioPlays'] ?? 0,
  );
}

/// Progress Service - Manages learning progress with persistence
class ProgressService extends ChangeNotifier {
  static final ProgressService _instance = ProgressService._internal();
  factory ProgressService() => _instance;
  ProgressService._internal();

  static const String _progressKey = 'learning_progress';
  static const String _statsKey = 'daily_stats';
  static const String _streakKey = 'streak_data';
  static const String _gameStatsKey = 'game_stats';
  
  Map<String, LearningProgress> _progress = {};
  List<DailyStats> _dailyStats = [];
  int _currentStreak = 0;
  DateTime? _lastActiveDate;
  bool _isInitialized = false;
  
  // Game statistics
  int _gamesPlayed = 0;
  int _gamesWon = 0;
  int _totalGamePoints = 0;
  int _todayGamePoints = 0;
  int _gameStreak = 0;
  DateTime? _lastGameDate;

  /// Get all progress
  Map<String, LearningProgress> get progress => Map.unmodifiable(_progress);

  /// Get current streak
  int get currentStreak => _currentStreak;

  /// Get total items learned
  int get totalItemsLearned => _progress.values.where((p) => p.isCompleted).length;
  
  /// Get items learned today
  int get todayLearned {
    final today = DateTime.now();
    final todayStart = DateTime(today.year, today.month, today.day);
    return _progress.values.where((p) {
      if (!p.isCompleted) return false;
      final viewedDate = DateTime(
        p.lastViewed.year, 
        p.lastViewed.month, 
        p.lastViewed.day
      );
      return viewedDate == todayStart;
    }).length;
  }

  /// Get total categories with progress
  Set<String> get categoriesWithProgress => 
      _progress.values.map((p) => p.categoryId).toSet();

  /// Check if initialized
  bool get isInitialized => _isInitialized;
  
  // Game getters
  int get gamesPlayed => _gamesPlayed;
  int get gamesWon => _gamesWon;
  int get totalGamePoints => _totalGamePoints;
  int get todayGamePoints => _todayGamePoints;
  int get gameStreak => _gameStreak;

  /// Initialize and load progress from storage
  Future<void> init() async {
    if (_isInitialized) return;
    
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // Load progress
      final progressJson = prefs.getString(_progressKey);
      if (progressJson != null && progressJson.isNotEmpty) {
        final Map<String, dynamic> progressMap = json.decode(progressJson);
        _progress = progressMap.map((key, value) => 
            MapEntry(key, LearningProgress.fromJson(value as Map<String, dynamic>)));
      }
      
      // Load daily stats
      final statsJson = prefs.getString(_statsKey);
      if (statsJson != null && statsJson.isNotEmpty) {
        final List<dynamic> statsList = json.decode(statsJson);
        _dailyStats = statsList
            .map((item) => DailyStats.fromJson(item as Map<String, dynamic>))
            .toList();
      }
      
      // Load streak
      final streakJson = prefs.getString(_streakKey);
      if (streakJson != null && streakJson.isNotEmpty) {
        final Map<String, dynamic> streakData = json.decode(streakJson);
        _currentStreak = streakData['streak'] ?? 0;
        _lastActiveDate = streakData['lastActive'] != null 
            ? DateTime.parse(streakData['lastActive']) 
            : null;
      }
      
      // Load game stats
      final gameStatsJson = prefs.getString(_gameStatsKey);
      if (gameStatsJson != null && gameStatsJson.isNotEmpty) {
        final Map<String, dynamic> gameData = json.decode(gameStatsJson);
        _gamesPlayed = gameData['gamesPlayed'] ?? 0;
        _gamesWon = gameData['gamesWon'] ?? 0;
        _totalGamePoints = gameData['totalGamePoints'] ?? 0;
        _gameStreak = gameData['gameStreak'] ?? 0;
        _lastGameDate = gameData['lastGameDate'] != null 
            ? DateTime.parse(gameData['lastGameDate']) 
            : null;
        
        // Check if today's points should be reset
        final today = DateTime.now();
        if (_lastGameDate != null) {
          final lastDate = DateTime(_lastGameDate!.year, _lastGameDate!.month, _lastGameDate!.day);
          final todayDate = DateTime(today.year, today.month, today.day);
          if (lastDate.isBefore(todayDate)) {
            _todayGamePoints = 0;
          } else {
            _todayGamePoints = gameData['todayGamePoints'] ?? 0;
          }
        }
      }
      
      // Check and update streak
      _updateStreak();
      
      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      debugPrint('ProgressService init error: $e');
      _isInitialized = true;
    }
  }

  /// Save progress to storage
  Future<void> _saveProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final progressJson = json.encode(
          _progress.map((key, value) => MapEntry(key, value.toJson())));
      await prefs.setString(_progressKey, progressJson);
    } catch (e) {
      debugPrint('ProgressService save error: $e');
    }
  }

  /// Save streak to storage
  Future<void> _saveStreak() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final streakJson = json.encode({
        'streak': _currentStreak,
        'lastActive': _lastActiveDate?.toIso8601String(),
      });
      await prefs.setString(_streakKey, streakJson);
    } catch (e) {
      debugPrint('ProgressService save streak error: $e');
    }
  }

  /// Update streak based on activity
  void _updateStreak() {
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);
    
    if (_lastActiveDate == null) {
      return;
    }
    
    final lastDate = DateTime(
        _lastActiveDate!.year, _lastActiveDate!.month, _lastActiveDate!.day);
    final difference = todayDate.difference(lastDate).inDays;
    
    if (difference > 1) {
      // Streak broken
      _currentStreak = 0;
    }
  }

  /// Record item view
  Future<void> recordItemView(String itemId, String categoryId) async {
    final key = '${categoryId}_$itemId';
    final existing = _progress[key];
    
    if (existing != null) {
      _progress[key] = existing.copyWith(
        viewCount: existing.viewCount + 1,
        lastViewed: DateTime.now(),
      );
    } else {
      _progress[key] = LearningProgress(
        itemId: itemId,
        categoryId: categoryId,
        viewCount: 1,
      );
    }
    
    await _recordDailyActivity();
    notifyListeners();
    await _saveProgress();
  }

  /// Record audio listen
  Future<void> recordAudioListen(String itemId, String categoryId) async {
    final key = '${categoryId}_$itemId';
    final existing = _progress[key];
    
    if (existing != null) {
      _progress[key] = existing.copyWith(
        listenCount: existing.listenCount + 1,
        lastViewed: DateTime.now(),
      );
    } else {
      _progress[key] = LearningProgress(
        itemId: itemId,
        categoryId: categoryId,
        listenCount: 1,
      );
    }
    
    notifyListeners();
    await _saveProgress();
  }

  /// Mark item as completed
  Future<void> markItemCompleted(String itemId, String categoryId) async {
    final key = '${categoryId}_$itemId';
    final existing = _progress[key];
    
    if (existing != null) {
      _progress[key] = existing.copyWith(isCompleted: true);
    } else {
      _progress[key] = LearningProgress(
        itemId: itemId,
        categoryId: categoryId,
        isCompleted: true,
      );
    }
    
    notifyListeners();
    await _saveProgress();
  }

  /// Record daily activity and update streak
  Future<void> _recordDailyActivity() async {
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);
    
    if (_lastActiveDate != null) {
      final lastDate = DateTime(
          _lastActiveDate!.year, _lastActiveDate!.month, _lastActiveDate!.day);
      final difference = todayDate.difference(lastDate).inDays;
      
      if (difference == 1) {
        // Consecutive day - increase streak
        _currentStreak++;
      } else if (difference > 1) {
        // Streak broken - start new
        _currentStreak = 1;
      }
      // Same day - no change to streak
    } else {
      // First activity ever
      _currentStreak = 1;
    }
    
    _lastActiveDate = today;
    await _saveStreak();
  }

  /// Get progress for a specific item
  LearningProgress? getItemProgress(String itemId, String categoryId) {
    return _progress['${categoryId}_$itemId'];
  }

  /// Get progress for a category
  List<LearningProgress> getCategoryProgress(String categoryId) {
    return _progress.values
        .where((p) => p.categoryId == categoryId)
        .toList();
  }

  /// Get category completion percentage
  double getCategoryCompletion(String categoryId, int totalItems) {
    if (totalItems == 0) return 0.0;
    final completed = _progress.values
        .where((p) => p.categoryId == categoryId && p.isCompleted)
        .length;
    return completed / totalItems;
  }

  /// Get weekly progress (last 7 days)
  List<double> getWeeklyProgress() {
    final today = DateTime.now();
    final weekProgress = <double>[];
    
    for (int i = 6; i >= 0; i--) {
      final date = today.subtract(Duration(days: i));
      final dayItems = _progress.values.where((p) {
        final pDate = p.lastViewed;
        return pDate.year == date.year && 
               pDate.month == date.month && 
               pDate.day == date.day;
      }).length;
      
      // Normalize to 0-1 (assuming max 10 items per day is "full")
      weekProgress.add((dayItems / 10).clamp(0.0, 1.0));
    }
    
    return weekProgress;
  }

  /// Clear all progress
  Future<void> clearAll() async {
    _progress.clear();
    _dailyStats.clear();
    _currentStreak = 0;
    _lastActiveDate = null;
    _gamesPlayed = 0;
    _gamesWon = 0;
    _totalGamePoints = 0;
    _todayGamePoints = 0;
    _gameStreak = 0;
    _lastGameDate = null;
    notifyListeners();
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_progressKey);
    await prefs.remove(_statsKey);
    await prefs.remove(_streakKey);
    await prefs.remove(_gameStatsKey);
  }
  
  // ============ GAME METHODS ============
  
  /// Record a game result
  Future<void> recordGameResult({
    required bool won,
    required int pointsEarned,
  }) async {
    _gamesPlayed++;
    if (won) _gamesWon++;
    _totalGamePoints += pointsEarned;
    _todayGamePoints += pointsEarned;
    
    // Update game streak
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);
    
    if (_lastGameDate != null) {
      final lastDate = DateTime(_lastGameDate!.year, _lastGameDate!.month, _lastGameDate!.day);
      final difference = todayDate.difference(lastDate).inDays;
      
      if (difference == 1 && won) {
        _gameStreak++;
      } else if (difference > 1) {
        _gameStreak = won ? 1 : 0;
      }
    } else if (won) {
      _gameStreak = 1;
    }
    
    _lastGameDate = today;
    await _saveGameStats();
    notifyListeners();
  }
  
  /// Save game stats to storage
  Future<void> _saveGameStats() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final gameStatsJson = json.encode({
        'gamesPlayed': _gamesPlayed,
        'gamesWon': _gamesWon,
        'totalGamePoints': _totalGamePoints,
        'todayGamePoints': _todayGamePoints,
        'gameStreak': _gameStreak,
        'lastGameDate': _lastGameDate?.toIso8601String(),
      });
      await prefs.setString(_gameStatsKey, gameStatsJson);
    } catch (e) {
      debugPrint('ProgressService save game stats error: $e');
    }
  }
}
