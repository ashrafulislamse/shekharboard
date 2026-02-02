# 📱 Phase 1 MVP - Learning Content Screens (8-15)
## Touch & Learn Board - Premium UI/UX Wireframes

> **5-TAB NAVIGATION NOTE:** These screens are accessed FROM the **শেখা (Learn) Tab**.
> Learning detail screens do NOT show bottom navigation (full-screen immersive).
> Close/Back button returns to Learn Tab.

---

## Screen 8: Learning Item Detail View (Full Screen with Phonics)

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│ Status Bar (light content for dark-on-light)            │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌─────┐                                               │
│  │  ✕  │  Close button                                 │
│  │44×44│  Top-left: 16dp margin                        │
│  └─────┘  Color: #1B5E5E                               │
│           Touch target: 44dp × 44dp                     │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│         ┌─────────────────────────────────┐            │
│         │                                 │            │
│         │                                 │            │
│         │                                 │            │
│         │         🐄                      │            │
│         │                                 │            │
│         │      LARGE IMAGE                │            │
│         │      70% screen width           │            │
│         │      Aspect: 1:1                │            │
│         │      Max: 280dp × 280dp         │            │
│         │                                 │            │
│         │                                 │            │
│         │                                 │            │
│         └─────────────────────────────────┘            │
│              Shadow: 0 8dp 24dp #1B5E5E20              │
│              Corner radius: 32dp                        │
│              Background: #FFFFFF                        │
│                                                         │
│                    [32dp spacing]                       │
│                                                         │
│              ╔═══════════════════════╗                  │
│              ║         গরু           ║                  │
│              ╚═══════════════════════╝                  │
│              Display/48sp, #1B5E5E                      │
│              Font: NotoSansBengali-Bold                 │
│              Letter spacing: 2dp                        │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│         ╔═════════════════════════════════╗            │
│         ║                                 ║            │
│         ║         🔊   শোনো               ║            │
│         ║                                 ║            │
│         ╚═════════════════════════════════╝            │
│         Button: 200dp × 64dp                            │
│         Background: #7FBA96                             │
│         Icon: 28dp, white                               │
│         Text: Title/20sp, white                         │
│         Radius: 32dp (pill shape)                       │
│         Shadow: 0 4dp 12dp #7FBA9640                    │
│                                                         │
│                    [32dp spacing]                       │
│                                                         │
│    ═══════════════ বর্ণ শিখো ═══════════════           │
│    Divider with centered text                           │
│    Line: 1dp #1B5E5E20, Text: Caption/12sp #5D7A7A     │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│         ┌─────────────────────────────────┐            │
│         │                                 │            │
│         │    ┌───────┐    ┌───────┐      │            │
│         │    │   গ   │    │  রু   │      │            │
│         │    │ /go/  │ ─  │ /ru/  │      │            │
│         │    └───────┘    └───────┘      │            │
│         │                                 │            │
│         └─────────────────────────────────┘            │
│         Syllable boxes: 72dp × 80dp each                │
│         Background: #7FBA9620                           │
│         Border: 2dp #7FBA96                             │
│         Radius: 16dp                                    │
│         Bangla: Title/32sp, Phonetic: Caption/14sp      │
│         Tap each for individual sound                   │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│         ┌─────────────────────────────────┐            │
│         │       ← পাশে সোয়াইপ করো →       │            │
│         └─────────────────────────────────┘            │
│         Caption/14sp, #5D7A7A, center aligned           │
│         Arrows: 16dp, animated left-right               │
│                                                         │
│                    [16dp bottom safe area]              │
│                                                         │
└─────────────────────────────────────────────────────────┘

Background: #FAF6F0 (consistent warm cream)
```

### 🎬 Animations

| Element | Animation | Duration | Trigger |
|---------|-----------|----------|---------|
| Image | Scale in (0.8→1.0) + fade | 400ms | On enter |
| Word Text | Slide up 20dp + fade | 300ms | 100ms delay |
| Listen Button | Scale in (0.9→1.0) | 300ms | 200ms delay |
| Syllables | Stagger fade in | 200ms each | 400ms delay |
| Audio Playing | Button pulse glow | 500ms loop | While playing |
| Syllable Tap | Scale 0.9→1.0 + ripple | 200ms | On tap |

### 👆 Interactions

| Action | Feedback | Result |
|--------|----------|--------|
| Tap Close (✕) | Scale 0.9 + haptic | Return to Main Board |
| Tap Listen Button | Ripple + scale 0.95 | Play full word audio |
| Tap Syllable Box | Highlight + scale | Play syllable sound |
| Swipe Left | Page transition | Next item in category |
| Swipe Right | Page transition | Previous item |
| Swipe Down (20%+) | Dismiss animation | Return to Main Board |

### 📱 Responsive Variants

| Screen Size | Image Size | Word Size | Button Width |
|-------------|------------|-----------|--------------|
| < 360dp | 200dp | 40sp | 160dp |
| 360-400dp | 240dp | 48sp | 200dp |
| 400-600dp | 280dp | 52sp | 220dp |
| > 600dp | 320dp | 56sp | 260dp |

---

## Screen 9: Animal Category Detail View

### 📐 Layout (Same structure as Screen 8)

```
┌─────────────────────────────────────────────────────────┐
│                                                         │
│  ✕                                    🐄 প্রাণী        │
│                                 Category badge          │
│                                 Background: #7FBA9630   │
│                                 Radius: 20dp            │
│                                                         │
│         ┌─────────────────────────────────┐            │
│         │                                 │            │
│         │         🐱                      │            │
│         │       বিড়াল                     │            │
│         │                                 │            │
│         └─────────────────────────────────┘            │
│         Border accent: 4dp #7FBA96 (left edge)         │
│                                                         │
│              বিড়াল                                      │
│                                                         │
│         ╔═════════════════════════════════╗            │
│         ║         🔊   শোনো               ║            │
│         ╚═════════════════════════════════╝            │
│                                                         │
│    ═══════════ বর্ণ শিখো ═══════════                    │
│                                                         │
│         ┌───────┐    ┌───────┐                         │
│         │  বি   │ ─  │ ড়াল  │                         │
│         │ /bi/  │    │ /ral/ │                         │
│         └───────┘    └───────┘                         │
│                                                         │
│              ● ○ ○ ○ ○                                  │
│         Page indicator: 1 of 5 animals                  │
│         Dots: 8dp, active: #7FBA96, inactive: #1B5E5E30│
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### 🐾 Animal Category Data

| # | Bangla | English | Phonics | Color Accent |
|---|--------|---------|---------|--------------|
| 1 | গরু | Cow | গ-রু | #7FBA96 |
| 2 | বিড়াল | Cat | বি-ড়াল | #7FBA96 |
| 3 | মাছ | Fish | মাছ | #7FBA96 |
| 4 | মুরগি | Chicken | মুর-গি | #7FBA96 |
| 5 | ছাগল | Goat | ছা-গল | #7FBA96 |

---

## Screen 10: Fruit Category Detail View

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│                                                         │
│  ✕                                   🥭 ফল             │
│                                   Badge: #87CEEB30     │
│                                                         │
│         ┌─────────────────────────────────┐            │
│         │                                 │            │
│         │         🥭                      │            │
│         │                                 │            │
│         └─────────────────────────────────┘            │
│         Border accent: 4dp #87CEEB (left edge)         │
│                                                         │
│              আম                                         │
│                                                         │
│         ╔═════════════════════════════════╗            │
│         ║         🔊   শোনো               ║            │
│         ╚═════════════════════════════════╝            │
│         Button color: #87CEEB                           │
│                                                         │
│    ═══════════ বর্ণ শিখো ═══════════                    │
│                                                         │
│              ┌───────┐                                  │
│              │  আম   │   Single syllable               │
│              │ /aam/ │                                  │
│              └───────┘                                  │
│                                                         │
│              ● ○ ○ ○ ○                                  │
│         Page indicator: 1 of 5 fruits                   │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### 🍎 Fruit Category Data

| # | Bangla | English | Phonics | Color Accent |
|---|--------|---------|---------|--------------|
| 1 | আম | Mango | আম | #87CEEB |
| 2 | কলা | Banana | ক-লা | #87CEEB |
| 3 | কাঁঠাল | Jackfruit | কাঁ-ঠাল | #87CEEB |
| 4 | পেয়ারা | Guava | পে-য়া-রা | #87CEEB |
| 5 | নারকেল | Coconut | না-র-কেল | #87CEEB |

---

## Screen 11: Vehicle Category Detail View

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│                                                         │
│  ✕                                🚜 যানবাহন          │
│                                Badge: #FFD54F30        │
│                                                         │
│         ┌─────────────────────────────────┐            │
│         │                                 │            │
│         │         🚜                      │            │
│         │       রিকশা                     │            │
│         │   (বাংলাদেশের প্রতীক)         │            │
│         │                                 │            │
│         └─────────────────────────────────┘            │
│         Border accent: 4dp #FFD54F (left edge)         │
│                                                         │
│              রিকশা                                      │
│                                                         │
│         ╔═════════════════════════════════╗            │
│         ║         🔊   শোনো               ║            │
│         ╚═════════════════════════════════╝            │
│         Button color: #FFD54F                           │
│         Text color: #1B5E5E (dark for contrast)        │
│                                                         │
│    ═══════════ বর্ণ শিখো ═══════════                    │
│                                                         │
│         ┌───────┐    ┌───────┐                         │
│         │ রিক   │ ─  │  শা   │                         │
│         │ /rik/ │    │ /sha/ │                         │
│         └───────┘    └───────┘                         │
│                                                         │
│              ● ○ ○ ○ ○                                  │
│         Page indicator: 1 of 5 vehicles                 │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### 🚗 Vehicle Category Data

| # | Bangla | English | Phonics | Cultural Note |
|---|--------|---------|---------|---------------|
| 1 | রিকশা | Rickshaw | রিক-শা | Bangladesh icon |
| 2 | নৌকা | Boat | নৌ-কা | River transport |
| 3 | বাস | Bus | বাস | Common transport |
| 4 | ট্রেন | Train | ট্রেন | Single syllable |
| 5 | সাইকেল | Bicycle | সা-ই-কেল | 3 syllables |

---

## Screen 12: Swipe Navigation PageView

### 📐 Technical Layout

```
┌─────────────────────────────────────────────────────────┐
│                                                         │
│  PageView.builder Configuration:                        │
│  ├── viewportFraction: 0.92 (peek edges)               │
│  ├── physics: BouncingScrollPhysics                    │
│  ├── pageSnapping: true                                │
│  └── onPageChanged: → update indicator + preload audio │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                                                 │   │
│  │  ┌───┐ ┌─────────────────────────────┐ ┌───┐  │   │
│  │  │   │ │                             │ │   │  │   │
│  │  │ P │ │      CURRENT PAGE           │ │ N │  │   │
│  │  │ R │ │      (Full detail view)     │ │ E │  │   │
│  │  │ E │ │                             │ │ X │  │   │
│  │  │ V │ │         🥭                  │ │ T │  │   │
│  │  │   │ │         আম                  │ │   │  │   │
│  │  │ 8%│ │                             │ │ 8%│  │   │
│  │  │   │ │                             │ │   │  │   │
│  │  └───┘ └─────────────────────────────┘ └───┘  │   │
│  │        │◄── 84% visible ──►│                   │   │
│  │                                                 │   │
│  │  Peek cards: opacity 0.5, scale 0.9            │   │
│  │  Current card: opacity 1.0, scale 1.0          │   │
│  │                                                 │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│  Gesture Handling:                                      │
│  ├── Swipe threshold: 50dp (larger for toddlers)       │
│  ├── Velocity threshold: 300 pixels/sec                │
│  ├── Haptic: light vibration on page change            │
│  └── Audio: auto-play after 500ms settle delay         │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### 🎬 Page Transition Animation

```dart
// Animation Configuration
PageController(
  viewportFraction: 0.92,
  initialPage: 0,
)

// Transform for peek effect
Transform.scale(
  scale: isCurrentPage ? 1.0 : 0.9,
  child: AnimatedOpacity(
    opacity: isCurrentPage ? 1.0 : 0.5,
    duration: Duration(milliseconds: 300),
    child: DetailCard(...),
  ),
)
```

### 📱 Swipe Gesture Specifications

| Gesture | Threshold | Action | Feedback |
|---------|-----------|--------|----------|
| Swipe Left | > 50dp | Next page | Haptic + page snap |
| Swipe Right | > 50dp | Previous page | Haptic + page snap |
| Swipe Down | > 80dp (20% screen) | Dismiss to board | Scale down + fade |
| Tap anywhere | - | Play audio | Button highlight |

---

## Screen 13: Category Completion Summary

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│                                                         │
│                    [80dp top margin]                    │
│                                                         │
│              ┌─────────────────────────┐                │
│              │      ⭐  ⭐  ⭐          │                │
│              │                         │                │
│              │   Staggered fade-in     │                │
│              │   48dp each, 16dp gap   │                │
│              │   Color: #FFD54F        │                │
│              │   Glow animation        │                │
│              └─────────────────────────┘                │
│                                                         │
│                    [32dp spacing]                       │
│                                                         │
│              ╔═══════════════════════════╗              │
│              ║    তুমি সব শিখেছো!        ║              │
│              ╚═══════════════════════════╝              │
│              Headline/28sp                              │
│              Color: #1B5E5E                             │
│                                                         │
│                    [40dp spacing]                       │
│                                                         │
│    ┌─────────────────────────────────────────────────┐  │
│    │                                                 │  │
│    │   তুমি যা শিখেছো:                               │  │
│    │                                                 │  │
│    │   ┌─────┐ ┌─────┐ ┌─────┐ ┌─────┐ ┌─────┐    │  │
│    │   │ 🐄  │ │ 🐱  │ │ 🐟  │ │ 🐔  │ │ 🐐  │    │  │
│    │   │গরু  │ │বিড়াল│ │মাছ  │ │মুরগি│ │ছাগল │    │  │
│    │   └─────┘ └─────┘ └─────┘ └─────┘ └─────┘    │  │
│    │                                                 │  │
│    │   Mini tiles: 56dp × 64dp each                 │  │
│    │   Wrap layout, 8dp gap                         │  │
│    │   Background: category color @ 20%             │  │
│    │                                                 │  │
│    └─────────────────────────────────────────────────┘  │
│    Card: #FFFFFF, radius 20dp, padding 20dp             │
│                                                         │
│                    [48dp spacing]                       │
│                                                         │
│    ╔═══════════════════════════════════════════════╗    │
│    ║                                               ║    │
│    ║         আরও শিখো                             ║    │
│    ║                                               ║    │
│    ╚═══════════════════════════════════════════════╝    │
│    Primary button: 70% width, 56dp                      │
│    Background: #7FBA96                                  │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│    ┌───────────────────────────────────────────────┐    │
│    │                                               │    │
│    │         ফিরে যাও                                │    │
│    │                                               │    │
│    └───────────────────────────────────────────────┘    │
│    Secondary button: 70% width, 56dp                    │
│    Background: transparent                              │
│    Border: 2dp #1B5E5E                                  │
│                                                         │
│                    [32dp bottom margin]                 │
│                                                         │
│    ───────────────────────────────────────────────────  │
│    ⚠️ NON-ADDICTIVE DESIGN:                            │
│    • No points or scores shown                         │
│    • No streak counter                                 │
│    • No "challenge" or "next level"                    │
│    • Simple acknowledgment only                        │
│    ───────────────────────────────────────────────────  │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### 🎬 Celebration Animations

| Element | Animation | Duration | Timing |
|---------|-----------|----------|--------|
| Star 1 | Fade in + scale (0→1) + rotate | 400ms | 0ms |
| Star 2 | Fade in + scale (0→1) + rotate | 400ms | 200ms |
| Star 3 | Fade in + scale (0→1) + rotate | 400ms | 400ms |
| Stars Glow | Pulse opacity (0.8→1.0) | 1500ms | Loop after entry |
| Text | Slide up + fade | 500ms | 600ms |
| Mini Tiles | Stagger scale in | 150ms each | 800ms |
| Buttons | Fade in | 400ms | 1200ms |

### 🔊 Audio Feedback

```
On Screen Enter:
├── Play gentle chime sound (300ms)
├── Delay 500ms
└── Play "চমৎকার!" (Excellent!) voice

No additional audio loops (non-addictive)
```

---

## Screen 14: Favorites Collection

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│ Status Bar                                              │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌─────┐                    ┌─────────────────────┐    │
│  │  ←  │                    │  ❤️ প্রিয়               │    │
│  │ Back│                    └─────────────────────┘    │
│  └─────┘                    Title bar: 56dp height     │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                                                 │   │
│  │   IF favorites.isEmpty:                        │   │
│  │                                                 │   │
│  │              ┌─────────────┐                   │   │
│  │              │     💔      │                   │   │
│  │              │   64dp      │                   │   │
│  │              └─────────────┘                   │   │
│  │                                                 │   │
│  │         এখনো কোনো প্রিয় নেই                   │   │
│  │         No favorites yet                       │   │
│  │                                                 │   │
│  │   ছবিতে দীর্ঘক্ষণ চাপ দিয়ে প্রিয় করুন        │   │
│  │   Long press an item to add to favorites       │   │
│  │                                                 │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                                                 │   │
│  │   IF favorites.isNotEmpty:                     │   │
│  │                                                 │   │
│  │   ╔════════════╗  ╔════════════╗              │   │
│  │   ║    🐄      ║  ║    🥭      ║              │   │
│  │   ║   গরু      ║  ║    আম      ║              │   │
│  │   ║     ❤️     ║  ║     ❤️     ║              │   │
│  │   ╚════════════╝  ╚════════════╝              │   │
│  │                                                 │   │
│  │   ╔════════════╗  ╔════════════╗              │   │
│  │   ║    🚜      ║  ║    🐱      ║              │   │
│  │   ║  রিকশা     ║  ║  বিড়াল    ║              │   │
│  │   ║     ❤️     ║  ║     ❤️     ║              │   │
│  │   ╚════════════╝  ╚════════════╝              │   │
│  │                                                 │   │
│  │   Grid: 2 columns, same tile style             │   │
│  │   Heart badge: bottom-right, 20dp              │   │
│  │   Badge bg: #C7514620, icon: #C75146           │   │
│  │                                                 │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│  Long Press Tile → Show remove dialog:                  │
│  ┌─────────────────────────────────────────────────┐   │
│  │                                                 │   │
│  │   প্রিয় থেকে সরাবেন?                          │   │
│  │   Remove from favorites?                       │   │
│  │                                                 │   │
│  │   [  হ্যাঁ  ]  [  না  ]                           │   │
│  │                                                 │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### 👆 Interactions

| Action | Feedback | Result |
|--------|----------|--------|
| Tap Tile | Ripple + scale | Open detail view |
| Long Press Tile | Haptic + highlight | Show remove dialog |
| Tap Back | Scale animation | Return to previous |

---

## Screen 15: Learning Path Suggestion

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│                                                         │
│  ┌─────┐                                               │
│  │  ←  │            📈 শেখার পথ                          │
│  └─────┘                                               │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│    ┌─────────────────────────────────────────────────┐  │
│    │                                                 │  │
│    │   পরামর্শ:                                         │  │
│    │                                                 │  │
│    │   Based on your child's activity, we suggest:  │  │
│    │                                                 │  │
│    └─────────────────────────────────────────────────┘  │
│    Caption/14sp, #5D7A7A                                │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│    ╔═════════════════════════════════════════════════╗  │
│    ║                                                 ║  │
│    ║   🎯 আজকের লক্ষ্য                               ║  │
│    ║                                                 ║  │
│    ║   ┌─────────────────────────────────────────┐  ║  │
│    ║   │                                         │  ║  │
│    ║   │  Practice these 3 words:               │  ║  │
│    ║   │                                         │  ║  │
│    ║   │  ┌─────┐  ┌─────┐  ┌─────┐            │  ║  │
│    ║   │  │ 🥭  │  │ 🍌  │  │ 🐟  │            │  ║  │
│    ║   │  │ আম  │  │ কলা │  │ মাছ │            │  ║  │
│    ║   │  └─────┘  └─────┘  └─────┘            │  ║  │
│    ║   │                                         │  ║  │
│    ║   │  (Least practiced items)               │  ║  │
│    ║   │                                         │  ║  │
│    ║   └─────────────────────────────────────────┘  ║  │
│    ║                                                 ║  │
│    ╚═════════════════════════════════════════════════╝  │
│    Card: #FFFFFF, shadow level 1                        │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│    ┌─────────────────────────────────────────────────┐  │
│    │                                                 │  │
│    │   📊 সাপ্তাহিক অগ্রগতি                          │  │
│    │                                                 │  │
│    │   ┌─────────────────────────────────────────┐  │  │
│    │   │                                         │  │  │
│    │   │   প্রাণী   ━━━━━━━━━━━━━━━━━ ১০০%     │  │  │
│    │   │   Animals                               │  │  │
│    │   │                                         │  │  │
│    │   │   ফল      ━━━━━━━━━━━━░░░░░  ৬০%      │  │  │
│    │   │   Fruits                                │  │  │
│    │   │                                         │  │  │
│    │   │   যানবাহন  ━━━━━━━░░░░░░░░░  ৪০%      │  │  │
│    │   │   Vehicles                              │  │  │
│    │   │                                         │  │  │
│    │   └─────────────────────────────────────────┘  │  │
│    │                                                 │  │
│    │   Progress bars: height 8dp, radius 4dp        │  │
│    │   Fill: category color, Track: #1B5E5E15       │  │
│    │                                                 │  │
│    └─────────────────────────────────────────────────┘  │
│                                                         │
│                    [32dp spacing]                       │
│                                                         │
│    ╔═══════════════════════════════════════════════╗    │
│    ║                                               ║    │
│    ║       শিখতে শুরু করো                           ║    │
│    ║                                               ║    │
│    ╚═══════════════════════════════════════════════╝    │
│    Button: Opens first suggested item                   │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

---

## 📋 Screen Summary - Learning Content (8-15)

| # | Screen Name | Purpose | Category Color |
|---|-------------|---------|----------------|
| 8 | Detail View (Generic) | Full item display with phonics | Per category |
| 9 | Animal Detail | Animal-specific detail | #7FBA96 |
| 10 | Fruit Detail | Fruit-specific detail | #87CEEB |
| 11 | Vehicle Detail | Vehicle-specific detail | #FFD54F |
| 12 | Swipe PageView | Navigate between items | Per category |
| 13 | Completion Summary | Category completion | Per category |
| 14 | Favorites | Saved items collection | Mixed |
| 15 | Learning Path | Progress & suggestions | Mixed |

---

## 🔗 Navigation Flow

```
Main Board (Tile Tap)
        │
        ▼
┌───────────────────┐
│   Detail View     │◄─────────────┐
│   (Screen 8-11)   │              │
└─────────┬─────────┘              │
          │                        │
          │ Swipe L/R              │
          ▼                        │
┌───────────────────┐              │
│   PageView        │              │
│   (Screen 12)     │──────────────┤
└─────────┬─────────┘              │
          │                        │
          │ Last item              │
          ▼                        │
┌───────────────────┐              │
│   Completion      │              │
│   (Screen 13)     │              │
└─────────┬─────────┘              │
          │                        │
    ┌─────┴─────┐                  │
    │           │                  │
    ▼           ▼                  │
┌───────┐  ┌─────────┐            │
│ Main  │  │ Learn   │────────────┘
│ Board │  │  More   │
└───────┘  └─────────┘

From Main Board Settings:
┌───────────────────┐
│   Favorites       │
│   (Screen 14)     │
└───────────────────┘

From Parent Dashboard:
┌───────────────────┐
│  Learning Path    │
│   (Screen 15)     │
└───────────────────┘
```

---

## 🎨 Visual Consistency Rules

1. **Category Colors Always Match:**
   - Animals: #7FBA96 (Soft Green)
   - Fruits: #87CEEB (Sky Blue)
   - Vehicles: #FFD54F (Mango Yellow)
   - Stories: #C75146 (Clay Red)

2. **Image Containers:**
   - Always white (#FFFFFF) background
   - Consistent 32dp border radius
   - Category color accent on left edge (4dp)

3. **Typography Hierarchy:**
   - Word: Display/48sp (NotoSansBengali-Bold)
   - English: Title/20sp (NotoSansBengali-Regular)
   - Phonics: Caption/14sp (italic style)

4. **Touch Feedback:**
   - All interactive elements: ripple + scale 0.95
   - Audio buttons: additional glow while playing
   - Consistent haptic: light 30ms for taps
