# 📱 Phase 1 MVP - Foundation Screens (1-7)
## Touch & Learn Board - Premium UI/UX Wireframes

**Design System Version:** 1.0  
**Target:** Bangladesh Children Ages 1-5  
**Device Focus:** Low-end Android (2GB RAM, 5-6" screens)

---

## 🎨 Design Tokens (Apply to All Screens)

```
COLORS:
├── Background Primary:    #FAF6F0 (Warm Cream)
├── Background Secondary:  #FFFFFF (Pure White)
├── Text Primary:          #1B5E5E (Dark Teal)
├── Text Secondary:        #5D7A7A (Muted Teal)
├── Accent Green:          #7FBA96 (Soft Leaf)
├── Accent Blue:           #87CEEB (Sky Blue)
├── Accent Yellow:         #FFD54F (Mango Yellow)
├── Accent Red:            #C75146 (Clay Red)
├── Shadow:                #1B5E5E15 (15% opacity)
└── Overlay:               #00000080 (50% black)

TYPOGRAPHY:
├── Display:     NotoSansBengali-Bold     48sp
├── Headline:    NotoSansBengali-SemiBold 32sp
├── Title:       NotoSansBengali-Medium   24sp
├── Body:        NotoSansBengali-Regular  18sp
├── Caption:     NotoSansBengali-Regular  14sp
└── Button:      NotoSansBengali-SemiBold 20sp

SPACING:
├── xs: 4dp    ├── sm: 8dp    ├── md: 16dp
├── lg: 24dp   ├── xl: 32dp   └── xxl: 48dp

RADIUS:
├── Small:  8dp   (buttons, inputs)
├── Medium: 16dp  (cards, dialogs)
├── Large:  24dp  (tiles, containers)
└── Full:   999dp (circular elements)

ELEVATION:
├── Level 1: 0 4dp 8dp shadow (tiles)
├── Level 2: 0 8dp 16dp shadow (dialogs)
└── Level 3: 0 12dp 24dp shadow (bottom sheets)

TOUCH TARGETS:
├── Minimum:  44dp × 44dp (icons, small buttons)
├── Standard: 56dp × 56dp (primary buttons)
├── Large:    72dp × 72dp (main tiles - children)
└── XL:       88dp × 88dp (accessibility mode)

BOTTOM NAVIGATION (5-Tab Architecture):
├── Height: 64dp (including safe area)
├── Background: #FFFFFF
├── Shadow: 0 -2dp 8dp #00000010
├── Tab item: 56dp width, 48dp touchable
├── Icon size: 24dp
├── Label: Caption/12sp
├── Active color: #7FBA96
├── Inactive color: #5D7A7A
│
├── Tab 0: হোম (Home) 🏠
│   └── Discovery hub, personalized content
├── Tab 1: শেখা (Learn) 📚
│   └── ALL learning content (categories, alphabet, stories, culture)
├── Tab 2: খেলা (Play) 🎮
│   └── ALL games (Phase 1: "Coming Soon")
├── Tab 3: পছন্দ (Favorites) ❤️
│   └── Saved items across all types
└── Tab 4: প্রোফাইল (Profile) 👤
    └── Settings + Progress (Math Gate protected)
```

### 📱 Bottom Navigation Component (Apply to All Tab Screens)

```
┌─────────────────────────────────────────────────────────────────────┐
│                         BOTTOM NAVIGATION                            │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│    🏠        │      📚       │      🎮      │     ❤️     │     👤     │
│    হোম       │     শেখা      │     খেলা     │    পছন্দ    │  প্রোফাইল   │
│   ────       │              │              │            │            │
│  (active)    │              │              │            │            │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘

Specs:
├── Container: Full width × 64dp
├── Background: #FFFFFF
├── Top border: 1dp #E0E0E0
├── Shadow: 0 -2dp 8dp #00000010
├── Padding bottom: Device safe area
│
Tab Items:
├── Width: Screen width / 5
├── Icon: 24dp, centered
├── Label: Caption/12sp, 4dp below icon
├── Touch target: Full tab width × 48dp
│
States:
├── Active: Icon #7FBA96, Label #7FBA96, Bold
├── Inactive: Icon #5D7A7A, Label #5D7A7A
├── Pressed: Scale 0.95, ripple effect
└── Badge (optional): 8dp red dot for notifications
```

---

## Screen 1: Language Selection (First Launch Only)

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│ Status Bar (System)                            24dp     │
├─────────────────────────────────────────────────────────┤
│                                                         │
│                    [72dp margin top]                    │
│                                                         │
│                 ┌───────────────────┐                   │
│                 │    🐄💛 Mascot    │                   │
│                 │    120dp × 120dp  │                   │
│                 │   bounce anim     │                   │
│                 └───────────────────┘                   │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│              ╔═══════════════════════╗                  │
│              ║   📚 শেখার বোর্ড      ║  Display/48sp    │
│              ║  Touch & Learn Board  ║  Title/20sp     │
│              ╚═══════════════════════╝                  │
│                                                         │
│                    [48dp spacing]                       │
│                                                         │
│           ┌─────────────────────────────┐               │
│           │  পিতা-মাতার ইন্টারফেস ভাষা   │  Body/18sp    │
│           │  Choose Parent Language     │  Caption/14sp │
│           └─────────────────────────────┘               │
│                                                         │
│                    [32dp spacing]                       │
│                                                         │
│    ╔═══════════════════════════════════════════════╗    │
│    ║                                               ║    │
│    ║              বাংলা                            ║    │
│    ║             Bengali                           ║    │
│    ║                                               ║    │
│    ╚═══════════════════════════════════════════════╝    │
│         Button: 280dp × 72dp, radius 16dp               │
│         Background: #7FBA96, Text: #FFFFFF              │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│    ┌───────────────────────────────────────────────┐    │
│    │                                               │    │
│    │              English                          │    │
│    │                                               │    │
│    └───────────────────────────────────────────────┘    │
│         Button: 280dp × 72dp, radius 16dp               │
│         Background: #FFFFFF, Border: #1B5E5E 2dp        │
│                                                         │
│                    [32dp spacing]                       │
│                                                         │
│    ┌─────────────────────────────────────────────────┐  │
│    │  ⚠️ শিশুর কন্টেন্ট সবসময় বাংলায় থাকবে        │  │
│    │     Child content always in Bangla             │  │
│    └─────────────────────────────────────────────────┘  │
│         Info box: Background #FFD54F20, radius 12dp     │
│         Icon: 20dp, Text: Caption/14sp                  │
│                                                         │
│                    [flex spacer]                        │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### 🎬 Animations

| Element | Animation | Duration | Easing |
|---------|-----------|----------|--------|
| Mascot | Gentle bounce (translateY -8dp) | 2000ms | ease-in-out, infinite |
| Logo Text | Fade in + slide up | 600ms | cubic-bezier(0.4, 0, 0.2, 1) |
| Bangla Button | Scale in (0.9 → 1.0) | 400ms | spring(damping: 0.6) |
| English Button | Scale in (0.9 → 1.0) | 400ms, 100ms delay | spring(damping: 0.6) |
| Info Box | Fade in | 500ms, 200ms delay | ease-out |

### 👆 Interactions

| Action | Feedback | Result |
|--------|----------|--------|
| Tap Bangla Button | Ripple + scale 0.95 | Save 'bn' → Navigate to Splash |
| Tap English Button | Ripple + scale 0.95 | Save 'en' → Navigate to Splash |
| Long Press Button | Subtle vibration 50ms | None |

### 📱 Responsive Behavior

| Screen Width | Mascot Size | Button Width | Font Scale |
|--------------|-------------|--------------|------------|
| < 360dp | 100dp | 240dp | 0.9x |
| 360-400dp | 120dp | 280dp | 1.0x |
| > 400dp | 140dp | 320dp | 1.1x |

---

## Screen 2: Splash Screen

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│                                                         │
│                                                         │
│                                                         │
│                    [flex: 1]                            │
│                                                         │
│                                                         │
│                 ┌───────────────────┐                   │
│                 │                   │                   │
│                 │    🐄💛 Mascot    │                   │
│                 │    160dp × 160dp  │                   │
│                 │                   │                   │
│                 │   pulse + glow    │                   │
│                 │                   │                   │
│                 └───────────────────┘                   │
│                    Center of screen                     │
│                                                         │
│                    [40dp spacing]                       │
│                                                         │
│                 ┌───────────────────┐                   │
│                 │   শেখার বোর্ড     │  Headline/32sp    │
│                 │                   │                   │
│                 └───────────────────┘                   │
│                    Fade in/out text                     │
│                                                         │
│                    [flex: 1]                            │
│                                                         │
│                                                         │
│                    [80dp from bottom]                   │
│                                                         │
│                     ● ● ● ● ●                           │
│                   Loading dots                          │
│                   8dp each, 12dp gap                    │
│                   Color: #1B5E5E                        │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│                  ━━━━━━━━━━░░░░░                        │
│                  Progress bar (optional)                │
│                  200dp × 4dp, radius 2dp                │
│                                                         │
│                    [48dp margin bottom]                 │
│                                                         │
└─────────────────────────────────────────────────────────┘

Background: Solid #FAF6F0 (no gradients for performance)
```

### 🎬 Animations

| Element | Animation | Duration | Easing |
|---------|-----------|----------|--------|
| Mascot | Pulse scale (1.0 → 1.05 → 1.0) | 1500ms | ease-in-out, infinite |
| Mascot Glow | Shadow opacity (0.2 → 0.4 → 0.2) | 1500ms | sync with pulse |
| Loading Dots | Sequential fade (opacity 0.3 → 1.0) | 600ms per dot | ease-in-out |
| Progress Bar | Width 0% → 100% | 2000ms | linear |
| Screen Exit | Fade out + scale up (1.0 → 1.1) | 300ms | ease-in |

### ⚙️ Background Tasks

```
During Splash:
├── Verify audio files exist (25 files)
├── Check image assets integrity
├── Load SharedPreferences/Hive
├── Initialize audio player
└── Pre-cache first 6 tile images

Minimum Duration: 2 seconds
Maximum Duration: 5 seconds (timeout → error screen)
```

### 🔀 Navigation Logic

```
IF all assets verified:
  IF first launch:
    → Welcome Screen (Screen 3)
  ELSE IF tutorial not seen:
    → Main Board + Tutorial Overlay (Screen 5 + 4)
  ELSE:
    → Main Board (Screen 5)
ELSE:
  → Critical Error Screen (Screen 7)
```

---

## Screen 3: Welcome Screen (One-Time)

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│ Status Bar                                              │
├─────────────────────────────────────────────────────────┤
│                                                         │
│                    [48dp margin top]                    │
│                                                         │
│    ╔═══════════════════════════════════════════════╗    │
│    ║       স্বাগতম!                                ║    │
│    ║       Welcome!                                ║    │
│    ╚═══════════════════════════════════════════════╝    │
│         Headline/32sp + Title/20sp                      │
│         Color: #1B5E5E                                  │
│                                                         │
│                    [32dp spacing]                       │
│                                                         │
│    ┌─────────────────────────────────────────────────┐  │
│    │                                                 │  │
│    │  ┌──────┐  সম্পূর্ণ অফলাইন                      │  │
│    │  │  ✅  │  100% Offline - No Internet Needed   │  │
│    │  │ 32dp │                                       │  │
│    │  └──────┘  Icon: #7FBA96                        │  │
│    │            Text: Body/18sp + Caption/14sp       │  │
│    │                                                 │  │
│    └─────────────────────────────────────────────────┘  │
│         Card: #FFFFFF, shadow level 1, radius 16dp      │
│         Padding: 20dp, Height: 80dp                     │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│    ┌─────────────────────────────────────────────────┐  │
│    │                                                 │  │
│    │  ┌──────┐  কোনো বিজ্ঞাপন নেই                   │  │
│    │  │  ✅  │  No Ads or Tracking                  │  │
│    │  └──────┘                                       │  │
│    │                                                 │  │
│    └─────────────────────────────────────────────────┘  │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│    ┌─────────────────────────────────────────────────┐  │
│    │                                                 │  │
│    │  ┌──────┐  বাংলাদেশী শিশুদের জন্য               │  │
│    │  │  ✅  │  Made for Bangladeshi Children       │  │
│    │  └──────┘                                       │  │
│    │                                                 │  │
│    └─────────────────────────────────────────────────┘  │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│    ┌─────────────────────────────────────────────────┐  │
│    │                                                 │  │
│    │  ┌──────┐  নিরাপদ ও শিক্ষামূলক ডিজাইন           │  │
│    │  │  ✅  │  Safe & Non-Addictive Design         │  │
│    │  └──────┘                                       │  │
│    │                                                 │  │
│    └─────────────────────────────────────────────────┘  │
│                                                         │
│                    [flex spacer]                        │
│                                                         │
│    ╔═══════════════════════════════════════════════╗    │
│    ║                                               ║    │
│    ║        শুরু করুন                              ║    │
│    ║        Let's Start                            ║    │
│    ║                                               ║    │
│    ╚═══════════════════════════════════════════════╝    │
│         Button: 70% screen width, 64dp height           │
│         Background: #7FBA96, radius 16dp                │
│         Shadow: level 1                                 │
│                                                         │
│                    [32dp margin bottom]                 │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### 🎬 Animations (Staggered Entry)

| Element | Animation | Delay | Duration |
|---------|-----------|-------|----------|
| Welcome Text | Fade in + slide down 20dp | 0ms | 500ms |
| Card 1 (Offline) | Slide in from left + fade | 100ms | 400ms |
| Card 2 (No Ads) | Slide in from left + fade | 200ms | 400ms |
| Card 3 (Bangladesh) | Slide in from left + fade | 300ms | 400ms |
| Card 4 (Safe) | Slide in from left + fade | 400ms | 400ms |
| Start Button | Scale up (0.8 → 1.0) + fade | 600ms | 400ms |

### 👆 Micro-Interactions

| Action | Visual Feedback | Haptic |
|--------|-----------------|--------|
| Tap Start Button | Ripple from center, scale 0.96 | Light 30ms |
| Button Press Hold | Darken 10%, scale 0.94 | Medium 50ms |
| Card Hover (tablet) | Elevation increase | None |

---

## Screen 4: Tutorial Overlay (3-Step Progressive)

### 📐 Layout - Step 1: Tap Gesture

```
┌─────────────────────────────────────────────────────────┐
│                                                         │
│  ┌───────────────────────────────────────────────────┐  │
│  │                                                   │  │
│  │            SEMI-TRANSPARENT OVERLAY               │  │
│  │            Background: #000000 @ 70%              │  │
│  │                                                   │  │
│  │                                                   │  │
│  │                    ✋                              │  │
│  │               80dp × 80dp                         │  │
│  │          Animated hand icon                       │  │
│  │      (bouncing down toward tile)                  │  │
│  │                    │                              │  │
│  │                    │  animation path              │  │
│  │                    ▼                              │  │
│  │              ╔═══════════╗                        │  │
│  │              ║           ║                        │  │
│  │              ║    🐄     ║  HIGHLIGHTED TILE      │  │
│  │              ║   গরু     ║  Glow: #7FBA96 @ 40%   │  │
│  │              ║           ║  Pulse animation       │  │
│  │              ╚═══════════╝                        │  │
│  │                                                   │  │
│  │                                                   │  │
│  │           ┌─────────────────────┐                 │  │
│  │           │   ছবিতে টিপুন       │                 │  │
│  │           │                     │                 │  │
│  │           └─────────────────────┘                 │  │
│  │           Title/24sp, Color: #FFFFFF              │  │
│  │                                                   │  │
│  │                                                   │  │
│  │                                                   │  │
│  │                ● ○ ○                              │  │
│  │           Step indicator dots                     │  │
│  │           12dp, 8dp gap                          │  │
│  │           Active: #FFFFFF                        │  │
│  │           Inactive: #FFFFFF50                    │  │
│  │                                                   │  │
│  │                                                   │  │
│  │      ┌────────────────────────────────┐          │  │
│  │      │  এড়িয়ে যান                    │          │  │
│  │      └────────────────────────────────┘          │  │
│  │      Text button, appears after 3 seconds        │  │
│  │      Caption/14sp, #FFFFFF80                     │  │
│  │      (Parent action - uses parent lang pref)     │  │
│  │                                                   │  │
│  └───────────────────────────────────────────────────┘  │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### 📐 Layout - Step 2: Swipe Gesture

```
┌─────────────────────────────────────────────────────────┐
│  ┌───────────────────────────────────────────────────┐  │
│  │            SEMI-TRANSPARENT OVERLAY               │  │
│  │                                                   │  │
│  │                                                   │  │
│  │            ✋ ─────────→                          │  │
│  │       Hand swiping animation                      │  │
│  │       translateX: -40dp → +40dp                   │  │
│  │       Duration: 1200ms, loop                      │  │
│  │                                                   │  │
│  │                                                   │  │
│  │         ┌───────┐    ┌ ─ ─ ─ ┐                   │  │
│  │         │  🐱   │ →    🐟     │  PEEK NEXT TILE  │  │
│  │         │ বিড়াল │    │ মাছ   │  Opacity: 50%    │  │
│  │         └───────┘    └ ─ ─ ─ ┘                   │  │
│  │                                                   │  │
│  │                                                   │  │
│  │           ┌─────────────────────┐                 │  │
│  │           │  পাশে সোয়াইপ করো   │                 │  │
│  │           │                     │                 │  │
│  │           └─────────────────────┘                 │  │
│  │                                                   │  │
│  │                ○ ● ○                              │  │
│  │                                                   │  │
│  │      ┌────────────────────────────────┐          │  │
│  │      │  এড়িয়ে যান                    │          │  │
│  │      └────────────────────────────────┘          │  │
│  │                                                   │  │
│  └───────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────┘
```

### 📐 Layout - Step 3: Exit Navigation

```
┌─────────────────────────────────────────────────────────┐
│  ┌───────────────────────────────────────────────────┐  │
│  │            SEMI-TRANSPARENT OVERLAY               │  │
│  │                                                   │  │
│  │     ╔═════╗  ← HIGHLIGHTED with glow              │  │
│  │     ║  ✕  ║     Glow: #FFFFFF @ 50%               │  │
│  │     ╚═════╝     Pulse animation                   │  │
│  │         ↑                                         │  │
│  │         │                                         │  │
│  │         ✋  Hand pointing up                       │  │
│  │                                                   │  │
│  │                                                   │  │
│  │                                                   │  │
│  │           ┌─────────────────────┐                 │  │
│  │           │ বের হতে এখানে টিপুন │                 │  │
│  │           │                     │                 │  │
│  │           └─────────────────────┘                 │  │
│  │                                                   │  │
│  │                ○ ○ ●                              │  │
│  │                                                   │  │
│  │                                                   │  │
│  │    ╔═══════════════════════════════════════╗     │  │
│  │    ║                                       ║     │  │
│  │    ║          বুঝেছি!                     ║     │  │
│  │    ║                                       ║     │  │
│  │    ╚═══════════════════════════════════════╝     │  │
│  │    Button: 200dp × 56dp, #7FBA96                  │  │
│  │                                                   │  │
│  └───────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────┘
```

### 🎬 Tutorial Animations

| Element | Animation | Duration | Notes |
|---------|-----------|----------|-------|
| Hand (Step 1) | Bounce down 40dp | 800ms loop | Ease-out |
| Hand (Step 2) | Slide left-right 80dp | 1200ms loop | Ease-in-out |
| Hand (Step 3) | Bounce up 20dp | 600ms loop | Ease-out |
| Highlighted Tile | Glow pulse | 1500ms loop | Opacity 0.3→0.5 |
| Step Dots | Fade transition | 300ms | On step change |
| Skip Text | Fade in | 500ms | After 3s delay |

### 👆 Progression Logic

```
Step 1 → Step 2:
  ├── User taps the highlighted tile, OR
  └── Auto-advance after 5 seconds

Step 2 → Step 3:
  ├── User performs swipe gesture, OR
  └── Auto-advance after 5 seconds

Step 3 → Complete:
  ├── User taps "Got it" button, OR
  ├── User taps X button, OR
  └── Auto-advance after 5 seconds

Any Step → Skip:
  └── User taps "Skip Tutorial"
```

---

## Screen 5: Home Tab - Discovery Hub (🏠 হোম)

> **NEW 5-TAB ARCHITECTURE:** This screen is now Tab 0 of the 5-tab bottom navigation.
> The Home Tab serves as a **personalized discovery hub**, NOT a content dump.
> All learning content has moved to the **শেখা (Learn) Tab** (Screen 5A).

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│ Status Bar (transparent, dark icons)                    │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                                                 │   │
│  │  সুপ্রভাত, সোনা! ☀️                       ⚙️   │   │
│  │  Headline/24sp                          24dp   │   │
│  │  (Time-based greeting)             5s press   │   │
│  │                                                 │   │
│  └─────────────────────────────────────────────────┘   │
│  Top bar: 64dp height, padding 16dp                     │
│  Greeting changes: সুপ্রভাত/শুভ দুপুর/শুভ সন্ধ্যা          │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│  ╔═══════════════════════════════════════════════════╗ │
│  ║  🔄 যেখানে ছিলে (Continue Where You Left Off)     ║ │
│  ║                                                   ║ │
│  ║  ┌─────────────────────────────────────────────┐ ║ │
│  ║  │                                             │ ║ │
│  ║  │  🐱 বিড়াল শিখছিলে                           │ ║ │
│  ║  │  প্রাণী • ৩/৫ শেষ                          │ ║ │
│  ║  │                                             │ ║ │
│  ║  │  ━━━━━━━━━━━░░░░░░  60%                     │ ║ │
│  ║  │                                             │ ║ │
│  ║  │  [▶️ চালিয়ে যাও]                           │ ║ │
│  ║  │                                             │ ║ │
│  ║  └─────────────────────────────────────────────┘ ║ │
│  ╚═══════════════════════════════════════════════════╝ │
│  Continue card: 16dp padding, #FFFFFF bg, radius 16dp   │
│  Shadow: level 1, shows last learning session           │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│  📌 দ্রুত প্রবেশ (Quick Access)                          │
│  Caption/14sp, #5D7A7A                                  │
│                                                         │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐  │
│  │   📚     │ │   🎮     │ │   📖     │ │  ক খ     │  │
│  │  শেখা   │ │  খেলা   │ │  গল্প   │ │ বর্ণমালা │  │
│  │         │ │ শীঘ্রই   │ │ শীঘ্রই   │ │ শীঘ্রই   │  │
│  └──────────┘ └──────────┘ └──────────┘ └──────────┘  │
│  Quick tiles: 72dp × 72dp, radius 16dp                  │
│  BG: #7FBA96, #FFD54F, #87CEEB, #C75146                │
│  "শীঘ্রই" badge for Phase 2/3 content                    │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│  ⭐ জনপ্রিয় শব্দ (Popular Words)                        │
│  Caption/14sp, #5D7A7A                                  │
│                                                         │
│  ┌───────────────────────────────────────────────────┐ │
│  │                                                   │ │
│  │  ┌─────┐ ┌─────┐ ┌─────┐ ┌─────┐ ┌─────┐  →    │ │
│  │  │ 🐄  │ │ 🥭  │ │ 🚜  │ │ 🐱  │ │ 🍌  │       │ │
│  │  │গরু  │ │ আম  │ │রিকশা│ │বিড়াল│ │কলা  │       │ │
│  │  └─────┘ └─────┘ └─────┘ └─────┘ └─────┘       │ │
│  │                                                   │ │
│  └───────────────────────────────────────────────────┘ │
│  Horizontal scroll: items based on child's tap history  │
│  Item size: 64dp × 80dp, tap opens detail view          │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│  🎆 আসন্ন উৎসব (Upcoming Festival - Phase 3)            │
│  [Only visible when festival within 2 weeks]            │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │  🎉 পহেলা বৈশাখ আসছে! • ১৫ দিন বাকি           │   │
│  │  [জানতে চাই]                     🔒 শীঘ্রই     │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
├─────────────────────────────────────────────────────────┤
│                     BOTTOM NAVIGATION                   │
│  ┌──────────┬──────────┬──────────┬──────────┬───────┐ │
│  │   🏠     │    📚    │    🎮    │    ❤️    │   👤  │ │
│  │   হোম   │   শেখা  │   খেলা  │  পছন্দ  │প্রোফাইল│ │
│  │   ───   │          │          │          │       │ │
│  │ (active)│          │          │          │       │ │
│  └──────────┴──────────┴──────────┴──────────┴───────┘ │
│  Height: 64dp + safe area                               │
└─────────────────────────────────────────────────────────┘

Background: #FAF6F0 (Warm Cream)
```

### 🕐 Time-Based Greeting Logic

```dart
String getGreeting() {
  final hour = DateTime.now().hour;
  if (hour >= 5 && hour < 12) return 'সুপ্রভাত, সোনা! ☀️';
  if (hour >= 12 && hour < 17) return 'শুভ দুপুর! 🌤️';
  if (hour >= 17 && hour < 21) return 'শুভ সন্ধ্যা! 🌙';
  return 'শুভ রাত্রি! ✨';
}
```

### 🎬 Home Tab Animations

| Element | Animation | Duration | Trigger |
|---------|-----------|----------|---------|
| Greeting | Fade in | 400ms | On tab switch |
| Continue Card | Slide up + fade | 500ms | On tab switch |
| Quick Access | Stagger scale in | 100ms each | On first load |
| Popular Items | Fade in + slide | 400ms | After cards |

### 👆 Interactions

| Element | Action | Result |
|---------|--------|--------|
| Continue Card | Tap | Resume last learning session |
| Quick Access: শেখা | Tap | Switch to Learn tab |
| Quick Access: খেলা | Tap | Switch to Play tab |
| Settings ⚙️ | 5s Long Press | Open Math Gate → Settings |

---

## Screen 5A: Learn Tab - All Learning Content (📚 শেখা)

> **NEW:** This is Tab 1 - contains ALL learning content organized by sections.

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│ Status Bar                                              │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │  📚 শেখা                              🔍 Search│   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│  ═══ প্রধান বিষয় (Core Categories) ═══════════════════ │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │   ╔════════════╗  ╔════════════╗  ╔════════════╗│   │
│  │   ║     🐄     ║  ║     🥭     ║  ║     🚜     ║│   │
│  │   ║   প্রাণী   ║  ║     ফল     ║  ║  যানবাহন   ║│   │
│  │   ║   ১২টি    ║  ║    ১২টি   ║  ║    ১২টি   ║│   │
│  │   ╚════════════╝  ╚════════════╝  ╚════════════╝│   │
│  │   BG: #7FBA96     BG: #87CEEB     BG: #FFD54F   │   │
│  │                                                 │   │
│  │   ╔════════════╗  ╔════════════╗  ╔════════════╗│   │
│  │   ║     🎨     ║  ║     🔢     ║  ║     👋     ║│   │
│  │   ║     রং     ║  ║   সংখ্যা   ║  ║    শরীর    ║│   │
│  │   ║   ১০টি    ║  ║    ১০টি   ║  ║    ১২টি   ║│   │
│  │   ╚════════════╝  ╚════════════╝  ╚════════════╝│   │
│  │   BG: #C75146     BG: #87CEEB     BG: #7FBA96   │   │
│  └─────────────────────────────────────────────────┘   │
│  Category grid: 3 columns, 100dp tiles, 12dp gap        │
│                                                         │
│  ═══ বর্ণমালা ও সংখ্যা (Phase 3) ══════════════════════ │
│                                                         │
│  ┌───────────────┐ ┌───────────────┐ ┌───────────────┐ │
│  │  ক খ গ ঘ    │ │  ১ ২ ৩ ৪    │ │   🔷 🔶      │ │
│  │   বর্ণমালা   │ │    সংখ্যা    │ │    আকৃতি    │ │
│  │ 🔒 শীঘ্রই    │ │ 🔒 শীঘ্রই    │ │ 🔒 শীঘ্রই    │ │
│  └───────────────┘ └───────────────┘ └───────────────┘ │
│                                                         │
│  ═══ গল্প (Stories - Phase 2) ═════════════════════════ │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │  ┌────┐ ┌────┐ ┌────┐ ┌────┐   সব দেখুন →    │   │
│  │  │📕🔒│ │📗🔒│ │📘🔒│ │📙🔒│                  │   │
│  │  └────┘ └────┘ └────┘ └────┘                  │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│  ═══ সংস্কৃতি (Culture - Phase 3) ═════════════════════ │
│                                                         │
│  ┌─────────┐ ┌─────────┐ ┌─────────┐                   │
│  │🎆 উৎসব │ │🌳 ঋতু  │ │🍛 খাবার│                   │
│  │🔒 শীঘ্রই │ │🔒 শীঘ্রই │ │🔒 শীঘ্রই │                   │
│  └─────────┘ └─────────┘ └─────────┘                   │
│                                                         │
├─────────────────────────────────────────────────────────┤
│  ┌──────────┬──────────┬──────────┬──────────┬───────┐ │
│  │   🏠     │    📚    │    🎮    │    ❤️    │   👤  │ │
│  │   হোম   │   শেখা  │   খেলা  │  পছন্দ  │প্রোফাইল│ │
│  │          │   ───   │          │          │       │ │
│  └──────────┴──────────┴──────────┴──────────┴───────┘ │
└─────────────────────────────────────────────────────────┘
```

---

## Screen 5B: Play Tab - Game Center (🎮 খেলা)

> **Phase 1:** Shows "Coming Soon" state. **Phase 2:** Full game center.

### 📐 Layout - Phase 1 (Coming Soon)

```
┌─────────────────────────────────────────────────────────┐
│ Status Bar                                              │
├─────────────────────────────────────────────────────────┤
│  ┌─────────────────────────────────────────────────┐   │
│  │  🎮 খেলা                                        │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│                    [flex: 1]                            │
│                                                         │
│              ┌─────────────────────┐                   │
│              │     🎮🎯🧩         │                   │
│              │     120dp           │                   │
│              │   (animated)        │                   │
│              └─────────────────────┘                   │
│                                                         │
│              ╔═══════════════════════╗                  │
│              ║  শীঘ্রই আসছে! 🚀      ║                  │
│              ║  Coming Soon!         ║                  │
│              ╚═══════════════════════╝                  │
│                                                         │
│              ┌─────────────────────┐                   │
│              │  মজার খেলা তৈরি     │                   │
│              │  হচ্ছে তোমার জন্য!  │                   │
│              └─────────────────────┘                   │
│                                                         │
│                    [flex: 1]                            │
│                                                         │
├─────────────────────────────────────────────────────────┤
│  ┌──────────┬──────────┬──────────┬──────────┬───────┐ │
│  │   🏠     │    📚    │    🎮    │    ❤️    │   👤  │ │
│  │   হোম   │   শেখা  │   খেলা  │  পছন্দ  │প্রোফাইল│ │
│  │          │          │   ───   │          │       │ │
│  └──────────┴──────────┴──────────┴──────────┴───────┘ │
└─────────────────────────────────────────────────────────┘
```

---

## Screen 5C: Favorites Tab (❤️ পছন্দ)

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│ Status Bar                                              │
├─────────────────────────────────────────────────────────┤
│  ┌─────────────────────────────────────────────────┐   │
│  │  ❤️ পছন্দ                                       │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│  Filter: [সব] [শব্দ] [গল্প] [খেলা]                      │
│                                                         │
│  ╔═══════════════════════════════════════════════════╗ │
│  ║                 EMPTY STATE                       ║ │
│  ║              ┌─────────────────┐                 ║ │
│  ║              │      💝        │                 ║ │
│  ║              └─────────────────┘                 ║ │
│  ║          এখনো কিছু পছন্দ করোনি!                 ║ │
│  ║          শব্দ শিখতে গিয়ে ❤️ বাটনে              ║ │
│  ║          টিপলে এখানে জমা হবে!                   ║ │
│  ║    ╔═════════════════════════════════╗          ║ │
│  ║    ║     শেখা শুরু করো              ║          ║ │
│  ║    ╚═════════════════════════════════╝          ║ │
│  ╚═══════════════════════════════════════════════════╝ │
│                                                         │
├─────────────────────────────────────────────────────────┤
│  ┌──────────┬──────────┬──────────┬──────────┬───────┐ │
│  │   🏠     │    📚    │    🎮    │    ❤️    │   👤  │ │
│  │   হোম   │   শেখা  │   খেলা  │  পছন্দ  │প্রোফাইল│ │
│  │          │          │          │   ───   │       │ │
│  └──────────┴──────────┴──────────┴──────────┴───────┘ │
└─────────────────────────────────────────────────────────┘
```

---

## Screen 5D: Profile Tab (👤 প্রোফাইল)

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│ Status Bar                                              │
├─────────────────────────────────────────────────────────┤
│  ┌─────────────────────────────────────────────────┐   │
│  │  👤 প্রোফাইল                                     │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│  ╔═══════════════════════════════════════════════════╗ │
│  ║  👶 বর্তমান প্রোফাইল                              ║ │
│  ║  ┌─────────────────────────────────────────────┐ ║ │
│  ║  │  🧒 রাফি                          [বদলান] │ ║ │
│  ║  │  ৩ বছর                                     │ ║ │
│  ║  └─────────────────────────────────────────────┘ ║ │
│  ╚═══════════════════════════════════════════════════╝ │
│                                                         │
│  ═══ অগ্রগতি (Progress) ════════════════════════════ │
│  ┌─────────────────────────────────────────────────┐   │
│  │  📊 এই সপ্তাহে                                   │   │
│  │  ⭐ ২৫টি নতুন শব্দ শিখেছ!                       │   │
│  │  🎮 ১২টি খেলা খেলেছ                             │   │
│  │  ⏱️ মোট ৪৫ মিনিট                                │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│  ═══ সেটিংস (Settings) ═════════════════════════════ │
│  ┌─────────────────────────────────────────────────┐   │
│  │  🔒 পিতা-মাতার এলাকা                       →    │   │
│  └─────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────┐   │
│  │  ℹ️ সম্পর্কে                                →    │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
├─────────────────────────────────────────────────────────┤
│  ┌──────────┬──────────┬──────────┬──────────┬───────┐ │
│  │   🏠     │    📚    │    🎮    │    ❤️    │   👤  │ │
│  │   হোম   │   শেখা  │   খেলা  │  পছন্দ  │প্রোফাইল│ │
│  │          │          │          │          │  ───  │ │
│  └──────────┴──────────┴──────────┴──────────┴───────┘ │
└─────────────────────────────────────────────────────────┘
```

---

### 🎨 Category Tile Component (Used in Learn Tab)

```
╔═══════════════════════════════════════════════════════════╗
║                    CATEGORY TILE                          ║
╠═══════════════════════════════════════════════════════════╣
║   Size: 100dp × 100dp (3-column grid)                     ║
║   Corner Radius: 20dp                                     ║
║   Background: Category color (solid)                      ║
║   Shadow: 0 4dp 8dp #1B5E5E15                             ║
║                                                           ║
║   ┌─────────────────────────────────────────────────┐     ║
║   │              ┌──────────────┐                   │     ║
║   │              │    IMAGE     │                   │     ║
║   │              │   48dp×48dp  │                   │     ║
║   │              └──────────────┘                   │     ║
║   │              ┌──────────────┐                   │     ║
║   │              │   LABEL      │                   │     ║
║   │              │  Body/14sp   │                   │     ║
║   │              └──────────────┘                   │     ║
║   │              ┌──────────────┐                   │     ║
║   │              │   COUNT      │                   │     ║
║   │              │ Caption/10sp │                   │     ║
║   │              └──────────────┘                   │     ║
║   └─────────────────────────────────────────────────┘     ║
╚═══════════════════════════════════════════════════════════╝
```

### 🎬 Tile Animations

| State | Animation | Duration | Details |
|-------|-----------|----------|---------|
| Idle | None | - | Static appearance |
| Tap Down | Scale to 0.92, darken 5% | 100ms | Spring physics |
| Tap Up | Scale to 1.0, restore color | 200ms | Spring physics |
| Locked | Grayscale + 🔒 badge | - | Phase 2/3 content |

### 📱 Responsive Grid (Learn Tab)

| Screen Width | Columns | Tile Size | Gap | Padding |
|--------------|---------|-----------|-----|---------|
| < 360dp | 3 | 90dp | 8dp | 12dp |
| 360-400dp | 3 | 100dp | 12dp | 16dp |
| > 600dp (tablet) | 4 | 120dp | 16dp | 24dp |

---

## Screen 6: Offline Verification (Background)

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│                                                         │
│                                                         │
│                    [flex: 1]                            │
│                                                         │
│                 ┌───────────────────┐                   │
│                 │    🔍             │                   │
│                 │    64dp × 64dp    │                   │
│                 │    rotating       │                   │
│                 └───────────────────┘                   │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│              ┌─────────────────────────┐                │
│              │    পরীক্ষা চলছে...      │                │
│              │    Checking files...    │                │
│              └─────────────────────────┘                │
│              Headline/24sp + Body/16sp                  │
│                                                         │
│                    [32dp spacing]                       │
│                                                         │
│    ┌─────────────────────────────────────────────┐      │
│    │                                             │      │
│    │  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━░░░░░░ 75%   │      │
│    │                                             │      │
│    └─────────────────────────────────────────────┘      │
│    Progress bar: 280dp × 8dp, radius 4dp                │
│    Track: #1B5E5E20, Fill: #7FBA96                      │
│    Percentage: Caption/14sp, right aligned              │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│    ┌─────────────────────────────────────────────┐      │
│    │                                             │      │
│    │  প্রাণী ✓     Animals ✓                     │      │
│    │  ফল ✓        Fruits ✓                      │      │
│    │  যানবাহন ...  Vehicles ...                 │      │
│    │                                             │      │
│    └─────────────────────────────────────────────┘      │
│    Checklist: Body/16sp                                 │
│    ✓ Color: #7FBA96, ... Color: #1B5E5E50              │
│                                                         │
│                    [flex: 1]                            │
│                                                         │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### 🎬 Animations

| Element | Animation | Duration |
|---------|-----------|----------|
| Search Icon | Rotate 360° | 2000ms loop |
| Progress Bar | Width animates smoothly | Real-time |
| Checkmarks | Fade in + scale (0→1) | 300ms each |
| Ellipsis | Opacity pulse | 800ms loop |

---

## Screen 7: Critical Error Screen

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│                                                         │
│                                                         │
│                    [flex: 1]                            │
│                                                         │
│                 ┌───────────────────┐                   │
│                 │                   │                   │
│                 │    😔 Mascot      │                   │
│                 │    (sad face)     │                   │
│                 │    140dp × 140dp  │                   │
│                 │                   │                   │
│                 └───────────────────┘                   │
│                    Gentle wobble animation              │
│                                                         │
│                    [32dp spacing]                       │
│                                                         │
│              ╔═════════════════════════╗                │
│              ║    কিছু সমস্যা হয়েছে    ║                │
│              ║   Something went wrong  ║                │
│              ╚═════════════════════════╝                │
│              Headline/28sp + Title/18sp                 │
│              Color: #1B5E5E                             │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│    ┌─────────────────────────────────────────────┐      │
│    │                                             │      │
│    │   অডিও ফাইল খুঁজে পাওয়া যায়নি              │      │
│    │   Audio files are missing                  │      │
│    │                                             │      │
│    │   অ্যাপ পুনরায় ইনস্টল করুন                 │      │
│    │   Please reinstall the app                 │      │
│    │                                             │      │
│    └─────────────────────────────────────────────┘      │
│    Card: #FEF3F2, border #C7514620, radius 16dp         │
│    Body/16sp + Caption/14sp                             │
│                                                         │
│                    [flex: 1]                            │
│                                                         │
│    ╔═══════════════════════════════════════════╗        │
│    ║                                           ║        │
│    ║       বন্ধ করুন                               ║        │
│    ║                                           ║        │
│    ╚═══════════════════════════════════════════╝        │
│    Button: 70% width, 56dp height                       │
│    Background: #C75146, radius 16dp                     │
│                                                         │
│                    [32dp margin bottom]                 │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### 🎬 Animations

| Element | Animation | Duration |
|---------|-----------|----------|
| Sad Mascot | Gentle wobble (rotate ±3°) | 3000ms loop |
| Error Card | Shake on appear | 500ms once |
| Close Button | Pulse glow | 2000ms loop |

### 👆 Interactions

| Action | Result |
|--------|--------|
| Tap Close Button | Exit app gracefully |
| Back Button (Android) | Exit app gracefully |

---

## 📋 Screen Summary - Foundation (1-7)

| # | Screen Name | Purpose | Entry Point |
|---|-------------|---------|-------------|
| 1 | Language Selection | Choose parent UI language | First launch only |
| 2 | Splash Screen | Brand + asset verification | Every launch |
| 3 | Welcome Screen | Trust building | First launch only |
| 4 | Tutorial Overlay | Teach gestures | First time / reset |
| 5 | Main Learning Board | Primary hub | Default destination |
| 6 | Offline Verification | Asset integrity check | Background on splash |
| 7 | Critical Error | Graceful failure | Asset verification fail |

---

## 🔗 Navigation Flow

```
App Launch
    │
    ▼
┌─────────────────┐
│  First Launch?  │
└────────┬────────┘
         │
    YES  │  NO
    ▼    │  │
┌────────┴──┴────────┐
│ Language Selection │
└─────────┬──────────┘
          │
          ▼
    ┌───────────┐
    │  Splash   │◄──────────────┐
    │  Screen   │               │
    └─────┬─────┘               │
          │                     │
          ▼                     │
    ┌───────────┐               │
    │  Assets   │               │
    │   OK?     │               │
    └─────┬─────┘               │
          │                     │
     YES  │  NO                 │
     ▼    │  │                  │
┌────────┬┘  └──────┐           │
│ First  │          ▼           │
│ Time?  │    ┌──────────┐      │
└────┬───┘    │  Error   │      │
     │        │  Screen  │      │
YES  │  NO    └──────────┘      │
▼    │  │                       │
┌────┴──┴────┐                  │
│  Welcome   │                  │
│  Screen    │                  │
└─────┬──────┘                  │
      │                         │
      ▼                         │
┌───────────────┐               │
│ Tutorial Seen?│               │
└───────┬───────┘               │
        │                       │
   NO   │  YES                  │
   ▼    │  │                    │
┌──────┬┘  │                    │
│Tutorial  │                    │
│Overlay│  │                    │
└───┬───┘  │                    │
    │      │                    │
    ▼      ▼                    │
┌──────────────┐                │
│    MAIN      │                │
│   BOARD      │────────────────┘
│  (Screen 5)  │   (App relaunch)
└──────────────┘
```
