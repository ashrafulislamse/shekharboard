# 📱 Touch & Learn Board - Navigation Architecture

> **Important:** This document defines the app's navigation structure. All developers must follow this pattern to maintain consistency across phases.

**Last Updated:** January 31, 2026  
**Status:** ✅ FINAL - 5-Tab Architecture Approved

---

## 🎯 Core Principle: ONE Navigation, Content Grows Inside

The app uses a **SINGLE persistent 5-tab bottom navigation** that remains constant across ALL development phases. New features are added **inside existing tabs**, not as new tabs.

---

## 📌 Bottom Navigation Structure (Fixed - Do NOT Change)

```
┌─────────────────────────────────────────────────────────────────────────┐
│                                                                          │
│      হোম      │      শেখা      │      খেলা     │    পছন্দ    │  প্রোফাইল  │
│     Home      │     Learn      │     Play      │  Favorites  │  Profile  │
│      🏠       │      📚        │      🎮       │      ❤️     │     👤    │
│               │                │               │             │           │
│   Index: 0    │    Index: 1    │   Index: 2    │  Index: 3   │ Index: 4  │
│               │                │               │             │           │
└───────────────┴────────────────┴───────────────┴─────────────┴───────────┘
```

### Tab Details:

| Tab | Icon | Bengali | Purpose |
|-----|------|---------|---------|
| **হোম** | `Icons.home_rounded` | হোম | Discovery hub - personalized, continue learning, quick access |
| **শেখা** | `Icons.menu_book_rounded` | শেখা | ALL learning content (Categories, Alphabet, Stories, Culture) |
| **খেলা** | `Icons.sports_esports_rounded` | খেলা | ALL games center (Phase 1: "Coming Soon") |
| **পছন্দ** | `Icons.favorite_rounded` | পছন্দ | Favorites from ALL content types |
| **প্রোফাইল** | `Icons.person_rounded` | প্রোফাইল | Settings + Progress (Math Gate protected) |

---

## 🔄 Phase-Based Content Evolution

### How Content Expands (NOT Navigation):

```
┌─────────────────────────────────────────────────────────────────────────┐
│                              হোম TAB (Tab 0)                            │
│                         DISCOVERY HUB - NOT CONTENT DUMP                │
├─────────────────────────────────────────────────────────────────────────┤
│  • Time-based greeting (সুপ্রভাত/শুভ দুপুর/শুভ সন্ধ্যা)                     │
│  • Continue learning card (যেখানে ছিলে)                                   │
│  • Quick access shortcuts to শেখা/খেলা tabs                              │
│  • Popular words (based on tap history)                                 │
│  • Upcoming festival banner (when within 2 weeks)                       │
│  • New content announcements                                            │
└─────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────┐
│                              শেখা TAB (Tab 1)                           │
│                         ALL LEARNING CONTENT                            │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  Phase 1 (MVP): Core Categories                                         │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │  📚 প্রধান বিষয় (Core Categories)                                │   │
│  │  ┌────────┐ ┌────────┐ ┌────────┐ ┌────────┐ ┌────────┐ ┌────┐ │   │
│  │  │ প্রাণী │ │  ফল   │ │যানবাহন│ │  রং   │ │ সংখ্যা │ │শরীর│ │   │
│  │  └────────┘ └────────┘ └────────┘ └────────┘ └────────┘ └────┘ │   │
│  └─────────────────────────────────────────────────────────────────┘   │
│                                                                         │
│  Phase 2 (Enhanced): +Stories Section                                   │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │  📖 গল্পের ঘর (Stories)                                          │   │
│  │  ┌────────────┐ ┌────────────┐ ┌────────────┐                   │   │
│  │  │ গরুর গল্প  │ │বিড়াল ও মাছ│ │ হাতি ও পিঁপড়া │                   │   │
│  │  └────────────┘ └────────────┘ └────────────┘                   │   │
│  └─────────────────────────────────────────────────────────────────┘   │
│                                                                         │
│  Phase 3 (Premium): +Advanced Learning & Culture                        │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │  🔤 বর্ণমালা ও সংখ্যা (Alphabet & Numbers)                        │   │
│  │  ┌────────────┐ ┌────────────┐ ┌────────────┐                   │   │
│  │  │  বর্ণমালা  │ │   সংখ্যা   │ │   আকৃতি   │                   │   │
│  │  └────────────┘ └────────────┘ └────────────┘                   │   │
│  │                                                                 │   │
│  │  🎉 সংস্কৃতি (Culture)                                           │   │
│  │  ┌────────────┐ ┌────────────┐ ┌────────────┐                   │   │
│  │  │   উৎসব    │ │    ঋতু    │ │   খাবার   │                   │   │
│  │  └────────────┘ └────────────┘ └────────────┘                   │   │
│  └─────────────────────────────────────────────────────────────────┘   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────┐
│                              খেলা TAB (Tab 2)                           │
│                           ALL GAMES CENTER                              │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  Phase 1: "শীঘ্রই আসছে!" (Coming Soon placeholder)                       │
│                                                                         │
│  Phase 2: Games Unlocked                                                │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │  🎮 সহজ (Easy)                                                   │   │
│  │  ┌──────────┐ ┌──────────┐ ┌──────────┐                         │   │
│  │  │খুঁজে বের│ │ রঙ চিনো │ │শব্দ চিনো│                         │   │
│  │  └──────────┘ └──────────┘ └──────────┘                         │   │
│  │                                                                 │   │
│  │  🎯 মাঝারি (Medium)                                              │   │
│  │  ┌──────────┐ ┌──────────┐                                      │   │
│  │  │ মিল করো │ │গণনা শেখো│                                      │   │
│  │  └──────────┘ └──────────┘                                      │   │
│  └─────────────────────────────────────────────────────────────────┘   │
│                                                                         │
│  Phase 3: +Premium Games                                                │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │  🧩 কঠিন (Hard) 🔒                                               │   │
│  │  ┌──────────┐ ┌──────────┐                                      │   │
│  │  │  পাজল   │ │শব্দ তৈরি│                                      │   │
│  │  └──────────┘ └──────────┘                                      │   │
│  └─────────────────────────────────────────────────────────────────┘   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 📊 Phase Implementation Summary

### Phase 1: MVP (22 Screens)
| Tab | Content |
|-----|---------|
| **হোম** | Discovery hub with quick access & continue learning |
| **শেখা** | 6 Learning Categories (প্রাণী, ফল, যানবাহন, রং, সংখ্যা, শরীর) |
| **খেলা** | "শীঘ্রই আসছে!" (Coming Soon placeholder) |
| **পছন্দ** | Favorite learning items |
| **প্রোফাইল** | Parent settings via Math Gate |

### Phase 2: Enhanced (19 Additional Screens)
| Tab | New Content |
|-----|-------------|
| **হোম** | + Festival banners, new content announcements |
| **শেখা** | + গল্পের ঘর (Stories Section) |
| **খেলা** | Unlock educational games (Find It, Match, Count, etc.) |
| **পছন্দ** | + Favorite stories |
| **প্রোফাইল** | + Detailed learning stats |

### Phase 3: Premium (18 Additional Screens)
| Tab | New Content |
|-----|-------------|
| **হোম** | + Personalized recommendations |
| **শেখা** | + বর্ণমালা, সংখ্যা, আকৃতি + সংস্কৃতি (উৎসব, ঋতু, খাবার) |
| **খেলা** | + Premium games (পাজল, শব্দ তৈরি) |
| **পছন্দ** | + Custom word collections |
| **প্রোফাইল** | + Premium parent features, subscription management |

---

## 🧭 Navigation Flow Patterns

### Pattern 1: Tab-Level Navigation
```
Bottom Nav Tab → Tab Content (with bottom nav visible)
```

### Pattern 2: Sub-Screen Navigation  
```
Tab Content → Detail Screen (NO bottom nav, back button only)
```

### Example Flows:

**Learning Flow:**
```
শেখা Tab → Category Grid → Item Detail → Swipe Navigation → Completion
   │                          │              │              │
   └── Bottom nav visible     └── Back button only ─────────┘
```

**Story Flow:**
```
শেখা Tab → Story Library → Story Reader → Quiz → Completion
   │                          │              │         │
   └── Bottom nav visible     └── Back button only ────┘
```

**Game Flow:**
```
খেলা Tab → Game Selection → Game Play → Score/Results
   │                          │              │
   └── Bottom nav visible     └── Back button only
```

---

## ⚠️ Critical Rules for Developers

### ✅ DO:
1. Keep bottom navigation at exactly **5 tabs**
2. Add new content **inside existing tabs**
3. Use back button (not bottom nav) for detail screens
4. Follow Bengali-first design for child content
5. Implement Math Gate for parent-only features
6. Show "শীঘ্রই আসছে" placeholder for upcoming features

### ❌ DON'T:
1. ~~Add new tabs to bottom navigation~~
2. ~~Create different bottom nav for different phases~~
3. ~~Show bottom nav on detail/sub-screens~~
4. ~~Use English text on child-facing screens~~
5. ~~Put all content in হোম tab (use শেখা for learning content)~~

---

## 🗂️ File Structure for Navigation

```
lib/
├── features/
│   └── learning/
│       └── presentation/
│           └── pages/
│               ├── main_shell_page.dart           ← Contains 5-tab bottom nav
│               │
│               ├── home/                          ← Tab 0: হোম
│               │   └── home_discovery_page.dart
│               │
│               ├── learn/                         ← Tab 1: শেখা
│               │   ├── learn_tab_page.dart
│               │   ├── category_grid_page.dart
│               │   ├── learning_item_page_view.dart    (no nav)
│               │   ├── category_completion_page.dart   (no nav)
│               │   ├── story_library_page.dart
│               │   ├── story_reader_page.dart          (no nav)
│               │   └── culture_section_page.dart
│               │
│               ├── play/                          ← Tab 2: খেলা
│               │   ├── play_tab_page.dart
│               │   ├── game_center_page.dart
│               │   └── game_play_page.dart             (no nav)
│               │
│               ├── favorites/                     ← Tab 3: পছন্দ
│               │   └── favorites_page.dart
│               │
│               └── profile/                       ← Tab 4: প্রোফাইল
│                   ├── profile_tab_page.dart
│                   ├── settings_page.dart              (no nav)
│                   └── progress_detail_page.dart       (no nav)
```

---

## 🎨 Bottom Nav Implementation

Location: `lib/features/learning/presentation/pages/main_shell_page.dart`

```dart
// Bottom Navigation Bar - 5 TABS - DO NOT MODIFY TAB COUNT
Widget _buildBottomNavBar() {
  return Container(
    // ... styling
    child: Row(
      children: [
        _NavItem(icon: Icons.home_rounded, label: 'হোম', index: 0),
        _NavItem(icon: Icons.menu_book_rounded, label: 'শেখা', index: 1),
        _NavItem(icon: Icons.sports_esports_rounded, label: 'খেলা', index: 2),
        _NavItem(icon: Icons.favorite_rounded, label: 'পছন্দ', index: 3),
        _NavItem(icon: Icons.person_rounded, label: 'প্রোফাইল', index: 4),
      ],
    ),
  );
}
```

### Bottom Nav Specs:
```
Height: 64dp (including safe area)
Background: #FFFFFF
Shadow: 0 -2dp 8dp #00000010
Tab Width: Screen width / 5
Icon Size: 24dp
Label: Caption/12sp
Active Color: #7FBA96 (Soft Leaf Green)
Inactive Color: #5D7A7A (Muted Teal)
```

---

## 📝 Changelog

| Version | Date | Change |
|---------|------|--------|
| 1.0 | 2026-01-26 | Initial navigation architecture defined (4-tab) |
| 1.1 | 2026-01-26 | Updated tabs: শিখি → হোম, অগ্রগতি → গেম, অভিভাবক → প্রোফাইল |
| **2.0** | **2026-01-31** | **MAJOR: Migrated to 5-tab architecture per NAVIGATION_REDESIGN_ANALYSIS.md** |
|  |  | - Added শেখা (Learn) tab for all learning content |
|  |  | - Added খেলা (Play) tab for all games |
|  |  | - হোম redesigned as Discovery Hub (not content dump) |
|  |  | - Updated file structure and implementation guide |

---

## 📞 Questions?

If you need to add a feature that doesn't fit this architecture, discuss with the team before implementation. The goal is **consistency across all phases**.

**Reference Documents:**
- [NAVIGATION_REDESIGN_ANALYSIS.md](./NAVIGATION_REDESIGN_ANALYSIS.md) - Detailed analysis
- [Wireframes Phase 1](./wireframes/phase1-mvp/) - Screen specifications

---

*Touch & Learn Board - শিশুদের জন্য বাংলা শিক্ষা অ্যাপ*
