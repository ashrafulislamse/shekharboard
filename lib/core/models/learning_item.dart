/// Learning Item Model
/// Represents a single learning item with bilingual support
class LearningItem {
  final String id;
  final String nameBn;      // Bengali name (primary)
  final String nameEn;      // English name (secondary)
  final String imagePath;   // Asset path for image
  final String audioBn;     // Bengali audio file name
  final String audioEn;     // English audio file name (optional)
  final String category;    // Category ID
  
  const LearningItem({
    required this.id,
    required this.nameBn,
    required this.nameEn,
    required this.imagePath,
    required this.audioBn,
    this.audioEn = '',
    required this.category,
  });
  
  /// Get audio path based on voice preference
  String getAudioPath(String voiceType) {
    switch (voiceType) {
      case 'female':
        return 'assets/audio/bn-female/$audioBn.mp3';
      case 'anime':
        return 'assets/audio/bn-anime/$audioBn.mp3';
      default:
        return 'assets/audio/bn/$audioBn.mp3';
    }
  }
  
  /// Get English audio path (for future use)
  String get englishAudioPath => 'assets/audio/en/$audioEn.mp3';
  
  /// Full image asset path
  String get imageAssetPath => 'assets/images/$imagePath';
}

/// Category Model
/// Represents a learning category
class LearningCategory {
  final String id;
  final String nameBn;
  final String nameEn;
  final String icon;
  final String color;
  
  const LearningCategory({
    required this.id,
    required this.nameBn,
    required this.nameEn,
    required this.icon,
    required this.color,
  });
}
