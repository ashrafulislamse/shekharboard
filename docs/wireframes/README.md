# 📱 Touch & Learn Board - Wireframe Documentation Index
## Complete UI/UX Specification

---

## 📋 Overview

This documentation contains **62 detailed screen wireframes** for the Touch & Learn Board Bangla educational app, organized into 3 development phases with maximum 10 screens per file.

**Target Audience:** Bangladeshi children ages 1-5  
**Primary Language:** Bangla (বাংলা)  
**Platform:** Flutter (Android 6.0+, iOS 12+)  
**Design Focus:** Low-end Android devices (2GB RAM, 5-6" screens)

---

## 📁 File Structure

```
docs/wireframes/
│
├── README.md (this file)
│
├── phase1-mvp/
│   ├── 01-foundation-screens.md      (Screens 1-7)
│   ├── 02-learning-content-screens.md (Screens 8-15)
│   └── 03-parent-control-screens.md  (Screens 16-22)
│
├── phase2-enhanced/
│   ├── 01-story-screens.md           (Screens 29-33)
│   ├── 02-game-screens.md            (Screens 34-41)
│   └── 03-error-accessibility-screens.md (Screens 23-28, 48-50)
│
└── phase3-premium/
    ├── 01-advanced-learning-screens.md    (Screens 42-47)
    ├── 02-cultural-monetization-screens.md (Screens 51-58)
    └── 03-session-management-screens.md   (Screens 59-62)
```

---

## 📊 Screen Index by Phase

### Phase 1: MVP (22 Screens)

| # | Screen Name | File | Priority |
|---|-------------|------|----------|
| 1 | Language Selection | 01-foundation | P0 |
| 2 | Splash Screen | 01-foundation | P0 |
| 3 | Welcome Screen | 01-foundation | P0 |
| 4 | Tutorial Overlay | 01-foundation | P1 |
| 5 | Home Tab (Discovery Hub) | 01-foundation | P0 |
| 5A | Learn Tab | 01-foundation | P0 |
| 5B | Play Tab | 01-foundation | P0 |
| 5C | Favorites Tab | 01-foundation | P1 |
| 5D | Profile Tab | 01-foundation | P0 |
| 6 | Offline Verification | 01-foundation | P1 |
| 7 | Critical Error | 01-foundation | P1 |
| 8 | Learning Detail View | 02-learning | P0 |
| 9 | Animal Category | 02-learning | P0 |
| 10 | Fruit Category | 02-learning | P0 |
| 11 | Vehicle Category | 02-learning | P0 |
| 12 | Swipe Navigation | 02-learning | P0 |
| 13 | Category Completion | 02-learning | P1 |
| 14 | Favorites Collection | 02-learning | P2 |
| 15 | Learning Path | 02-learning | P2 |
| 16 | Math Gate Dialog | 03-parent | P0 |
| 17 | Parent Settings | 03-parent | P0 |
| 18 | Weekly Report | 03-parent | P1 |
| 19 | Content Pack Management | 03-parent | P1 |
| 20 | Timer Control | 03-parent | P1 |
| 21 | About Screen | 03-parent | P2 |
| 22 | Help/FAQ | 03-parent | P2 |

### Phase 2: Enhanced (19 Screens)

| # | Screen Name | File | Priority |
|---|-------------|------|----------|
| 23 | Network Error | 03-error-accessibility | P1 |
| 24 | Download Progress | 03-error-accessibility | P1 |
| 25 | Storage Full | 03-error-accessibility | P2 |
| 26 | Loading Skeleton | 03-error-accessibility | P1 |
| 27 | Empty State | 03-error-accessibility | P1 |
| 28 | Session Time Limit | 03-error-accessibility | P1 |
| 29 | Story Library | 01-story | P1 |
| 30 | Story Reader | 01-story | P1 |
| 31 | Story Completion | 01-story | P1 |
| 32 | Story Quiz | 01-story | P2 |
| 33 | Story Progress | 01-story | P2 |
| 34 | Game Center (Play Tab Hub) | 02-game | P1 |
| 35 | Find It! Game | 02-game | P1 |
| 36 | Match Pairs | 02-game | P1 |
| 37 | Color Match | 02-game | P2 |
| 38 | Count & Learn | 02-game | P1 |
| 39 | Sound Match | 02-game | P2 |
| 40 | Game Complete | 02-game | P1 |
| 41 | Jigsaw Puzzle | 02-game | P2 |
| 48 | High Contrast Mode | 03-error-accessibility | P2 |
| 49 | Left-Handed Mode | 03-error-accessibility | P2 |
| 50 | Large Text Mode | 03-error-accessibility | P2 |

### Phase 3: Premium (21 Screens)

| # | Screen Name | File | Priority |
|---|-------------|------|----------|
| 42 | Alphabet Grid | 01-advanced | P1 |
| 43 | Letter Detail | 01-advanced | P1 |
| 44 | Number Grid | 01-advanced | P1 |
| 45 | Number Detail | 01-advanced | P1 |
| 46 | Shape Grid | 01-advanced | P1 |
| 47 | Shape Detail | 01-advanced | P1 |
| 51 | Festivals Grid | 02-cultural | P2 |
| 52 | Festival Detail | 02-cultural | P2 |
| 53 | Seasons Grid | 02-cultural | P2 |
| 54 | Food Grid | 02-cultural | P2 |
| 55 | Premium Screen | 02-cultural | P1 |
| 56 | bKash Payment | 02-cultural | P1 |
| 57 | Purchase Success | 02-cultural | P1 |
| 58 | Restore Purchase | 02-cultural | P2 |
| 59 | Daily Session Start | 03-session | P1 |
| 60 | Session Resume | 03-session | P1 |
| 61 | Progress Save | 03-session | P1 |
| 62 | Multi-Child Profiles | 03-session | P2 |

---

## 🎨 Design System Quick Reference

### Colors
| Token | Value | Usage |
|-------|-------|-------|
| `warmCream` | #FAF6F0 | Background |
| `softGreen` | #7FBA96 | Primary actions |
| `skyBlue` | #87CEEB | Secondary |
| `mangoYellow` | #FFD54F | Highlights |
| `clayRed` | #C75146 | Errors |
| `darkTeal` | #1B5E5E | Text |

### Typography
| Style | Size | Weight | Font |
|-------|------|--------|------|
| Headline | 28sp | Bold | NotoSansBengali |
| Title | 22sp | SemiBold | NotoSansBengali |
| Body | 18sp | Regular | NotoSansBengali |
| Caption | 14sp | Regular | NotoSansBengali |

### Spacing
| Token | Value |
|-------|-------|
| `xs` | 4dp |
| `sm` | 8dp |
| `md` | 16dp |
| `lg` | 24dp |
| `xl` | 32dp |

### Touch Targets
- Minimum: 44dp × 44dp
- Recommended for children: 64dp × 64dp
- Primary buttons: 56dp height

---

## 🔄 Navigation Architecture - 5-Tab System

> **IMPORTANT:** This app uses a **5-tab bottom navigation** architecture to scale to 62+ screens.

### Bottom Navigation Tabs
```
┌────────────────────────────────────────────────────────────────┐
│     🏠        📚         🎮         ❤️         👤           │
│    হোম       শেখা       খেলা      পছন্দ    প্রোফাইল         │
│   (Home)   (Learn)    (Play)  (Favorites) (Profile)         │
│   Tab 0     Tab 1     Tab 2     Tab 3      Tab 4            │
└────────────────────────────────────────────────────────────────┘
Active: #7FBA96 (softGreen)  |  Inactive: #5D7A7A  |  Height: 64dp
```

### Tab Content Overview

| Tab | Name | Content | Phase |
|-----|------|---------|-------|
| 0 | হোম (Home) | Discovery hub, continue learning, popular words, festival banners | P1 |
| 1 | শেখা (Learn) | ALL learning: Categories, Alphabet, Stories, Culture | P1+ |
| 2 | খেলা (Play) | ALL games: Find It, Match, Quiz (Coming Soon in P1) | P2 |
| 3 | পছন্দ (Favorites) | Saved items across all content types | P1 |
| 4 | প্রোফাইল (Profile) | Settings (Math Gate), Progress, Reports | P1 |

### Onboarding Flow (No Bottom Nav)
```
Splash → Language → Welcome → Tutorial → Home Tab (Bottom Nav Appears)
```

### Tab 1 - Learn Tab Structure
```
শেখা (Learn Tab)
├── 🐾 প্রাণী (Animals) → Detail View
├── 🍎 ফল (Fruits) → Detail View
├── 🚗 যানবাহন (Vehicles) → Detail View
├── 📖 গল্প (Stories) → Story Reader [Phase 2]
├── 🔤 বর্ণমালা (Alphabet) → Letter Detail [Phase 3]
├── 🔢 সংখ্যা (Numbers) → Number Detail [Phase 3]
├── 🔷 আকৃতি (Shapes) → Shape Detail [Phase 3]
└── 🎉 উৎসব (Festivals) → Festival Detail [Phase 3]
```

### Tab 2 - Play Tab Structure
```
খেলা (Play Tab)
├── 🔍 খুঁজে বের করো (Find It Game) [Phase 2]
├── 🎴 জোড়া মেলাও (Match Pairs) [Phase 2]
├── 🎨 রঙ মেলাও (Color Match) [Phase 2]
├── 🔢 গুনতে শেখো (Count & Learn) [Phase 2]
├── 🔊 শব্দ মেলাও (Sound Match) [Phase 2]
└── 🧩 ছবির ধাঁধা (Jigsaw) [Phase 2]

Phase 1: Shows "শীঘ্রই আসছে" (Coming Soon) preview
```

### Tab 4 - Profile Tab (Math Gate Protected)
```
প্রোফাইল (Profile Tab)
│
├── Child's Progress View (No gate)
│   └── View-only stats
│
└── ⚙️ Settings → Math Gate Required
    ├── Weekly Report
    ├── Timer Control
    ├── Content Packs
    ├── About/Help
    └── Multi-Child Profiles [Phase 3]
```

---

## 📱 Responsive Breakpoints

| Device Size | Screen Width | Grid | Notes |
|-------------|--------------|------|-------|
| Small | < 360dp | 2 columns | Compact spacing |
| Medium | 360-400dp | 2 columns | Standard (target) |
| Large | > 400dp | 3 columns | Tablet optimization |

---

## ✅ Implementation Checklist

### Phase 1 MVP
- [ ] Language Selection Screen
- [ ] Splash Screen with loading
- [ ] Welcome + Tutorial
- [ ] **5-Tab Bottom Navigation**
- [ ] Home Tab - Discovery Hub
- [ ] Learn Tab - Category grid
- [ ] Play Tab - Coming Soon state
- [ ] Favorites Tab
- [ ] Profile Tab
- [ ] Learning Detail View with phonics
- [ ] Category swipe navigation
- [ ] Parent Math Gate
- [ ] Basic Settings
- [ ] Offline support

### Phase 2 Enhanced
- [ ] Story feature (5 screens) - in Learn Tab
- [ ] Game Center (8 screens) - IS the Play Tab
- [ ] Error handling screens (overlays)
- [ ] Accessibility modes

### Phase 3 Premium
- [ ] Alphabet/Number/Shape learning - in Learn Tab
- [ ] Cultural content - in Learn Tab
- [ ] Premium subscription (overlay)
- [ ] bKash payment (overlay)
- [ ] Multi-child profiles - in Profile Tab
- [ ] Session management

---

## 📚 Related Documentation

- [Blueprint.md](../Bluprint.md) - Complete project specification
- [AI Graphics Strategy](../Bluprint.md#ai-graphics) - Image generation guidelines
- [AI Voice Generation](../Bluprint.md#ai-voice) - Audio production setup
- [Hive Database Schema](../Bluprint.md#database) - Local storage structure

---

## 👨‍💻 For Developers

Each wireframe file contains:
1. **ASCII Layout** - Visual structure of each screen
2. **Design Tokens** - Exact colors, fonts, spacing
3. **Interaction Specs** - Touch feedback, animations
4. **State Management** - Data flow and state handling
5. **Navigation** - Screen transitions and flows
6. **Responsive Rules** - Breakpoint adaptations
7. **Accessibility** - A11y considerations

---

## 📝 Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2024 | Initial 62-screen wireframe documentation |

---

**Created by:** Senior UI/UX Design Team  
**Project:** Touch & Learn Board  
**Target:** Bangladesh children ages 1-5
