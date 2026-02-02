# 📱 Phase 2 Enhanced - Story Screens (29-33)
## Touch & Learn Board - Premium UI/UX Wireframes

> **5-TAB NAVIGATION NOTE:** Stories are accessed FROM the **শেখা (Learn) Tab**.
> Story Library shows in Learn Tab → tap opens full-screen Story Reader.
> Story detail screens do NOT show bottom navigation (immersive reading).

---

## Screen 29: Story Library (Category Grid)

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│ Status Bar                                              │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌─────┐                          ┌─────────────────┐  │
│  │ Home│                          │ 📖 গল্পের ঘর   │  │
│  │  🏠 │                          └─────────────────┘  │
│  └─────┘                          Headline/24sp         │
│                                                         │
│  ═══════════════════════════════════════════════════   │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                                                 │   │
│  │  🎨 Filter: [ সব ] [পশু] [ফল] [পরিবার] [প্রকৃতি] │   │
│  │              All  Animal Fruit Family  Nature   │   │
│  │                                                 │   │
│  └─────────────────────────────────────────────────┘   │
│  Chips: Horizontal scroll, 32dp height                 │
│  Active chip: #7FBA96, white text                      │
│  Inactive chip: #F5F5F5, #5D7A7A text                  │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│  ╔═══════════════════════════════════════════════════╗ │
│  ║                                                   ║ │
│  ║   STORY CARD GRID (2 columns)                    ║ │
│  ║                                                   ║ │
│  ║   ┌─────────────────┐  ┌─────────────────┐      ║ │
│  ║   │                 │  │                 │      ║ │
│  ║   │  ┌───────────┐  │  │  ┌───────────┐  │      ║ │
│  ║   │  │           │  │  │  │           │  │      ║ │
│  ║   │  │  🐄 🐄    │  │  │  │  🐱 🐟    │  │      ║ │
│  ║   │  │  Cover    │  │  │  │  Cover    │  │      ║ │
│  ║   │  │  Image    │  │  │  │  Image    │  │      ║ │
│  ║   │  │  120×100  │  │  │  │  120×100  │  │      ║ │
│  ║   │  │           │  │  │  │           │  │      ║ │
│  ║   │  └───────────┘  │  │  └───────────┘  │      ║ │
│  ║   │                 │  │                 │      ║ │
│  ║   │  গরুর গল্প     │  │  বিড়াল ও মাছ  │      ║ │
│  ║   │                 │  │                 │      ║ │
│  ║   │                 │  │                 │      ║ │
│  ║   │  ⭐⭐⭐         │  │  ⭐⭐⭐⭐       │      ║ │
│  ║   │  ━━━━░░░░ 60%  │  │  ━━━━━░░░ 75%  │      ║ │
│  ║   │                 │  │                 │      ║ │
│  ║   └─────────────────┘  └─────────────────┘      ║ │
│  ║                                                   ║ │
│  ║   ┌─────────────────┐  ┌─────────────────┐      ║ │
│  ║   │                 │  │                 │      ║ │
│  ║   │  ┌───────────┐  │  │  ┌───────────┐  │      ║ │
│  ║   │  │  🔒       │  │  │  │           │  │      ║ │
│  ║   │  │  🥭 🍌    │  │  │  │  🚜 🚌    │  │      ║ │
│  ║   │  │  Premium  │  │  │  │  Cover    │  │      ║ │
│  ║   │  │  Locked   │  │  │  │           │  │      ║ │
│  ║   │  │           │  │  │  │           │  │      ║ │
│  ║   │  └───────────┘  │  │  └───────────┘  │      ║ │
│  ║   │                 │  │                 │      ║ │
│  ║   │  ফলের বাগান   │  │  যানবাহনের খেলা │      ║ │
│  ║   │                 │  │                 │      ║ │
│  ║   │                 │  │                 │      ║ │
│  ║   │  🔒 Premium    │  │  New! ✨        │      ║ │
│  ║   │  [Unlock ৳30]  │  │  Not started   │      ║ │
│  ║   │                 │  │                 │      ║ │
│  ║   └─────────────────┘  └─────────────────┘      ║ │
│  ║                                                   ║ │
│  ╚═══════════════════════════════════════════════════╝ │
│                                                         │
│  Story cards:                                           │
│  ├── Size: (screenWidth - 48) / 2  (~156dp each)      │
│  ├── Aspect ratio: Cover ~4:3, full card ~3:4         │
│  ├── Background: #FFFFFF                               │
│  ├── Radius: 16dp                                      │
│  ├── Shadow: 0 4dp 8dp #00000015                       │
│  ├── Gap: 12dp (horizontal & vertical)                 │
│  ├── Title: Body/14sp, #1B5E5E                        │
│  ├── Progress bar: 80dp × 4dp                          │
│  ├── Lock overlay: 50% black                           │
│  └── Difficulty: Stars (12dp each)                     │
│                                                         │
│                    [continues with scroll]              │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### 🎬 Animations

| Element | Animation | Details |
|---------|-----------|---------|
| Card tap | Scale down 0.95 | 100ms |
| Card hover | Elevation 8→16dp | On focus |
| Filter change | Fade + stagger | Cards animate in |
| Lock icon | Pulse | On premium items |

---

## Screen 30: Story Detail / Reader

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│ Status Bar                                              │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌─────┐                    [Page 1 of 5]  ┌─────┐    │
│  │  ←  │                                   │  🔊 │    │
│  │ Back│                                   │Sound│    │
│  └─────┘                                   └─────┘    │
│                                                         │
│  ═══════════════════════════════════════════════════   │
│                                                         │
│  ╔═══════════════════════════════════════════════════╗ │
│  ║                                                   ║ │
│  ║           FULL-WIDTH ILLUSTRATION                ║ │
│  ║                                                   ║ │
│  ║   ┌───────────────────────────────────────────┐  ║ │
│  ║   │                                           │  ║ │
│  ║   │                                           │  ║ │
│  ║   │          🐄                               │  ║ │
│  ║   │                                           │  ║ │
│  ║   │     Scene: Cow in green field             │  ║ │
│  ║   │     with blue sky                         │  ║ │
│  ║   │                                           │  ║ │
│  ║   │     Height: 45% of screen                 │  ║ │
│  ║   │     Aspect: 16:9                          │  ║ │
│  ║   │                                           │  ║ │
│  ║   │     [Tap on cow to highlight + play      │  ║ │
│  ║   │      individual word sound]               │  ║ │
│  ║   │                                           │  ║ │
│  ║   │                                           │  ║ │
│  ║   └───────────────────────────────────────────┘  ║ │
│  ║                                                   ║ │
│  ╚═══════════════════════════════════════════════════╝ │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                                                 │   │
│  │          একটি সবুজ মাঠে                        │   │
│  │        একটি গরু ছিল।                          │   │
│  │                                                 │   │
│  │        ─────────────────────                   │   │
│  │                                                 │   │
│  │        In a green meadow,                      │   │
│  │        there lived a cow.                      │   │
│  │                                                 │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│  Text card:                                             │
│  ├── Bangla text: Headline/24sp, #1B5E5E              │
│  ├── Line height: 1.6                                  │
│  ├── English: Body/14sp, #5D7A7A (optional)           │
│  ├── Background: #FFFFFF                               │
│  ├── Radius: 16dp (top only)                          │
│  ├── Padding: 24dp                                     │
│  └── Shadow: 0 -4dp 8dp #00000010                      │
│                                                         │
│  [Tappable words - tap to hear pronunciation]:         │
│  ├── "গরু" → Play cow sound + highlight               │
│  ├── "সবুজ" → Play green sound + highlight            │
│  └── Words glow briefly when tapped                    │
│                                                         │
│                    [flex spacer]                        │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                                                 │   │
│  │  ┌───────┐              ●○○○○           ┌───────┐   │
│  │  │   ◄   │              Page dots       │   ►   │   │
│  │  │  Back │                              │ Next  │   │
│  │  └───────┘                              └───────┘   │
│  │                                                 │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│  Navigation:                                            │
│  ├── Buttons: 56dp × 56dp, circular                    │
│  ├── Active: #7FBA96, white icon                       │
│  ├── Disabled: #E0E0E0                                 │
│  ├── Page dots: 8dp, active: #1B5E5E, inactive: #D0D0D0│
│  └── Swipe gesture also supported                      │
│                                                         │
│                    [16dp bottom]                        │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### 🎬 Page Transitions

```
PAGE TURN ANIMATION:
├── Type: Slide horizontal
├── Duration: 350ms
├── Curve: easeInOutCubic
│
├── Forward (Next):
│   ├── Old page: Slide left (0 → -width)
│   ├── New page: Slide from right (width → 0)
│   └── Illustration: Scale 0.95 → 1
│
├── Backward (Previous):
│   ├── Old page: Slide right (0 → width)
│   └── New page: Slide from left (-width → 0)
│
└── Word tap highlight:
    ├── Background: #FFD54F20
    ├── Duration: 500ms
    └── Fade out: 300ms
```

---

## Screen 31: Story Completion Celebration

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│ Status Bar                                              │
├─────────────────────────────────────────────────────────┤
│                                                         │
│                                                         │
│                    [64dp spacing]                       │
│                                                         │
│              ┌─────────────────────┐                   │
│              │                     │                   │
│              │        🎉          │                   │
│              │       120dp        │                   │
│              │                     │                   │
│              └─────────────────────┘                   │
│              Animated confetti burst                    │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│              ╔═══════════════════════╗                  │
│              ║                       ║                  │
│              ║    অসাধারণ! 🌟        ║                  │
│              ║                       ║                  │
│              ╚═══════════════════════╝                  │
│              Headline/32sp + wiggle animation           │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│              ┌─────────────────────┐                   │
│              │                     │                   │
│              │  তুমি গল্প শেষ করেছ!│                   │
│              │                     │                   │
│              └─────────────────────┘                   │
│              Body/18sp, center                          │
│                                                         │
│                    [32dp spacing]                       │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                                                 │   │
│  │  📊 তোমার অর্জন:                                │   │
│  │                                                 │   │
│  │  ┌───────────────────────────────────────┐     │   │
│  │  │                                       │     │   │
│  │  │   ⏱️ ৩ মিনিট        📚 ৫ পৃষ্ঠা      │     │   │
│  │  │      3 minutes         5 pages        │     │   │
│  │  │                                       │     │   │
│  │  │   🔤 ১২ শব্দ         ⭐⭐⭐          │     │   │
│  │  │      12 words          Difficulty    │     │   │
│  │  │                                       │     │   │
│  │  └───────────────────────────────────────┘     │   │
│  │                                                 │   │
│  │  Stats grid: 2×2, 80dp cells                   │   │
│  │                                                 │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│                    [32dp spacing]                       │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                                                 │   │
│  │  🏅 নতুন ব্যাজ!                                   │   │
│  │                                                 │   │
│  │       ┌─────────────────────┐                  │   │
│  │       │                     │                  │   │
│  │       │   📖 গল্পপ্রেমী     │                  │   │
│  │       │   Story Lover       │                  │   │
│  │       │                     │                  │   │
│  │       │   First story!      │                  │   │
│  │       │                     │                  │   │
│  │       └─────────────────────┘                  │   │
│  │       Badge: 100dp × 120dp                      │   │
│  │       Gold border, shine animation              │   │
│  │                                                 │   │
│  └─────────────────────────────────────────────────┘   │
│  (Only shows if badge earned)                          │
│                                                         │
│                    [flex spacer]                        │
│                                                         │
│  ╔═══════════════════════════════════════════════╗     │
│  ║                                               ║     │
│  ║        🔄 আবার পড়ুন                       ║     │
│  ║                                               ║     │
│  ╚═══════════════════════════════════════════════╝     │
│  Secondary button: outline style                        │
│                                                         │
│                    [12dp spacing]                       │
│                                                         │
│  ╔═══════════════════════════════════════════════╗     │
│  ║                                               ║     │
│  ║       📚 পরবর্তী গল্প                      ║     │
│  ║                                               ║     │
│  ╚═══════════════════════════════════════════════╝     │
│  Primary button: #7FBA96                               │
│                                                         │
│                    [12dp spacing]                       │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                                                 │   │
│  │         🏠 হোমে যান                          │   │
│  │                                                 │   │
│  └─────────────────────────────────────────────────┘   │
│  Text button: Body/16sp, #5D7A7A                       │
│                                                         │
│                    [24dp bottom]                        │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### 🎬 Celebration Animations

```
ANIMATION SEQUENCE:
├── 0ms: Screen fade in
├── 100ms: Confetti burst (Lottie)
├── 300ms: Title scale up (0.5 → 1) + wiggle
├── 500ms: Stats cards stagger fade in
├── 800ms: Badge reveal (if earned)
│   ├── Scale: 0 → 1.1 → 1
│   ├── Gold sparkle particles
│   └── Shine sweep animation
└── 1200ms: Buttons fade in

CONFETTI:
├── Type: Lottie animation
├── Duration: 2000ms
├── Colors: #7FBA96, #FFD54F, #87CEEB, #C75146
└── Loop: Once
```

---

## Screen 32: Story Quiz (After Story)

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│ Status Bar                                              │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌─────┐                    [Q 1 of 3]     ┌─────┐    │
│  │  ←  │                                   │ Skip│    │
│  │Back │                                   │     │    │
│  └─────┘                                   └─────┘    │
│                                                         │
│  ═══════════════════════════════════════════════════   │
│                                                         │
│              Progress: ●○○                              │
│              3 circles, active filled                   │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│  ╔═══════════════════════════════════════════════════╗ │
│  ║                                                   ║ │
│  ║     🤔 প্রশ্ন:                                        ║ │
│  ║                                                   ║ │
│  ║     গল্পে গরু কোথায় থাকতো?                       ║ │
│  ║     Where did the cow live in the story?         ║ │
│  ║                                                   ║ │
│  ╚═══════════════════════════════════════════════════╝ │
│  Question card: #87CEEB15, radius 20dp                  │
│  Text: Title/20sp, center                              │
│                                                         │
│                    [32dp spacing]                       │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                                                 │   │
│  │  উত্তর বেছে নাও:                                  │   │
│  │                                                 │   │
│  └─────────────────────────────────────────────────┘   │
│  Caption/14sp, #5D7A7A                                  │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│  ╔═══════════════════════════════════════════════════╗ │
│  ║                                                   ║ │
│  ║   ┌─────────────────────────────────────────┐    ║ │
│  ║   │                                         │    ║ │
│  ║   │   🏠 A. বাড়িতে                           │    ║ │
│  ║   │                                         │    ║ │
│  ║   └─────────────────────────────────────────┘    ║ │
│  ║                                                   ║ │
│  ║   ┌─────────────────────────────────────────┐    ║ │
│  ║   │                                         │    ║ │
│  ║   │   🌿 B. মাঠে         ← সঠিক          │    ║ │
│  ║   │                                         │    ║ │
│  ║   └─────────────────────────────────────────┘    ║ │
│  ║                                                   ║ │
│  ║   ┌─────────────────────────────────────────┐    ║ │
│  ║   │                                         │    ║ │
│  ║   │   🏔️ C. পাহাড়ে                           │    ║ │
│  ║   │                                         │    ║ │
│  ║   └─────────────────────────────────────────┘    ║ │
│  ║                                                   ║ │
│  ║   ┌─────────────────────────────────────────┐    ║ │
│  ║   │                                         │    ║ │
│  ║   │   🌊 D. নদীতে                              │    ║ │
│  ║   │                                         │    ║ │
│  ║   └─────────────────────────────────────────┘    ║ │
│  ║                                                   ║ │
│  ╚═══════════════════════════════════════════════════╝ │
│                                                         │
│  Answer options:                                        │
│  ├── Height: 64dp each                                 │
│  ├── Background: #FFFFFF                               │
│  ├── Border: 2dp #E0E0E0                              │
│  ├── Radius: 16dp                                      │
│  ├── Gap: 12dp                                         │
│  ├── Text: Body/16sp + emoji 24dp                     │
│  │                                                     │
│  ├── Selected state: Border #1B5E5E, bg #1B5E5E10    │
│  ├── Correct: Border #7FBA96, bg #7FBA9620 + ✅      │
│  ├── Wrong: Border #C75146, bg #C7514620 + ❌        │
│  └── After answer: Auto-proceed in 1.5s               │
│                                                         │
│                    [flex spacer]                        │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                                                 │   │
│  │  💡 Hint: (appears after 10 seconds)           │   │
│  │     পৃষ্ঠা ১ দেখো!                             │   │
│  │     Check page 1!                              │   │
│  │                                                 │   │
│  └─────────────────────────────────────────────────┘   │
│  Hint card: #FFF8E1, animated fade in                   │
│                                                         │
│                    [24dp bottom]                        │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### 🎬 Quiz Feedback Animations

```
CORRECT ANSWER:
├── Border: Animate to #7FBA96
├── Background: Fade to #7FBA9620
├── Icon: ✅ scale up (0 → 1)
├── Sound: Success chime
├── Confetti: Mini burst from option
└── Delay: 1500ms then next question

WRONG ANSWER:
├── Border: Animate to #C75146
├── Background: Fade to #C7514620
├── Icon: ❌ shake animation
├── Show correct: Highlight correct option
├── Sound: Gentle "try again" tone
└── Delay: 2000ms then next question

QUIZ END → Story Completion screen
```

---

## Screen 33: Story Progress Overview

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│ Status Bar                                              │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌─────┐                       ┌────────────────────┐  │
│  │  ←  │                       │ 📊 আমার গল্প     │  │
│  └─────┘                       │   My Stories      │  │
│                                └────────────────────┘  │
│                                                         │
│  ═══════════════════════════════════════════════════   │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│  ╔═══════════════════════════════════════════════════╗ │
│  ║                                                   ║ │
│  ║  📈 সামগ্রিক অগ্রগতি                              ║ │
│  ║                                                   ║ │
│  ║     ┌─────────────────────────────────────┐      ║ │
│  ║     │                                     │      ║ │
│  ║     │           Circular Progress         │      ║ │
│  ║     │                                     │      ║ │
│  ║     │               ╭───╮                 │      ║ │
│  ║     │              │ 60%│                 │      ║ │
│  ║     │               ╰───╯                 │      ║ │
│  ║     │           ━━━━━━━░░░░░              │      ║ │
│  ║     │                                     │      ║ │
│  ║     │           6 / 10 গল্প               │      ║ │
│  ║     │                                     │      ║ │
│  ║     └─────────────────────────────────────┘      ║ │
│  ║                                                   ║ │
│  ║  Circle: 140dp diameter                          ║ │
│  ║  Progress stroke: 10dp, #7FBA96                  ║ │
│  ║  Background stroke: #E0E0E0                      ║ │
│  ║                                                   ║ │
│  ╚═══════════════════════════════════════════════════╝ │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                                                 │   │
│  │  🏆 অর্জিত ব্যাজ:                                  │   │
│  │                                                 │   │
│  │  ┌────┐  ┌────┐  ┌────┐  ┌────┐  ┌────┐      │   │
│  │  │ 📖 │  │ ⭐ │  │ 🎯 │  │ 🔒 │  │ 🔒 │      │   │
│  │  │    │  │    │  │    │  │    │  │    │      │   │
│  │  └────┘  └────┘  └────┘  └────┘  └────┘      │   │
│  │  Story   Quiz   Perfect  (locked) (locked)    │   │
│  │  Lover   Master  Score                        │   │
│  │                                                 │   │
│  │  Badges: 48dp × 48dp, horizontal scroll        │   │
│  │  Earned: Full color                            │   │
│  │  Locked: Grayscale + 🔒 overlay               │   │
│  │                                                 │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                                                 │   │
│  │  📚 গল্পের তালিকা:                                  │   │
│  │                                                 │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│  ╔═══════════════════════════════════════════════════╗ │
│  ║                                                   ║ │
│  ║  ✅  গরুর গল্প                                    ║ │
│  ║      ━━━━━━━━━━  100%  •  Quiz: 3/3            ║ │
│  ║                                                   ║ │
│  ║  ───────────────────────────────────────────    ║ │
│  ║                                                   ║ │
│  ║  ✅  বিড়াল ও মাছ                                  ║ │
│  ║      ━━━━━━━━━━  100%  •  Quiz: 2/3            ║ │
│  ║                                                   ║ │
│  ║  ───────────────────────────────────────────    ║ │
│  ║                                                   ║ │
│  ║  🔄  যানবাহনের খেলা                              ║ │
│  ║      ━━━━━━░░░░   60%  •  Quiz: --             ║ │
│  ║      [ চালিয়ে যান ]                              ║ │
│  ║                                                   ║ │
│  ║  ───────────────────────────────────────────    ║ │
│  ║                                                   ║ │
│  ║  ⭕  ফলের বাগান                                  ║ │
│  ║      ━░░░░░░░░░    0%  •  Not started          ║ │
│  ║      [ শুরু করুন ]                                 ║ │
│  ║                                                   ║ │
│  ╚═══════════════════════════════════════════════════╝ │
│                                                         │
│  Story list items:                                      │
│  ├── Height: 80dp                                      │
│  ├── Status icons: ✅ complete, 🔄 progress, ⭕ new    │
│  ├── Progress bar: 100dp × 4dp                         │
│  ├── Quiz score: Caption/12sp                          │
│  ├── Continue/Start button: Shown if not 100%          │
│  └── Divider: 1dp #E0E0E0                             │
│                                                         │
│                    [24dp bottom]                        │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

---

## 📋 Screen Summary - Story Screens (29-33)

| # | Screen Name | Purpose | Navigation |
|---|-------------|---------|------------|
| 29 | Story Library | Browse all stories | From main board |
| 30 | Story Reader | Read story pages | Tap story card |
| 31 | Story Complete | Celebration + stats | After last page |
| 32 | Story Quiz | Comprehension check | After celebration |
| 33 | Story Progress | Track all stories | From library header |

---

## 🔗 Story Flow Navigation

```
Main Board
    │
    │ Tap "Stories" category
    ▼
┌────────────────┐
│ Story Library  │◄───────────────────────────┐
│  (Screen 29)   │                            │
└───────┬────────┘                            │
        │                                     │
        │ Tap story card                      │
        ▼                                     │
┌────────────────┐                            │
│ Story Reader   │                            │
│  (Screen 30)   │                            │
│  [Page 1→5]    │                            │
└───────┬────────┘                            │
        │                                     │
        │ Complete last page                  │
        ▼                                     │
┌────────────────┐                            │
│Story Complete  │                            │
│  (Screen 31)   │                            │
└───────┬────────┘                            │
        │                                     │
        │ Auto-start or "Take Quiz"           │
        ▼                                     │
┌────────────────┐                            │
│  Story Quiz    │                            │
│  (Screen 32)   │                            │
│  [Q 1→3]       │                            │
└───────┬────────┘                            │
        │                                     │
        │ Complete quiz                       │
        │                                     │
        ├─────→ "Next Story" ─────────────────┤
        │                                     │
        └─────→ "Go Home" ────────────────────┘
```

---

## 🎨 Story Content Design Guidelines

### Image Requirements
```
STORY ILLUSTRATIONS:
├── Style: Watercolor, soft edges, warm tones
├── Resolution: 1080×720px minimum
├── Format: WebP (compressed)
├── File size: <100KB per image
├── Characters: Consistent across all pages
├── Background: Simple, non-distracting
└── Interactive elements: Clear tap targets

COVER IMAGES:
├── Aspect ratio: 4:3
├── Size: 480×360px
├── Key character(s) prominently featured
└── Title overlay position: Bottom 20%
```

### Text Guidelines
```
STORY TEXT:
├── Simple sentences (5-10 words)
├── Large, clear Bangla text
├── One concept per page
├── Repetitive structure aids learning
├── Tappable vocabulary words highlighted
└── Optional English translation (smaller)

QUIZ QUESTIONS:
├── Direct, simple questions
├── 4 answer options maximum
├── Visual cues (emojis) for each option
├── One clearly correct answer
└── Relate directly to story content
```
