# 📱 Phase 3 Premium - Session Management Screens (59-62)
## Touch & Learn Board - Premium UI/UX Wireframes

> **5-TAB NAVIGATION NOTE:** Session screens are special flows.
> Daily Session Start appears BEFORE showing bottom navigation.
> Session Resume appears when app reopens after pause.
> Multi-Child Profile Switcher is accessed from **প্রোফাইল (Profile) Tab**.

---

## Screen 59: Daily Session Start

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│ Status Bar                                              │
├─────────────────────────────────────────────────────────┤
│                                                         │
│                    [flex spacer]                        │
│                                                         │
│              ┌─────────────────────┐                   │
│              │                     │                   │
│              │       🌅☀️         │                   │
│              │       100dp         │                   │
│              │   Morning sun       │                   │
│              │   (animated)        │                   │
│              │                     │                   │
│              └─────────────────────┘                   │
│              Time-based: Morning/Afternoon/Evening      │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│              ╔═══════════════════════╗                  │
│              ║                       ║                  │
│              ║  সুপ্রভাত, সোনা! ☀️   ║                  │
│              ║  Good morning,       ║                  │
│              ║  sunshine!           ║                  │
│              ║                       ║                  │
│              ╚═══════════════════════╝                  │
│              Headline/28sp, dynamic greeting            │
│              Based on time:                             │
│              - সুপ্রভাত (Good morning) 5am-12pm         │
│              - শুভ দুপুর (Good afternoon) 12pm-5pm     │
│              - শুভ সন্ধ্যা (Good evening) 5pm-9pm      │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│              ┌─────────────────────┐                   │
│              │                     │                   │
│              │  আজ শিখতে প্রস্তুত?  │                   │
│              │  Ready to learn     │                   │
│              │  today?             │                   │
│              │                     │                   │
│              └─────────────────────┘                   │
│              Body/18sp                                  │
│                                                         │
│                    [32dp spacing]                       │
│                                                         │
│  ╔═══════════════════════════════════════════════════╗ │
│  ║                                                   ║ │
│  ║   📊 গতকালের অর্জন                               ║ │
│  ║                                                   ║ │
│  ║   ┌─────────────────────────────────────────┐   ║ │
│  ║   │                                         │   ║ │
│  ║   │   ⭐ ১২টি নতুন শব্দ শিখেছ!              │   ║ │
│  ║   │                                         │   ║ │
│  ║   │   🎮 ৩টি খেলা খেলেছ                     │   ║ │
│  ║   │                                         │   ║ │
│  ║   │   📚 ১টি গল্প পড়েছ                      │   ║ │
│  ║   │                                         │   ║ │
│  ║   └─────────────────────────────────────────┘   ║ │
│  ║                                                   ║ │
│  ║   Only shows if yesterday had activity           ║ │
│  ║                                                   ║ │
│  ╚═══════════════════════════════════════════════════╝ │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│  ╔═══════════════════════════════════════════════════╗ │
│  ║                                                   ║ │
│  ║   🎯 আজকের লক্ষ্য                               ║ │
│  ║                                                   ║ │
│  ║   ┌─────────────────────────────────────────┐   ║ │
│  ║   │                                         │   ║ │
│  ║   │   📝 ১০টি নতুন শব্দ                     │   ║ │
│  ║   │                                         │   ║ │
│  ║   │   ░░░░░░░░░░░░░░░░░░░░ 0/10            │   ║ │
│  ║   │                                         │   ║ │
│  ║   └─────────────────────────────────────────┘   ║ │
│  ║                                                   ║ │
│  ║   Parent configurable in settings                ║ │
│  ║                                                   ║ │
│  ╚═══════════════════════════════════════════════════╝ │
│                                                         │
│                    [flex spacer]                        │
│                                                         │
│  ╔═══════════════════════════════════════════════╗     │
│  ║                                               ║     │
│  ║     🚀 চলো শুরু করি!                        ║     │
│  ║                                               ║     │
│  ╚═══════════════════════════════════════════════╝     │
│  Primary button: Bouncy animation                       │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                                                 │   │
│  │        গতকাল যেখানে ছিলাম                     │   │
│  │                                                 │   │
│  └─────────────────────────────────────────────────┘   │
│  Secondary button: Resume from last position            │
│                                                         │
│                    [32dp bottom]                        │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### 🎨 Time-Based Theming

```dart
// Dynamic greeting and theme
Map<String, dynamic> getTimeBasedTheme() {
  final hour = DateTime.now().hour;
  
  if (hour >= 5 && hour < 12) {
    return {
      'greeting': 'সুপ্রভাত, সোনা! ☀️',
      'greetingEn': 'Good morning, sunshine!',
      'icon': '🌅☀️',
      'gradient': [Color(0xFFFFF3E0), Color(0xFFFFE0B2)],
    };
  } else if (hour >= 12 && hour < 17) {
    return {
      'greeting': 'শুভ দুপুর! 🌤️',
      'greetingEn': 'Good afternoon!',
      'icon': '☀️🌤️',
      'gradient': [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
    };
  } else {
    return {
      'greeting': 'শুভ সন্ধ্যা! 🌙',
      'greetingEn': 'Good evening!',
      'icon': '🌙✨',
      'gradient': [Color(0xFFF3E5F5), Color(0xFFE1BEE7)],
    };
  }
}
```

---

## Screen 60: Session Resume

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│ Status Bar                                              │
├─────────────────────────────────────────────────────────┤
│                                                         │
│                    [flex spacer]                        │
│                                                         │
│              ┌─────────────────────┐                   │
│              │                     │                   │
│              │       🔄           │                   │
│              │       80dp          │                   │
│              │   Spinning slowly   │                   │
│              │                     │                   │
│              └─────────────────────┘                   │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│              ╔═══════════════════════╗                  │
│              ║                       ║                  │
│              ║  আবার স্বাগতম! 👋     ║                  │
│              ║                       ║                  │
│              ╚═══════════════════════╝                  │
│              Headline/28sp                              │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│  ╔═══════════════════════════════════════════════════╗ │
│  ║                                                   ║ │
│  ║   📍 তুমি যেখানে ছিলে:                            ║ │
│  ║                                                   ║ │
│  ║   ┌─────────────────────────────────────────┐   ║ │
│  ║   │                                         │   ║ │
│  ║   │   🐅                                    │   ║ │
│  ║   │                                         │   ║ │
│  ║   │   পশু                                   │   ║ │
│  ║   │   বাঘ                                   │   ║ │
│  ║   │                                         │   ║ │
│  ║   │   ৪/১০ শেষ হয়েছে                       │   ║ │
│  ║   │                                         │   ║ │
│  ║   │                                         │   ║ │
│  ║   │   ━━━━━━━━━━░░░░░░░░░░░ ৪০%            │   ║ │
│  ║   │                                         │   ║ │
│  ║   └─────────────────────────────────────────┘   ║ │
│  ║                                                   ║ │
│  ║   Card shows: Category icon, name, progress      ║ │
│  ║                                                   ║ │
│  ╚═══════════════════════════════════════════════════╝ │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│  ╔═══════════════════════════════════════════════════╗ │
│  ║                                                   ║ │
│  ║   ⏱️ আজ শেখার সময়: ১৫ মিনিট বাকি              ║ │
│  ║                                                   ║ │
│  ║   ━━━━━━━━━━━━━━━━░░░░░░  ৭৫% শেষ             ║ │
│  ║                                                   ║ │
│  ╚═══════════════════════════════════════════════════╝ │
│  Shows if daily time limit is set                       │
│                                                         │
│                    [flex spacer]                        │
│                                                         │
│  ╔═══════════════════════════════════════════════╗     │
│  ║                                               ║     │
│  ║     ▶️ যেখানে ছিলাম শুরু করি             ║     │
│  ║                                               ║     │
│  ╚═══════════════════════════════════════════════╝     │
│  Primary button: Resumes exact position                 │
│                                                         │
│                    [12dp spacing]                       │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                                                 │   │
│  │        🏠 হোমে যাই                             │   │
│  │                                                 │   │
│  └─────────────────────────────────────────────────┘   │
│  Secondary button: Goes to main board                   │
│                                                         │
│                    [32dp bottom]                        │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

---

## Screen 61: Session Progress Save

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│ Status Bar                                              │
├─────────────────────────────────────────────────────────┤
│                                                         │
│                    [flex spacer]                        │
│                                                         │
│              ┌─────────────────────┐                   │
│              │                     │                   │
│              │        💾          │                   │
│              │       80dp          │                   │
│              │   Saving animation  │                   │
│              │                     │                   │
│              └─────────────────────┘                   │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│              ╔═══════════════════════╗                  │
│              ║                       ║                  │
│              ║  সেভ হচ্ছে...        ║                  │
│              ║  Saving progress...  ║                  │
│              ║                       ║                  │
│              ╚═══════════════════════╝                  │
│              Body/18sp                                  │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│              ┌─────────────────────┐                   │
│              │                     │                   │
│              │  ━━━━━━━━━━━░░░░░░  │                   │
│              │                     │                   │
│              │     Progress bar    │                   │
│              │                     │                   │
│              └─────────────────────┘                   │
│                                                         │
│                    [flex spacer]                        │
│                                                         │
│  ╔═══════════════════════════════════════════════════╗ │
│  ║                                                   ║ │
│  ║   💡 টিপস: তোমার অগ্রগতি স্বয়ংক্রিয়ভাবে সেভ হয়   ║ │
│  ║      Tip: Your progress saves automatically      ║ │
│  ║                                                   ║ │
│  ╚═══════════════════════════════════════════════════╝ │
│                                                         │
│                    [32dp bottom]                        │
│                                                         │
└─────────────────────────────────────────────────────────┘

===== AFTER SAVE COMPLETE =====

┌─────────────────────────────────────────────────────────┐
│ Status Bar                                              │
├─────────────────────────────────────────────────────────┤
│                                                         │
│                    [flex spacer]                        │
│                                                         │
│              ┌─────────────────────┐                   │
│              │                     │                   │
│              │        ✅          │                   │
│              │       80dp          │                   │
│              │   Checkmark pop     │                   │
│              │                     │                   │
│              └─────────────────────┘                   │
│              Color: #7FBA96                             │
│                                                         │
│                    [16dp spacing]                       │
│                                                         │
│              ╔═══════════════════════╗                  │
│              ║                       ║                  │
│              ║  সেভ হয়ে গেছে! ✨    ║                  │
│              ║  Saved!              ║                  │
│              ║                       ║                  │
│              ╚═══════════════════════╝                  │
│              Headline/24sp                              │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│  ╔═══════════════════════════════════════════════════╗ │
│  ║                                                   ║ │
│  ║   📊 আজকের সারসংক্ষেপ                          ║ │
│  ║                                                   ║ │
│  ║   ┌─────────────────────────────────────────┐   ║ │
│  ║   │                                         │   ║ │
│  ║   │   ⏱️ সময়: ২০ মিনিট                     │   ║ │
│  ║   │                                         │   ║ │
│  ║   │                                         │   ║ │
│  ║   │   📝 শব্দ: ৮টি নতুন শিখেছ               │   ║ │
│  ║   │                                         │   ║ │
│  ║   │                                         │   ║ │
│  ║   │   ⭐ স্কোর: ৮৫%                         │   ║ │
│  ║   │                                         │   ║ │
│  ║   │                                         │   ║ │
│  ║   └─────────────────────────────────────────┘   ║ │
│  ║                                                   ║ │
│  ╚═══════════════════════════════════════════════════╝ │
│                                                         │
│                    [flex spacer]                        │
│                                                         │
│  ╔═══════════════════════════════════════════════╗     │
│  ║                                               ║     │
│  ║        🏠 হোমে ফিরে যাই                    ║     │
│  ║                                               ║     │
│  ╚═══════════════════════════════════════════╝     │
│                                                         │
│                    [12dp spacing]                       │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                                                 │   │
│  │        ▶️ আরো শিখি                             │   │
│  │                                                 │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│                    [32dp bottom]                        │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

---

## Screen 62: Multi-Child Profile Switcher

### 📐 Layout Specifications

```
┌─────────────────────────────────────────────────────────┐
│ Status Bar                                              │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌─────┐                          ┌─────────────────┐  │
│  │  ✕  │                          │ 👨‍👩‍👧‍👦 প্রোফাইল   │  │
│  │     │                          │  (Parent UI)  │  │
│  └─────┘                          └─────────────────┘  │
│                                                         │
│  ═══════════════════════════════════════════════════   │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│              ╔═══════════════════════╗                  │
│              ║                       ║                  │
│              ║  কে শিখবে আজ? 🎯      ║                  │
│              ║  Who's learning       ║                  │
│              ║  today?               ║                  │
│              ║                       ║                  │
│              ╚═══════════════════════╝                  │
│              Headline/24sp                              │
│                                                         │
│                    [32dp spacing]                       │
│                                                         │
│  ╔═══════════════════════════════════════════════════╗ │
│  ║                                                   ║ │
│  ║   CHILD PROFILE GRID                             ║ │
│  ║                                                   ║ │
│  ║   ┌─────────────────┐  ┌─────────────────┐      ║ │
│  ║   │                 │  │                 │      ║ │
│  ║   │   ┌───────┐    │  │   ┌───────┐    │      ║ │
│  ║   │   │       │    │  │   │       │    │      ║ │
│  ║   │   │  🧒   │    │  │   │  👧   │    │      ║ │
│  ║   │   │  80dp │    │  │   │  80dp │    │      ║ │
│  ║   │   │       │    │  │   │       │    │      ║ │
│  ║   │   └───────┘    │  │   └───────┘    │      ║ │
│  ║   │                 │  │                 │      ║ │
│  ║   │    রাফি  ✓      │  │     রিয়া        │      ║ │
│  ║   │    Rafi        │  │     Riya        │      ║ │
│  ║   │    ৩ বছর       │  │     ৫ বছর       │      ║ │
│  ║   │    Age 3       │  │     Age 5       │      ║ │
│  ║   │                 │  │                 │      ║ │
│  ║   │   ⭐ Lv.2      │  │   ⭐ Lv.5      │      ║ │
│  ║   │                 │  │                 │      ║ │
│  ║   └─────────────────┘  └─────────────────┘      ║ │
│  ║                                                   ║ │
│  ║   Profile cards:                                 ║ │
│  ║   ├── Avatar: Customizable emoji (🧒👧👦👶)      ║ │
│  ║   ├── Name: Bangla + English                    ║ │
│  ║   ├── Age: Auto-calculated from DOB             ║ │
│  ║   ├── Level: Based on progress                  ║ │
│  ║   ├── ✓ Current profile highlighted            ║ │
│  ║   └── Tap to switch                            ║ │
│  ║                                                   ║ │
│  ╚═══════════════════════════════════════════════════╝ │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│  ╔═══════════════════════════════════════════════════╗ │
│  ║                                                   ║ │
│  ║   + নতুন প্রোফাইল                                 ║ │
│  ║                                                   ║ │
│  ║   ┌─────────────────────────────────────────┐   ║ │
│  ║   │                                         │   ║ │
│  ║   │   ┌─────────┐                          │   ║ │
│  ║   │   │         │                          │   ║ │
│  ║   │   │    +    │   আরেকটি শিশু যোগ করুন   │   ║ │
│  ║   │   │         │                          │   ║ │
│  ║   │   └─────────┘                          │   ║ │
│  ║   │                                         │   ║ │
│  ║   │   Dashed border, tap to add             │   ║ │
│  ║   │                                         │   ║ │
│  ║   └─────────────────────────────────────────┘   ║ │
│  ║                                                   ║ │
│  ║   Max 4 profiles per device                      ║ │
│  ║                                                   ║ │
│  ╚═══════════════════════════════════════════════════╝ │
│                                                         │
│                    [24dp spacing]                       │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                                                 │   │
│  │  🔒 Parent gate required for:                  │   │
│  │  • Adding/removing profiles                    │   │
│  │  • Editing profile info                        │   │
│  │  • Accessing settings                          │   │
│  │                                                 │   │
│  └─────────────────────────────────────────────────┘   │
│  Caption/12sp, muted                                    │
│                                                         │
│                    [32dp bottom]                        │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### 🆕 Add Profile Dialog

```
┌─────────────────────────────────────────────────────────┐
│                                                         │
│   PARENT GATE (Math question) first                    │
│                                                         │
│  ═══════════════════════════════════════════════════   │
│                                                         │
│  ╔═══════════════════════════════════════════════════╗ │
│  ║                                                   ║ │
│  ║   👶 নতুন প্রোফাইল                                  ║ │
│  ║                                                   ║ │
│  ║   ┌─────────────────────────────────────────┐   ║ │
│  ║   │                                         │   ║ │
│  ║   │   অবতার বাছুন:                           │   ║ │
│  ║   │                                         │   ║ │
│  ║   │   [🧒] [👧] [👦] [👶] [🐻] [🦁]        │   ║ │
│  ║   │                                         │   ║ │
│  ║   └─────────────────────────────────────────┘   ║ │
│  ║                                                   ║ │
│  ║   ┌─────────────────────────────────────────┐   ║ │
│  ║   │                                         │   ║ │
│  ║   │   নাম:                                    │   ║ │
│  ║   │   ┌─────────────────────────────────┐ │   ║ │
│  ║   │   │                                 │ │   ║ │
│  ║   │   │   শিশুর নাম লিখুন...            │ │   ║ │
│  ║   │   │                                 │ │   ║ │
│  ║   │   └─────────────────────────────────┘ │   ║ │
│  ║   │                                         │   ║ │
│  ║   └─────────────────────────────────────────┘   ║ │
│  ║                                                   ║ │
│  ║   ┌─────────────────────────────────────────┐   ║ │
│  ║   │                                         │   ║ │
│  ║   │   জন্ম তারিখ:                             │   ║ │
│  ║   │   ┌─────────────────────────────────┐ │   ║ │
│  ║   │   │                                 │ │   ║ │
│  ║   │   │   📅 তারিখ বাছুন...             │ │   ║ │
│  ║   │   │                                 │ │   ║ │
│  ║   │   └─────────────────────────────────┘ │   ║ │
│  ║   │                                         │   ║ │
│  ║   └─────────────────────────────────────────┘   ║ │
│  ║                                                   ║ │
│  ║   ┌─────────────────────────────────────────┐   ║ │
│  ║   │                                         │   ║ │
│  ║   │   [    বাতিল    ]                        │   ║ │
│  ║   │                                         │   ║ │
│  ║   │   [    ✓ তৈরি করুন    ]                  │   ║ │
│  ║   │                                         │   ║ │
│  ║   └─────────────────────────────────────────┘   ║ │
│  ║                                                   ║ │
│  ╚═══════════════════════════════════════════════════╝ │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

---

## 📋 Screen Summary - Session Management (59-62)

| # | Screen Name | Purpose | Trigger |
|---|-------------|---------|---------|
| 59 | Daily Session Start | Morning greeting, goals | App open (new day) |
| 60 | Session Resume | Continue where left off | App open (same day) |
| 61 | Session Progress Save | Auto-save confirmation | Background/exit |
| 62 | Multi-Child Profiles | Switch between children | Profile tap/settings |

---

## 📊 Session Data Model

```dart
/// Hive Box: sessionBox
@HiveType(typeId: 10)
class SessionData extends HiveObject {
  @HiveField(0)
  late String sessionId;
  
  @HiveField(1)
  late DateTime startTime;
  
  @HiveField(2)
  DateTime? endTime;
  
  @HiveField(3)
  late int wordsLearned;
  
  @HiveField(4)
  late int gamesPlayed;
  
  @HiveField(5)
  late int storiesRead;
  
  @HiveField(6)
  late String lastScreen; // For resume
  
  @HiveField(7)
  late String lastItemId; // For exact position
  
  @HiveField(8)
  late String childProfileId;
}

/// Hive Box: childProfileBox
@HiveType(typeId: 11)
class ChildProfile extends HiveObject {
  @HiveField(0)
  late String id;
  
  @HiveField(1)
  late String name; // Bangla name
  
  @HiveField(2)
  late String avatar; // Emoji or asset
  
  @HiveField(3)
  late DateTime dateOfBirth;
  
  @HiveField(4)
  late int level; // 1-10
  
  @HiveField(5)
  late int totalWordsLearned;
  
  @HiveField(6)
  late List<String> completedCategories;
  
  @HiveField(7)
  late DateTime createdAt;
  
  @HiveField(8)
  late bool isActive; // Currently selected
}
```

---

## 🔄 Session Flow Logic

```
APP LAUNCH FLOW:
├── Check for active profile
│   ├── No profiles → Create first profile
│   └── Has profiles → Check last session
├── Check last session
│   ├── Same day + incomplete → Show Screen 60 (Resume)
│   ├── New day → Show Screen 59 (Daily Start)
│   └── No session → Show Screen 59 (Fresh start)
└── After selection → Main Board

SESSION SAVE TRIGGERS:
├── User taps home button
├── App goes to background
├── Daily time limit reached
├── User manually exits category
└── Every 30 seconds (auto-save)

PROFILE SWITCH:
├── Requires parent gate (math)
├── Saves current session
├── Loads selected profile data
├── Continues to appropriate screen
└── Updates UI with profile's progress
```

---

## 🎨 Design Tokens Summary

```
SESSION SCREENS:
├── Background: Time-based gradients
├── Cards: White with 8dp radius
├── Icons: 80-100dp for emotional impact
├── Buttons: 56dp height
└── Progress bars: 8dp height

PROFILE CARDS:
├── Size: (screenWidth - 48) / 2
├── Avatar: 80dp circle
├── Active state: #7FBA96 border (2dp)
├── Inactive state: Default border (1dp)
└── Tap feedback: Scale 0.95

ANIMATIONS:
├── Greeting: Fade in + slight bounce
├── Progress bar: Animated fill
├── Save icon: Spinning → Checkmark
├── Profile switch: Crossfade
└── Time icons: Subtle floating
```

---

## ✅ All 62 Screens Complete!

### Phase 1 MVP (22 screens):
- Screens 1-7: Foundation
- Screens 8-15: Learning Content  
- Screens 16-22: Parent Controls

### Phase 2 Enhanced (19 screens):
- Screens 23-28: Error/Edge Cases
- Screens 29-33: Stories
- Screens 34-41: Games
- Screens 48-50: Accessibility

### Phase 3 Premium (21 screens):
- Screens 42-47: Advanced Learning
- Screens 51-58: Cultural & Monetization
- Screens 59-62: Session Management

---

**Total: 62 screens fully documented with wireframes, interactions, and specifications.**
