<div align="center">

# 📚 শেখার বোর্ড (Shekhar Board)

### Interactive Bengali Learning App for Toddlers

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-green)](/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

<img src="assets/images/app_logo.png" alt="শেখার বোর্ড Logo" width="140"/>

**🇧🇩 বাংলাদেশী শিশুদের জন্য শিক্ষামূলক অ্যাপ**

*An educational app designed to help Bangladeshi toddlers (ages 1-5) learn Bengali words through interactive flashcards, native pronunciation, and engaging games.*

[Features](#-features) • [Screenshots](#-screenshots) • [Installation](#-installation) • [Architecture](#-architecture) • [Roadmap](#-roadmap) • [Contributing](#-contributing)

---

</div>

## 🌟 Why Shekhar Board?

Most educational apps for young children are designed for Western audiences. **Shekhar Board** is built specifically for **Bangladeshi children** with:

- 🎯 **Culturally relevant content** - Bengali animals (রয়েল বেঙ্গল টাইগার), local fruits (কাঁঠাল), familiar vehicles (রিকশা, সিএনজি)
- 🗣️ **Native Bengali pronunciation** - Professional voice recordings with proper accents
- 🎨 **Research-based design** - Colors and UX optimized for ages 1-5
- 📵 **Privacy-first** - 100% offline, no ads, no tracking, no data collection

---

## ✨ Features

### 📖 Learning Categories

| Category | Items | Description |
|----------|-------|-------------|
| 🦁 **প্রাণী (Animals)** | 28 | Bangladeshi wildlife with sounds & fun facts |
| 🍎 **ফল (Fruits)** | 22 | Local fruits with colors & descriptions |
| 🚗 **যানবাহন (Vehicles)** | 20 | Rickshaw, CNG, boat & more |
| 🔢 **সংখ্যা (Numbers)** | 0-10 | Bengali numerals with counting |
| 🎨 **রং (Colors)** | 9 | Colors with real-world examples |

### 🎮 Educational Games

| Game | Bengali | Description |
|------|---------|-------------|
| Shadow Match | ছায়া মেলাও | Match objects to their shadows |
| Sound Match | শব্দ চিনো | Identify objects by sound |
| Find Object | খুঁজে বের কর | Find items in a scene |
| Counting | গণনা শেখো | Learn to count objects |
| Color Match | রঙ চিনো | Match colors to objects |

### 👨‍👩‍👧 Parental Features

- 🔢 **Math Gate** - Age-appropriate math questions prevent accidental exits
- ⏱️ **Session Timer** - Configurable screen time limits (15-60 min)
- 📊 **Progress Tracking** - Weekly learning reports & statistics
- 🎛️ **Content Control** - Enable/disable specific categories

### 🛡️ Child Safety Promise

| Feature | Status |
|---------|--------|
| 100% Offline | ✅ No internet required |
| No Advertisements | ✅ Zero ads, ever |
| No User Tracking | ✅ Privacy-first design |
| No In-App Purchases | ✅ Full access included |
| No Social Features | ✅ No chat or sharing |
| Non-Addictive Design | ✅ No streaks, no pressure |

---

## 📱 Screenshots

<div align="center">

| Home | Learn | Play | Profile |
|:----:|:-----:|:----:|:-------:|
| <img src="docs/wireframes/phase1/home.png" width="180"/> | <img src="docs/wireframes/phase1/learn.png" width="180"/> | <img src="docs/wireframes/phase1/play.png" width="180"/> | <img src="docs/wireframes/phase1/profile.png" width="180"/> |

</div>

---

## 🛠️ Tech Stack

<table>
<tr>
<td>

**Frontend**
- Flutter 3.x
- Dart 3.x
- Material Design 3

</td>
<td>

**State & Storage**
- Provider (State Management)
- SharedPreferences
- Hive (Local DB)

</td>
<td>

**Features**
- go_router (Navigation)
- audioplayers (Audio)
- flutter_screenutil (Responsive)

</td>
</tr>
</table>

**Architecture:** Clean Architecture with Feature-First organization

---

## 📦 Installation

### Prerequisites

```
✓ Flutter SDK 3.0+
✓ Dart SDK 3.0+
✓ Android Studio / VS Code
✓ Android SDK (API 23+) or Xcode (iOS 12+)
```

### Quick Start

```bash
# Clone repository
git clone https://github.com/ashrafulislamse/shekharboard.git
cd shekharboard

# Install dependencies
flutter pub get

# Generate localization files
flutter gen-l10n

# Run on connected device
flutter run
```

### Build Release

```bash
# Android APK
flutter build apk --release

# Android App Bundle (Play Store)
flutter build appbundle --release

# iOS (requires macOS)
flutter build ios --release
```

---

## 🏗️ Architecture

```
lib/
├── main.dart                      # App entry point
├── core/
│   ├── constants/                 # Colors, spacing, strings
│   ├── router/                    # go_router configuration
│   ├── utils/                     # Services (Audio, Progress, Favorites)
│   └── widgets/                   # Shared UI components
├── features/
│   ├── onboarding/                # Splash → Welcome → Tutorial
│   │   └── presentation/pages/
│   ├── home/                      # Dashboard with categories
│   ├── learn/                     # Flashcard learning screens
│   ├── play/                      # 5 educational games
│   ├── favorites/                 # Saved items collection
│   ├── profile/                   # Child stats & achievements
│   └── settings/                  # Parental controls
└── l10n/                          # Bengali & English translations
```

### Design Principles

1. **Offline-First** - All content bundled in app
2. **Performance** - Optimized for 2GB RAM devices
3. **Accessibility** - Large touch targets, high contrast
4. **Localization** - Full Bengali & English support

---

## 🗺️ Roadmap

### ✅ Phase 1: MVP (Completed)
- [x] Core learning categories (Animals, Fruits, Vehicles, Numbers, Colors)
- [x] 5 educational games
- [x] Bengali & English localization
- [x] Parental controls (Math Gate, Timer)
- [x] Progress tracking & statistics
- [x] Favorites system
- [x] 227+ Bengali audio files

### 🚧 Phase 2: Enhanced Learning (Q2 2026)
- [ ] **বর্ণমালা (Alphabet)** - ক-ঞ with stroke animation
- [ ] **স্বরবর্ণ (Vowels)** - অ-ঔ with pronunciation
- [ ] **ছড়া (Rhymes)** - 10 Bengali nursery rhymes
- [ ] **গল্প (Stories)** - 5 animated short stories
- [ ] Achievement badges & rewards system
- [ ] Dark mode support

### 🔮 Phase 3: Advanced Features (Q4 2026)
- [ ] **শব্দ গঠন (Word Building)** - Combine letters to make words
- [ ] **বাক্য (Sentences)** - Simple sentence construction
- [ ] **পরিবার (Family)** - Family members vocabulary
- [ ] **শরীর (Body Parts)** - Body parts with pointing game
- [ ] Parent dashboard with detailed analytics
- [ ] Multiple child profiles

### 🌟 Phase 4: Expansion (2027)
- [ ] **ইংরেজি বর্ণমালা** - English alphabet learning
- [ ] **সংখ্যা 11-100** - Extended number learning
- [ ] **সময় (Time)** - Clock reading basics
- [ ] **আকৃতি (Shapes)** - Basic shapes
- [ ] Tablet-optimized layouts
- [ ] Wear OS companion app (parent notifications)

### 💭 Future Considerations
- AR-based letter tracing
- Voice recognition for pronunciation practice
- Teacher/classroom mode
- Regional dialect support (Sylheti, Chittagonian)

---

## 🎨 Design System

### Color Palette

| Color | Hex | Usage |
|-------|-----|-------|
| 🟡 Warm Cream | `#FAF6F0` | Background (reduces eye strain) |
| 🟢 Soft Green | `#7FBA96` | Animals (nature, calm) |
| 🔵 Sky Blue | `#87CEEB` | Fruits (focus, clarity) |
| 🟠 Mango Yellow | `#FFD54F` | Vehicles (energy, joy) |
| 🔷 Dark Teal | `#1B5E5E` | Text (stability, wisdom) |

### Typography

- **Bengali**: Noto Sans Bengali (optimized for readability)
- **English**: Nunito (friendly, rounded)

---

## 🔊 Audio Content

**227+ professionally generated audio files:**

- ✅ Word pronunciations (native Bengali accent)
- ✅ Fun facts for each item
- ✅ Positive feedback sounds
- ✅ Game instructions
- ✅ Victory celebrations

---

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. **Fork** the repository
2. **Create** your feature branch
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Commit** your changes
   ```bash
   git commit -m 'feat: add amazing feature'
   ```
4. **Push** to the branch
   ```bash
   git push origin feature/amazing-feature
   ```
5. **Open** a Pull Request

### Commit Convention

We follow [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation
- `style:` Formatting
- `refactor:` Code restructuring
- `test:` Adding tests

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file.

---

## 👥 About ZingSwift

<div align="center">

**ZingSwift** builds educational technology for emerging markets.

[🌐 Website](https://zingswift.com) • [📧 Email](mailto:support@zingswift.com) • [🐦 Twitter](https://twitter.com/zingswift)

---

<sub>Made with ❤️ in Bangladesh 🇧🇩</sub>

<sub>© 2026 ZingSwift. All rights reserved.</sub>

</div>
