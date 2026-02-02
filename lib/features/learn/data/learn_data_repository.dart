import 'dart:ui';

import '../presentation/models/category_item.dart';

/// Centralized data repository for all learning content
/// Audio files are in assets/audio/{voice}/category/{id}_word.mp3
class LearnDataRepository {
  static const LearnDataRepository _instance = LearnDataRepository._internal();
  factory LearnDataRepository() => _instance;
  const LearnDataRepository._internal();

  // ============ ANIMALS (28 items) ============
  static const List<CategoryItem> animals = [
    CategoryItem(id: 'goru', nameBn: 'গরু', nameEn: 'Cow', emoji: '🐄'),
    CategoryItem(id: 'biral', nameBn: 'বিড়াল', nameEn: 'Cat', emoji: '🐱'),
    CategoryItem(id: 'kukur', nameBn: 'কুকুর', nameEn: 'Dog', emoji: '🐕'),
    CategoryItem(id: 'chhagol', nameBn: 'ছাগল', nameEn: 'Goat', emoji: '🐐'),
    CategoryItem(id: 'hati', nameBn: 'হাতি', nameEn: 'Elephant', emoji: '🐘'),
    CategoryItem(id: 'bagh', nameBn: 'বাঘ', nameEn: 'Tiger', emoji: '🐅'),
    CategoryItem(id: 'singho', nameBn: 'সিংহ', nameEn: 'Lion', emoji: '🦁'),
    CategoryItem(id: 'banor', nameBn: 'বানর', nameEn: 'Monkey', emoji: '🐒'),
    CategoryItem(id: 'ghora', nameBn: 'ঘোড়া', nameEn: 'Horse', emoji: '🐴'),
    CategoryItem(id: 'pakhi', nameBn: 'পাখি', nameEn: 'Bird', emoji: '🐦'),
    CategoryItem(id: 'machh', nameBn: 'মাছ', nameEn: 'Fish', emoji: '🐟'),
    CategoryItem(id: 'hash', nameBn: 'হাঁস', nameEn: 'Duck', emoji: '🦆'),
    CategoryItem(id: 'murgi', nameBn: 'মুরগি', nameEn: 'Chicken', emoji: '🐔'),
    CategoryItem(id: 'kak', nameBn: 'কাক', nameEn: 'Crow', emoji: '🐦‍⬛'),
    CategoryItem(id: 'bhaluk', nameBn: 'ভালুক', nameEn: 'Bear', emoji: '🐻'),
    CategoryItem(id: 'bhera', nameBn: 'ভেড়া', nameEn: 'Sheep', emoji: '🐑'),
    CategoryItem(id: 'byang', nameBn: 'ব্যাঙ', nameEn: 'Frog', emoji: '🐸'),
    CategoryItem(id: 'chorui', nameBn: 'চড়ুই', nameEn: 'Sparrow', emoji: '🐦'),
    CategoryItem(id: 'horin', nameBn: 'হরিণ', nameEn: 'Deer', emoji: '🦌'),
    CategoryItem(id: 'kankra', nameBn: 'কাঁকড়া', nameEn: 'Crab', emoji: '🦀'),
    CategoryItem(id: 'khorgosh', nameBn: 'খরগোশ', nameEn: 'Rabbit', emoji: '🐰'),
    CategoryItem(id: 'kobutor', nameBn: 'কবুতর', nameEn: 'Pigeon', emoji: '🕊️'),
    CategoryItem(id: 'kochchop', nameBn: 'কচ্ছপ', nameEn: 'Turtle', emoji: '🐢'),
    CategoryItem(id: 'kumir', nameBn: 'কুমির', nameEn: 'Crocodile', emoji: '🐊'),
    CategoryItem(id: 'moyna', nameBn: 'ময়না', nameEn: 'Myna', emoji: '🐦'),
    CategoryItem(id: 'projapoti', nameBn: 'প্রজাপতি', nameEn: 'Butterfly', emoji: '🦋'),
    CategoryItem(id: 'sheyal', nameBn: 'শেয়াল', nameEn: 'Fox', emoji: '🦊'),
    CategoryItem(id: 'tiya', nameBn: 'টিয়া', nameEn: 'Parrot', emoji: '🦜'),
  ];

  // ============ FRUITS (22 items) ============
  static const List<CategoryItem> fruits = [
    CategoryItem(id: 'am', nameBn: 'আম', nameEn: 'Mango', emoji: '🥭'),
    CategoryItem(id: 'kola', nameBn: 'কলা', nameEn: 'Banana', emoji: '🍌'),
    CategoryItem(id: 'apel', nameBn: 'আপেল', nameEn: 'Apple', emoji: '🍎'),
    CategoryItem(id: 'komla', nameBn: 'কমলা', nameEn: 'Orange', emoji: '🍊'),
    CategoryItem(id: 'angur', nameBn: 'আঙুর', nameEn: 'Grapes', emoji: '🍇'),
    CategoryItem(id: 'tormuj', nameBn: 'তরমুজ', nameEn: 'Watermelon', emoji: '🍉'),
    CategoryItem(id: 'anaros', nameBn: 'আনারস', nameEn: 'Pineapple', emoji: '🍍'),
    CategoryItem(id: 'narikel', nameBn: 'নারিকেল', nameEn: 'Coconut', emoji: '🥥'),
    CategoryItem(id: 'pepe', nameBn: 'পেঁপে', nameEn: 'Papaya', emoji: '🍈'),
    CategoryItem(id: 'peyara', nameBn: 'পেয়ারা', nameEn: 'Guava', emoji: '🍐'),
    CategoryItem(id: 'lichu', nameBn: 'লিচু', nameEn: 'Lychee', emoji: '🍒'),
    CategoryItem(id: 'kathal', nameBn: 'কাঁঠাল', nameEn: 'Jackfruit', emoji: '🍈'),
    CategoryItem(id: 'jam', nameBn: 'জাম', nameEn: 'Blackberry', emoji: '🫐'),
    CategoryItem(id: 'lebu', nameBn: 'লেবু', nameEn: 'Lemon', emoji: '🍋'),
    CategoryItem(id: 'dalim', nameBn: 'ডালিম', nameEn: 'Pomegranate', emoji: '🍎'),
    CategoryItem(id: 'khejur', nameBn: 'খেজুর', nameEn: 'Date', emoji: '🌴'),
    CategoryItem(id: 'amra', nameBn: 'আমড়া', nameEn: 'Hog Plum', emoji: '🍈'),
    CategoryItem(id: 'bel', nameBn: 'বেল', nameEn: 'Wood Apple', emoji: '🍈'),
    CategoryItem(id: 'jamrul', nameBn: 'জামরুল', nameEn: 'Rose Apple', emoji: '🍎'),
    CategoryItem(id: 'sofeda', nameBn: 'সফেদা', nameEn: 'Sapodilla', emoji: '🍈'),
    CategoryItem(id: 'nashpati', nameBn: 'নাশপাতি', nameEn: 'Pear', emoji: '🍐'),
    CategoryItem(id: 'strawberry', nameBn: 'স্ট্রবেরি', nameEn: 'Strawberry', emoji: '🍓'),
  ];

  // ============ VEHICLES (20 items) ============
  static const List<CategoryItem> vehicles = [
    CategoryItem(id: 'gari', nameBn: 'গাড়ি', nameEn: 'Car', emoji: '🚗'),
    CategoryItem(id: 'bus', nameBn: 'বাস', nameEn: 'Bus', emoji: '🚌'),
    CategoryItem(id: 'train', nameBn: 'ট্রেন', nameEn: 'Train', emoji: '🚂'),
    CategoryItem(id: 'nouka', nameBn: 'নৌকা', nameEn: 'Boat', emoji: '⛵'),
    CategoryItem(id: 'riksha', nameBn: 'রিকশা', nameEn: 'Rickshaw', emoji: '🛺'),
    CategoryItem(id: 'cycle', nameBn: 'সাইকেল', nameEn: 'Bicycle', emoji: '🚲'),
    CategoryItem(id: 'motorcycle', nameBn: 'মোটরসাইকেল', nameEn: 'Motorcycle', emoji: '🏍️'),
    CategoryItem(id: 'truck', nameBn: 'ট্রাক', nameEn: 'Truck', emoji: '🚛'),
    CategoryItem(id: 'taxi', nameBn: 'ট্যাক্সি', nameEn: 'Taxi', emoji: '🚕'),
    CategoryItem(id: 'ambulance', nameBn: 'অ্যাম্বুলেন্স', nameEn: 'Ambulance', emoji: '🚑'),
    CategoryItem(id: 'fire_truck', nameBn: 'দমকল', nameEn: 'Fire Truck', emoji: '🚒'),
    CategoryItem(id: 'helicopter', nameBn: 'হেলিকপ্টার', nameEn: 'Helicopter', emoji: '🚁'),
    CategoryItem(id: 'biman', nameBn: 'বিমান', nameEn: 'Airplane', emoji: '✈️'),
    CategoryItem(id: 'launch', nameBn: 'লঞ্চ', nameEn: 'Launch', emoji: '🚢'),
    CategoryItem(id: 'cng', nameBn: 'সিএনজি', nameEn: 'CNG Auto', emoji: '🛺'),
    CategoryItem(id: 'scooter', nameBn: 'স্কুটার', nameEn: 'Scooter', emoji: '🛵'),
    CategoryItem(id: 'tractor', nameBn: 'ট্রাক্টর', nameEn: 'Tractor', emoji: '🚜'),
    CategoryItem(id: 'gorur_gari', nameBn: 'গরুর গাড়ি', nameEn: 'Bullock Cart', emoji: '🐂'),
    CategoryItem(id: 'thela_gari', nameBn: 'ঠেলা গাড়ি', nameEn: 'Push Cart', emoji: '🛒'),
    CategoryItem(id: 'police_car', nameBn: 'পুলিশ গাড়ি', nameEn: 'Police Car', emoji: '🚓'),
  ];

  // ============ COLORS (9 items) ============
  static const List<CategoryItem> colors = [
    CategoryItem(id: 'lal', nameBn: 'লাল', nameEn: 'Red', emoji: '🔴'),
    CategoryItem(id: 'neel', nameBn: 'নীল', nameEn: 'Blue', emoji: '🔵'),
    CategoryItem(id: 'shobuj', nameBn: 'সবুজ', nameEn: 'Green', emoji: '🟢'),
    CategoryItem(id: 'holud', nameBn: 'হলুদ', nameEn: 'Yellow', emoji: '🟡'),
    CategoryItem(id: 'komla_rong', nameBn: 'কমলা', nameEn: 'Orange', emoji: '🟠'),
    CategoryItem(id: 'beguni', nameBn: 'বেগুনি', nameEn: 'Purple', emoji: '🟣'),
    CategoryItem(id: 'golapi', nameBn: 'গোলাপি', nameEn: 'Pink', emoji: '💗'),
    CategoryItem(id: 'shada', nameBn: 'সাদা', nameEn: 'White', emoji: '⚪'),
    CategoryItem(id: 'kalo', nameBn: 'কালো', nameEn: 'Black', emoji: '⚫'),
  ];

  // ============ NUMBERS (0-10, 11 items) ============
  static const List<CategoryItem> numbers = [
    CategoryItem(id: 'shunno', nameBn: '০ - শূন্য', nameEn: 'Zero', emoji: '0️⃣'),
    CategoryItem(id: 'ek', nameBn: '১ - এক', nameEn: 'One', emoji: '1️⃣'),
    CategoryItem(id: 'dui', nameBn: '২ - দুই', nameEn: 'Two', emoji: '2️⃣'),
    CategoryItem(id: 'tin', nameBn: '৩ - তিন', nameEn: 'Three', emoji: '3️⃣'),
    CategoryItem(id: 'char', nameBn: '৪ - চার', nameEn: 'Four', emoji: '4️⃣'),
    CategoryItem(id: 'pach', nameBn: '৫ - পাঁচ', nameEn: 'Five', emoji: '5️⃣'),
    CategoryItem(id: 'chhoy', nameBn: '৬ - ছয়', nameEn: 'Six', emoji: '6️⃣'),
    CategoryItem(id: 'shat', nameBn: '৭ - সাত', nameEn: 'Seven', emoji: '7️⃣'),
    CategoryItem(id: 'at', nameBn: '৮ - আট', nameEn: 'Eight', emoji: '8️⃣'),
    CategoryItem(id: 'noy', nameBn: '৯ - নয়', nameEn: 'Nine', emoji: '9️⃣'),
    CategoryItem(id: 'dosh', nameBn: '১০ - দশ', nameEn: 'Ten', emoji: '🔟'),
  ];

  // ============ BODY PARTS (for future) ============
  static const List<CategoryItem> bodyParts = [
    CategoryItem(id: 'haat', nameBn: 'হাত', nameEn: 'Hand', emoji: '🖐️'),
    CategoryItem(id: 'pa', nameBn: 'পা', nameEn: 'Leg', emoji: '🦵'),
    CategoryItem(id: 'chokh', nameBn: 'চোখ', nameEn: 'Eye', emoji: '👁️'),
    CategoryItem(id: 'kaan', nameBn: 'কান', nameEn: 'Ear', emoji: '👂'),
    CategoryItem(id: 'naak', nameBn: 'নাক', nameEn: 'Nose', emoji: '👃'),
    CategoryItem(id: 'mukh', nameBn: 'মুখ', nameEn: 'Mouth', emoji: '👄'),
    CategoryItem(id: 'matha', nameBn: 'মাথা', nameEn: 'Head', emoji: '🗣️'),
    CategoryItem(id: 'chul', nameBn: 'চুল', nameEn: 'Hair', emoji: '💇'),
  ];

  /// Get items by category folder name
  static List<CategoryItem> getItemsByCategory(String category) {
    switch (category) {
      case 'animals':
        return animals;
      case 'fruits':
        return fruits;
      case 'vehicles':
        return vehicles;
      case 'colors':
        return colors;
      case 'numbers':
        return numbers;
      case 'body':
        return bodyParts;
      default:
        return [];
    }
  }

  /// Get category folder name from Bengali title
  static String getCategoryFolder(String titleBn) {
    switch (titleBn) {
      case 'প্রাণী':
        return 'animals';
      case 'ফল':
        return 'fruits';
      case 'যানবাহন':
        return 'vehicles';
      case 'রঙ':
      case 'রং':
        return 'colors';
      case 'সংখ্যা':
        return 'numbers';
      case 'শরীর':
        return 'body';
      default:
        return 'animals';
    }
  }

  /// Get all categories info
  static List<CategoryInfo> get allCategories => [
    CategoryInfo(
      id: 'animals',
      titleBn: 'প্রাণী',
      titleEn: 'Animals',
      emoji: '🐾',
      color: const Color(0xFF4CAF50),
      items: animals,
    ),
    CategoryInfo(
      id: 'fruits',
      titleBn: 'ফল',
      titleEn: 'Fruits',
      emoji: '🍎',
      color: const Color(0xFFFFC107),
      items: fruits,
    ),
    CategoryInfo(
      id: 'vehicles',
      titleBn: 'যানবাহন',
      titleEn: 'Vehicles',
      emoji: '🚗',
      color: const Color(0xFF2196F3),
      items: vehicles,
    ),
    CategoryInfo(
      id: 'colors',
      titleBn: 'রঙ',
      titleEn: 'Colors',
      emoji: '🌈',
      color: const Color(0xFF9C27B0),
      items: colors,
    ),
    CategoryInfo(
      id: 'numbers',
      titleBn: 'সংখ্যা',
      titleEn: 'Numbers',
      emoji: '🔢',
      color: const Color(0xFFFF9800),
      items: numbers,
    ),
    CategoryInfo(
      id: 'body',
      titleBn: 'শরীর',
      titleEn: 'Body',
      emoji: '👋',
      color: const Color(0xFFE91E63),
      items: bodyParts,
    ),
  ];
}

/// Helper class for category metadata
class CategoryInfo {
  final String id;
  final String titleBn;
  final String titleEn;
  final String emoji;
  final Color color;
  final List<CategoryItem> items;

  const CategoryInfo({
    required this.id,
    required this.titleBn,
    required this.titleEn,
    required this.emoji,
    required this.color,
    required this.items,
  });

  String get countBn => '${_toBengaliNumber(items.length)}টি';
}

/// Convert number to Bengali numeral
String _toBengaliNumber(int number) {
  const bengaliDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
  return number.toString().split('').map((d) => bengaliDigits[int.parse(d)]).join('');
}
