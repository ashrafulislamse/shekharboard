import 'learning_item.dart';

/// Learning Content Data
/// Contains all learning items and categories for the app
class LearningContent {
  
  /// All Categories
  static const List<LearningCategory> categories = [
    LearningCategory(
      id: 'animals',
      nameBn: 'পশু-পাখি',
      nameEn: 'Animals',
      icon: '🐾',
      color: '#7FBA96',
    ),
    LearningCategory(
      id: 'fruits',
      nameBn: 'ফলমূল',
      nameEn: 'Fruits',
      icon: '🍎',
      color: '#FFD54F',
    ),
    LearningCategory(
      id: 'vegetables',
      nameBn: 'সবজি',
      nameEn: 'Vegetables',
      icon: '🥕',
      color: '#81C784',
    ),
    LearningCategory(
      id: 'numbers',
      nameBn: 'সংখ্যা',
      nameEn: 'Numbers',
      icon: '🔢',
      color: '#64B5F6',
    ),
    LearningCategory(
      id: 'colors',
      nameBn: 'রং',
      nameEn: 'Colors',
      icon: '🎨',
      color: '#BA68C8',
    ),
    LearningCategory(
      id: 'shapes',
      nameBn: 'আকৃতি',
      nameEn: 'Shapes',
      icon: '⬛',
      color: '#4DB6AC',
    ),
    LearningCategory(
      id: 'letters_bn',
      nameBn: 'বর্ণমালা',
      nameEn: 'Bengali Letters',
      icon: 'অ',
      color: '#FF8A65',
    ),
    LearningCategory(
      id: 'letters_en',
      nameBn: 'ABC',
      nameEn: 'English ABC',
      icon: 'A',
      color: '#7986CB',
    ),
    LearningCategory(
      id: 'body',
      nameBn: 'শরীরের অংশ',
      nameEn: 'Body Parts',
      icon: '👋',
      color: '#F48FB1',
    ),
    LearningCategory(
      id: 'family',
      nameBn: 'পরিবার',
      nameEn: 'Family',
      icon: '👨‍👩‍👧',
      color: '#90CAF9',
    ),
    LearningCategory(
      id: 'vehicles',
      nameBn: 'যানবাহন',
      nameEn: 'Vehicles',
      icon: '🚗',
      color: '#A5D6A7',
    ),
    LearningCategory(
      id: 'food',
      nameBn: 'খাবার',
      nameEn: 'Food',
      icon: '🍚',
      color: '#FFCC80',
    ),
  ];
  
  /// Animals - পশু-পাখি
  static const List<LearningItem> animals = [
    LearningItem(
      id: 'cow',
      nameBn: 'গরু',
      nameEn: 'Cow',
      imagePath: 'animals/cow.png',
      audioBn: 'goru',
      category: 'animals',
    ),
    LearningItem(
      id: 'goat',
      nameBn: 'ছাগল',
      nameEn: 'Goat',
      imagePath: 'animals/goat.png',
      audioBn: 'chagol',
      category: 'animals',
    ),
    LearningItem(
      id: 'cat',
      nameBn: 'বিড়াল',
      nameEn: 'Cat',
      imagePath: 'animals/cat.png',
      audioBn: 'biral',
      category: 'animals',
    ),
    LearningItem(
      id: 'dog',
      nameBn: 'কুকুর',
      nameEn: 'Dog',
      imagePath: 'animals/dog.png',
      audioBn: 'kukur',
      category: 'animals',
    ),
    LearningItem(
      id: 'hen',
      nameBn: 'মুরগি',
      nameEn: 'Hen',
      imagePath: 'animals/hen.png',
      audioBn: 'murgi',
      category: 'animals',
    ),
    LearningItem(
      id: 'duck',
      nameBn: 'হাঁস',
      nameEn: 'Duck',
      imagePath: 'animals/duck.png',
      audioBn: 'hash',
      category: 'animals',
    ),
    LearningItem(
      id: 'crow',
      nameBn: 'কাক',
      nameEn: 'Crow',
      imagePath: 'animals/crow.png',
      audioBn: 'kak',
      category: 'animals',
    ),
    LearningItem(
      id: 'elephant',
      nameBn: 'হাতি',
      nameEn: 'Elephant',
      imagePath: 'animals/elephant.png',
      audioBn: 'hati',
      category: 'animals',
    ),
    LearningItem(
      id: 'horse',
      nameBn: 'ঘোড়া',
      nameEn: 'Horse',
      imagePath: 'animals/horse.png',
      audioBn: 'ghora',
      category: 'animals',
    ),
    LearningItem(
      id: 'tiger',
      nameBn: 'বাঘ',
      nameEn: 'Tiger',
      imagePath: 'animals/tiger.png',
      audioBn: 'bagh',
      category: 'animals',
    ),
    LearningItem(
      id: 'lion',
      nameBn: 'সিংহ',
      nameEn: 'Lion',
      imagePath: 'animals/lion.png',
      audioBn: 'singho',
      category: 'animals',
    ),
    LearningItem(
      id: 'fish',
      nameBn: 'মাছ',
      nameEn: 'Fish',
      imagePath: 'animals/fish.png',
      audioBn: 'mach',
      category: 'animals',
    ),
  ];

  /// Fruits - ফলমূল
  static const List<LearningItem> fruits = [
    LearningItem(
      id: 'mango',
      nameBn: 'আম',
      nameEn: 'Mango',
      imagePath: 'fruits/mango.png',
      audioBn: 'aam',
      category: 'fruits',
    ),
    LearningItem(
      id: 'banana',
      nameBn: 'কলা',
      nameEn: 'Banana',
      imagePath: 'fruits/banana.png',
      audioBn: 'kola',
      category: 'fruits',
    ),
    LearningItem(
      id: 'apple',
      nameBn: 'আপেল',
      nameEn: 'Apple',
      imagePath: 'fruits/apple.png',
      audioBn: 'apple',
      category: 'fruits',
    ),
    LearningItem(
      id: 'orange',
      nameBn: 'কমলা',
      nameEn: 'Orange',
      imagePath: 'fruits/orange.png',
      audioBn: 'komla',
      category: 'fruits',
    ),
    LearningItem(
      id: 'jackfruit',
      nameBn: 'কাঁঠাল',
      nameEn: 'Jackfruit',
      imagePath: 'fruits/jackfruit.png',
      audioBn: 'kathal',
      category: 'fruits',
    ),
    LearningItem(
      id: 'watermelon',
      nameBn: 'তরমুজ',
      nameEn: 'Watermelon',
      imagePath: 'fruits/watermelon.png',
      audioBn: 'tormuj',
      category: 'fruits',
    ),
    LearningItem(
      id: 'coconut',
      nameBn: 'নারকেল',
      nameEn: 'Coconut',
      imagePath: 'fruits/coconut.png',
      audioBn: 'narkel',
      category: 'fruits',
    ),
    LearningItem(
      id: 'grape',
      nameBn: 'আঙুর',
      nameEn: 'Grape',
      imagePath: 'fruits/grape.png',
      audioBn: 'angur',
      category: 'fruits',
    ),
    LearningItem(
      id: 'guava',
      nameBn: 'পেয়ারা',
      nameEn: 'Guava',
      imagePath: 'fruits/guava.png',
      audioBn: 'peyara',
      category: 'fruits',
    ),
    LearningItem(
      id: 'papaya',
      nameBn: 'পেঁপে',
      nameEn: 'Papaya',
      imagePath: 'fruits/papaya.png',
      audioBn: 'penpe',
      category: 'fruits',
    ),
    LearningItem(
      id: 'lichi',
      nameBn: 'লিচু',
      nameEn: 'Lychee',
      imagePath: 'fruits/lichi.png',
      audioBn: 'lichu',
      category: 'fruits',
    ),
    LearningItem(
      id: 'pomegranate',
      nameBn: 'ডালিম',
      nameEn: 'Pomegranate',
      imagePath: 'fruits/pomegranate.png',
      audioBn: 'dalim',
      category: 'fruits',
    ),
  ];

  /// Numbers - সংখ্যা (Bengali numerals)
  static const List<LearningItem> numbers = [
    LearningItem(
      id: 'num_1',
      nameBn: '১ - এক',
      nameEn: '1 - One',
      imagePath: 'numbers/1.png',
      audioBn: 'ek',
      category: 'numbers',
    ),
    LearningItem(
      id: 'num_2',
      nameBn: '২ - দুই',
      nameEn: '2 - Two',
      imagePath: 'numbers/2.png',
      audioBn: 'dui',
      category: 'numbers',
    ),
    LearningItem(
      id: 'num_3',
      nameBn: '৩ - তিন',
      nameEn: '3 - Three',
      imagePath: 'numbers/3.png',
      audioBn: 'tin',
      category: 'numbers',
    ),
    LearningItem(
      id: 'num_4',
      nameBn: '৪ - চার',
      nameEn: '4 - Four',
      imagePath: 'numbers/4.png',
      audioBn: 'char',
      category: 'numbers',
    ),
    LearningItem(
      id: 'num_5',
      nameBn: '৫ - পাঁচ',
      nameEn: '5 - Five',
      imagePath: 'numbers/5.png',
      audioBn: 'pach',
      category: 'numbers',
    ),
    LearningItem(
      id: 'num_6',
      nameBn: '৬ - ছয়',
      nameEn: '6 - Six',
      imagePath: 'numbers/6.png',
      audioBn: 'choy',
      category: 'numbers',
    ),
    LearningItem(
      id: 'num_7',
      nameBn: '৭ - সাত',
      nameEn: '7 - Seven',
      imagePath: 'numbers/7.png',
      audioBn: 'sat',
      category: 'numbers',
    ),
    LearningItem(
      id: 'num_8',
      nameBn: '৮ - আট',
      nameEn: '8 - Eight',
      imagePath: 'numbers/8.png',
      audioBn: 'at',
      category: 'numbers',
    ),
    LearningItem(
      id: 'num_9',
      nameBn: '৯ - নয়',
      nameEn: '9 - Nine',
      imagePath: 'numbers/9.png',
      audioBn: 'noy',
      category: 'numbers',
    ),
    LearningItem(
      id: 'num_10',
      nameBn: '১০ - দশ',
      nameEn: '10 - Ten',
      imagePath: 'numbers/10.png',
      audioBn: 'dosh',
      category: 'numbers',
    ),
  ];

  /// Colors - রং
  static const List<LearningItem> colors = [
    LearningItem(
      id: 'red',
      nameBn: 'লাল',
      nameEn: 'Red',
      imagePath: 'colors/red.png',
      audioBn: 'lal',
      category: 'colors',
    ),
    LearningItem(
      id: 'blue',
      nameBn: 'নীল',
      nameEn: 'Blue',
      imagePath: 'colors/blue.png',
      audioBn: 'nil',
      category: 'colors',
    ),
    LearningItem(
      id: 'green',
      nameBn: 'সবুজ',
      nameEn: 'Green',
      imagePath: 'colors/green.png',
      audioBn: 'sobuj',
      category: 'colors',
    ),
    LearningItem(
      id: 'yellow',
      nameBn: 'হলুদ',
      nameEn: 'Yellow',
      imagePath: 'colors/yellow.png',
      audioBn: 'holud',
      category: 'colors',
    ),
    LearningItem(
      id: 'white',
      nameBn: 'সাদা',
      nameEn: 'White',
      imagePath: 'colors/white.png',
      audioBn: 'sada',
      category: 'colors',
    ),
    LearningItem(
      id: 'black',
      nameBn: 'কালো',
      nameEn: 'Black',
      imagePath: 'colors/black.png',
      audioBn: 'kalo',
      category: 'colors',
    ),
    LearningItem(
      id: 'orange_color',
      nameBn: 'কমলা রং',
      nameEn: 'Orange',
      imagePath: 'colors/orange.png',
      audioBn: 'komla_rong',
      category: 'colors',
    ),
    LearningItem(
      id: 'pink',
      nameBn: 'গোলাপি',
      nameEn: 'Pink',
      imagePath: 'colors/pink.png',
      audioBn: 'golapi',
      category: 'colors',
    ),
    LearningItem(
      id: 'purple',
      nameBn: 'বেগুনি',
      nameEn: 'Purple',
      imagePath: 'colors/purple.png',
      audioBn: 'beguni',
      category: 'colors',
    ),
    LearningItem(
      id: 'brown',
      nameBn: 'বাদামি',
      nameEn: 'Brown',
      imagePath: 'colors/brown.png',
      audioBn: 'badami',
      category: 'colors',
    ),
  ];

  /// Body Parts - শরীরের অংশ
  static const List<LearningItem> bodyParts = [
    LearningItem(
      id: 'head',
      nameBn: 'মাথা',
      nameEn: 'Head',
      imagePath: 'body/head.png',
      audioBn: 'matha',
      category: 'body',
    ),
    LearningItem(
      id: 'eye',
      nameBn: 'চোখ',
      nameEn: 'Eye',
      imagePath: 'body/eye.png',
      audioBn: 'chokh',
      category: 'body',
    ),
    LearningItem(
      id: 'nose',
      nameBn: 'নাক',
      nameEn: 'Nose',
      imagePath: 'body/nose.png',
      audioBn: 'nak',
      category: 'body',
    ),
    LearningItem(
      id: 'ear',
      nameBn: 'কান',
      nameEn: 'Ear',
      imagePath: 'body/ear.png',
      audioBn: 'kan',
      category: 'body',
    ),
    LearningItem(
      id: 'mouth',
      nameBn: 'মুখ',
      nameEn: 'Mouth',
      imagePath: 'body/mouth.png',
      audioBn: 'mukh',
      category: 'body',
    ),
    LearningItem(
      id: 'hand',
      nameBn: 'হাত',
      nameEn: 'Hand',
      imagePath: 'body/hand.png',
      audioBn: 'hat',
      category: 'body',
    ),
    LearningItem(
      id: 'leg',
      nameBn: 'পা',
      nameEn: 'Leg',
      imagePath: 'body/leg.png',
      audioBn: 'pa',
      category: 'body',
    ),
    LearningItem(
      id: 'finger',
      nameBn: 'আঙুল',
      nameEn: 'Finger',
      imagePath: 'body/finger.png',
      audioBn: 'angul',
      category: 'body',
    ),
  ];
  
  /// Vehicles - যানবাহন
  static const List<LearningItem> vehicles = [
    LearningItem(
      id: 'rickshaw',
      nameBn: 'রিকশা',
      nameEn: 'Rickshaw',
      imagePath: 'vehicles/rickshaw.png',
      audioBn: 'riksha',
      category: 'vehicles',
    ),
    LearningItem(
      id: 'boat',
      nameBn: 'নৌকা',
      nameEn: 'Boat',
      imagePath: 'vehicles/boat.png',
      audioBn: 'nouka',
      category: 'vehicles',
    ),
    LearningItem(
      id: 'car',
      nameBn: 'গাড়ি',
      nameEn: 'Car',
      imagePath: 'vehicles/car.png',
      audioBn: 'gari',
      category: 'vehicles',
    ),
    LearningItem(
      id: 'bus',
      nameBn: 'বাস',
      nameEn: 'Bus',
      imagePath: 'vehicles/bus.png',
      audioBn: 'bas',
      category: 'vehicles',
    ),
    LearningItem(
      id: 'train',
      nameBn: 'ট্রেন',
      nameEn: 'Train',
      imagePath: 'vehicles/train.png',
      audioBn: 'tren',
      category: 'vehicles',
    ),
    LearningItem(
      id: 'bicycle',
      nameBn: 'সাইকেল',
      nameEn: 'Bicycle',
      imagePath: 'vehicles/bicycle.png',
      audioBn: 'cycle',
      category: 'vehicles',
    ),
    LearningItem(
      id: 'airplane',
      nameBn: 'বিমান',
      nameEn: 'Airplane',
      imagePath: 'vehicles/airplane.png',
      audioBn: 'biman',
      category: 'vehicles',
    ),
    LearningItem(
      id: 'motorcycle',
      nameBn: 'মোটরসাইকেল',
      nameEn: 'Motorcycle',
      imagePath: 'vehicles/motorcycle.png',
      audioBn: 'motorcycle',
      category: 'vehicles',
    ),
  ];

  /// Get all items for a category
  static List<LearningItem> getItemsByCategory(String categoryId) {
    switch (categoryId) {
      case 'animals':
        return animals;
      case 'fruits':
        return fruits;
      case 'numbers':
        return numbers;
      case 'colors':
        return colors;
      case 'body':
        return bodyParts;
      case 'vehicles':
        return vehicles;
      default:
        return [];
    }
  }
  
  /// Get category by ID
  static LearningCategory? getCategoryById(String id) {
    try {
      return categories.firstWhere((cat) => cat.id == id);
    } catch (_) {
      return null;
    }
  }
}
