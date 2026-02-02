/// Data model for category items used in Category Grid and Item Detail pages
class CategoryItem {
  final String id;
  final String nameBn;
  final String nameEn;
  final String emoji;
  final String? imageUrl;
  final bool isCompleted;

  const CategoryItem({
    required this.id,
    required this.nameBn,
    required this.nameEn,
    required this.emoji,
    this.imageUrl,
    this.isCompleted = false,
  });
}
