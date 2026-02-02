\## 📱 COMPLETE WIREFRAMES - NEW FEATURES (Screen-by-Screen)



\*\*\*



\# 🎤 FEATURE 1: VOICE RECOGNITION PRACTICE



\*\*\*



\## Screen 1: Voice Practice Mode Entry



```

┌─────────────────────────────────────┐

│  ← Main Board                       │

│                                     │

│         🎤 উচ্চারণ শিখি              │

│         Voice Practice              │

│                                     │

│  ┌─────────────────────────────┐   │

│  │                             │   │

│  │         🐄                   │   │

│  │        গরু                   │   │

│  │                             │   │

│  │  শব্দটি উচ্চারণ করো          │   │

│  │  Say the word aloud         │   │

│  │                             │   │

│  │  \[  🎤  শুরু করো  ]         │   │

│  │     Start Speaking          │   │

│  │                             │   │

│  └─────────────────────────────┘   │

│                                     │

│  💡 মাইক্রোফোন অনুমতি প্রয়োজন      │

│     Microphone permission needed   │

│                                     │

└─────────────────────────────────────┘

```



\*\*Design Specs:\*\*

\- Icon: `120.w × 120.h` (large cow image)

\- Word text: `48.sp` Bangla

\- Button: `200.w × 60.h`, mango yellow

\- Permission note: `14.sp`, light gray



\*\*Responsive:\*\*

```dart

Container(

&nbsp; width: ScreenUtil.screenWidth \* 0.85,

&nbsp; padding: EdgeInsets.all(24.w),

&nbsp; decoration: BoxDecoration(

&nbsp;   color: Colors.white,

&nbsp;   borderRadius: BorderRadius.circular(24.r),

&nbsp;   boxShadow: \[

&nbsp;     BoxShadow(

&nbsp;       color: AppColors.shadowLight,

&nbsp;       blurRadius: 12.r,

&nbsp;       offset: Offset(0, 6.h),

&nbsp;     ),

&nbsp;   ],

&nbsp; ),

&nbsp; child: Column(

&nbsp;   children: \[

&nbsp;     Image.asset('cow.png', width: 120.w, height: 120.h),

&nbsp;     SizedBox(height: 16.h),

&nbsp;     Text('গরু', style: TextStyle(fontSize: 48.sp)),

&nbsp;     SizedBox(height: 12.h),

&nbsp;     Text('শব্দটি উচ্চারণ করো', style: TextStyle(fontSize: 20.sp)),

&nbsp;     SizedBox(height: 24.h),

&nbsp;     ElevatedButton.icon(

&nbsp;       icon: Icon(Icons.mic, size: 28.sp),

&nbsp;       label: Text('শুরু করো', style: TextStyle(fontSize: 22.sp)),

&nbsp;     ),

&nbsp;   ],

&nbsp; ),

)

```



\*\*\*



\## Screen 2: Listening State (Microphone Active)



```

┌─────────────────────────────────────┐

│  ✕ Close                            │

│                                     │

│         🐄                           │

│        গরু                           │

│                                     │

│                                     │

│      ⚫⚫⚫🔴⚫⚫⚫                      │

│    Audio waveform animation         │

│                                     │

│      🎤 শুনছি...                     │

│         Listening...                │

│                                     │

│                                     │

│  \[     বন্ধ করুন / Stop     ]      │

│                                     │

└─────────────────────────────────────┘

```



\*\*Animation:\*\*

\- Waveform: Pulsing dots (3 before, 1 red center, 3 after)

\- Pulse speed: 500ms per cycle

\- Mic icon: Gentle glow effect



\*\*Code:\*\*

```dart

class VoiceWaveform extends StatefulWidget {

&nbsp; @override

&nbsp; State<VoiceWaveform> createState() => \_VoiceWaveformState();

}



class \_VoiceWaveformState extends State<VoiceWaveform> 

&nbsp;   with SingleTickerProviderStateMixin {

&nbsp; late AnimationController \_controller;

&nbsp; 

&nbsp; @override

&nbsp; void initState() {

&nbsp;   super.initState();

&nbsp;   \_controller = AnimationController(

&nbsp;     duration: Duration(milliseconds: 500),

&nbsp;     vsync: this,

&nbsp;   )..repeat(reverse: true);

&nbsp; }

&nbsp; 

&nbsp; @override

&nbsp; Widget build(BuildContext context) {

&nbsp;   return Row(

&nbsp;     mainAxisAlignment: MainAxisAlignment.center,

&nbsp;     children: List.generate(7, (index) {

&nbsp;       return AnimatedBuilder(

&nbsp;         animation: \_controller,

&nbsp;         builder: (context, child) {

&nbsp;           double scale = index == 3 ? 1.5 : 1.0; // Center dot larger

&nbsp;           double opacity = index == 3 ? 1.0 : 0.3 + \_controller.value \* 0.7;

&nbsp;           

&nbsp;           return Container(

&nbsp;             margin: EdgeInsets.symmetric(horizontal: 4.w),

&nbsp;             width: 12.w \* scale,

&nbsp;             height: 12.h \* scale,

&nbsp;             decoration: BoxDecoration(

&nbsp;               shape: BoxShape.circle,

&nbsp;               color: index == 3 

&nbsp;                 ? Colors.red.withOpacity(opacity)

&nbsp;                 : Colors.grey.withOpacity(opacity),

&nbsp;             ),

&nbsp;           );

&nbsp;         },

&nbsp;       );

&nbsp;     }),

&nbsp;   );

&nbsp; }

}

```



\*\*\*



\## Screen 3A: Correct Pronunciation ✅



```

┌─────────────────────────────────────┐

│                                     │

│         ✅                           │

│      (Success icon)                 │

│                                     │

│         🐄                           │

│        গরু                           │

│                                     │

│      চমৎকার উচ্চারণ!                 │

│      Perfect pronunciation!         │

│                                     │

│    "গো-রু" তুমি ঠিক বলেছো          │

│    You said it correctly!           │

│                                     │

│  \[  🔊 আবার শোনো  ] \[  পরের  →  ] │

│     Hear Again        Next         │

│                                     │

└─────────────────────────────────────┘

```



\*\*Animation Sequence:\*\*

1\. Checkmark scales from 0 → 1.2 → 1.0 (600ms)

2\. Gentle confetti (5 particles, fade out)

3\. Text fades in (300ms delay)

4\. Soft success chime plays



\*\*Non-Addictive:\*\* \[bitskingdom](https://bitskingdom.com/blog/ux-for-kids-gen-alpha-toddlers/)

\- Only 2 seconds celebration

\- No score accumulation

\- No "streak" counter

\- Just acknowledgment



\*\*\*



\## Screen 3B: Needs Practice 🔄



```

┌─────────────────────────────────────┐

│                                     │

│         🔄                           │

│    (Gentle retry icon)              │

│                                     │

│         🐄                           │

│        গরু                           │

│                                     │

│      আবার চেষ্টা করো                │

│      Try again                      │

│                                     │

│    শুনে বলো: "গো-রু"               │

│    Listen and say: "go-ru"         │

│                                     │

│  \[  🔊 শোনো  ] \[  🎤 আবার বলো  ]  │

│     Listen       Try Again         │

│                                     │

└─────────────────────────────────────┘

```



\*\*Design Philosophy:\*\*

\- ❌ NO "Wrong!" or red X

\- ❌ NO error sounds

\- ✅ Encouraging tone only

\- ✅ Provides help (listen again)

\- ✅ Child-friendly retry



\*\*Color Scheme:\*\*

\- Icon: Sky blue (not red)

\- Text: Dark teal (calm)

\- Background: Warm cream



\*\*\*



\## Screen 4: Voice Practice Settings (Parent)



```

┌─────────────────────────────────────┐

│  ← Settings                         │

│                                     │

│  🎤 উচ্চারণ অনুশীলন সেটিংস          │

│     Voice Practice Settings         │

│  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━  │

│                                     │

│  📊 সংবেদনশীলতা                    │

│     Sensitivity                     │

│                                     │

│  ⚪━━━━●━━━━━⚪                      │

│  Strict    Normal    Lenient        │

│                                     │

│  💬 প্রতিক্রিয়া ভাষা                │

│     Feedback Language               │

│  ⚪ বাংলা ✓  ⚪ English              │

│                                     │

│  🔇 নীরব মোড                        │

│     Silent Mode (visual only)       │

│  \[  বন্ধ / OFF  ]  ▼               │

│                                     │

│  🗑️ ভয়েস ডেটা মুছে ফেলুন           │

│     Delete Voice Data               │

│  \[  সব মুছে ফেলুন / Delete All  ]   │

│                                     │

│  ⚠️ অডিও ডিভাইসে থাকে, আপলোড হয় না │

│     Audio stays on device only     │

│                                     │

└─────────────────────────────────────┘

```



\*\*Sensitivity Levels:\*\*

\- \*\*Strict\*\*: 90%+ match required (ages 4-5)

\- \*\*Normal\*\*: 70%+ match (default, ages 2-3)

\- \*\*Lenient\*\*: 50%+ match (ages 1-2, speech delays)



\*\*\*



\## Screen 5: Permission Request Dialog



```

┌────────────────────────┐

│  🎤 মাইক্রোফোন          │

│     Microphone         │

│                        │

│  উচ্চারণ শিখতে মাইক    │

│  ব্যবহার করতে হবে      │

│                        │

│  Your child's voice    │

│  will be analyzed      │

│  on-device only.       │

│                        │

│  ❌ Not recorded       │

│  ❌ Not uploaded       │

│  ❌ Not saved          │

│                        │

│  \[অনুমতি দিন / Allow]  │

│                        │

│  \[না / Deny]           │

│                        │

└────────────────────────┘

```



\*\*Privacy Assurance:\*\*

```dart

class VoicePrivacyPolicy {

&nbsp; static const String guarantee = '''

&nbsp;   - Voice analyzed in real-time

&nbsp;   - Deleted immediately after check

&nbsp;   - Never leaves device

&nbsp;   - No cloud upload

&nbsp;   - No storage

&nbsp;   - Parent can disable anytime

&nbsp; ''';

}

```



\*\*\*



\# 👨‍👧 FEATURE 2: PARENT-CHILD DUET MODE



\*\*\*



\## Screen 6: Duet Mode Entry



```

┌─────────────────────────────────────┐

│  ← Games                            │

│                                     │

│      👨‍👧 একসাথে শিখি                │

│       Learn Together                │

│                                     │

│  ┌─────────────────────────────┐   │

│  │                             │   │

│  │    👨      ❤️      👧        │   │

│  │   বাবা           শিশু        │   │

│  │   Parent        Child       │   │

│  │                             │   │

│  │  একসাথে বর্ণনা করো ও খুঁজো   │   │

│  │  Describe and find together │   │

│  │                             │   │

│  │  • কোনো স্কোর নেই            │   │

│  │    No scores                │   │

│  │  • সবাই জিতবে                │   │

│  │    Everyone wins            │   │

│  │  • ৩ রাউন্ড খেলো             │   │

│  │    Play 3 rounds            │   │

│  │                             │   │

│  │  \[    শুরু করো / Start    ]│   │

│  │                             │   │

│  └─────────────────────────────┘   │

│                                     │

└─────────────────────────────────────┘

```



\*\*Layout:\*\*

\- Container: `ScreenUtil.screenWidth \* 0.9`

\- Icons: `60.sp` (parent \& child emojis)

\- Bullet points: `18.sp`

\- Start button: Full width, clay red color



\*\*\*



\## Screen 7: Role Assignment



```

┌─────────────────────────────────────┐

│                                     │

│      কে কি করবে?                    │

│      Who does what?                 │

│                                     │

│  ┌──────────────┐  ┌──────────────┐│

│  │              │  │              ││

│  │      👧      │  │      👨      ││

│  │              │  │              ││

│  │   শিশু        │  │   বাবা/মা    ││

│  │   Child      │  │   Parent    ││

│  │              │  │              ││

│  │   দেখবে       │  │  অনুমান করবে││

│  │   Sees       │  │   Guesses   ││

│  │              │  │              ││

│  │  \[  আমি  ]   │  │  \[  আমি  ]  ││

│  │     Me       │  │     Me      ││

│  │              │  │              ││

│  └──────────────┘  └──────────────┘│

│                                     │

│  রাউন্ড ১: শিশু বর্ণনা করবে         │

│  Round 1: Child describes          │

│                                     │

└─────────────────────────────────────┘

```



\*\*Interaction:\*\*

\- Each player taps their role card

\- Cards highlight on selection

\- Roles switch every round automatically



\*\*\*



\## Screen 8: Duet Gameplay - Child's View



```

┌─────────────────────────────────────┐

│  Round 1/3          Role: Describer│

│                                     │

│      তোমার পালা                     │

│      Your turn                      │

│                                     │

│    ┌──────────────────┐            │

│    │                  │            │

│    │       🐄         │            │

│    │                  │            │

│    │      গরু          │            │

│    │                  │            │

│    └──────────────────┘            │

│                                     │

│  বর্ণনা করো (না বলে):               │

│  Describe without naming:          │

│                                     │

│  💡 ইঙ্গিত:                         │

│     Hints:                         │

│  • কোন রং? (What color?)           │

│  • কী খায়? (What does it eat?)    │

│  • কোথায় থাকে? (Where does it live?)│

│                                     │

│  \[  বাবা/মা প্রস্তুত  ]             │

│     Parent Ready                   │

│                                     │

└─────────────────────────────────────┘

```



\*\*Design:\*\*

\- Only child sees the answer (গরু)

\- Parent's screen shows "???"

\- Hints encourage descriptive language

\- No timer (reduces pressure)



\*\*\*



\## Screen 9: Duet Gameplay - Parent's View



```

┌─────────────────────────────────────┐

│  Round 1/3          Role: Guesser  │

│                                     │

│      শুনুন ও খুঁজুন                  │

│      Listen and Find                │

│                                     │

│    শিশু বর্ণনা করছে:                │

│    Child is describing:             │

│                                     │

│         ┌────────┐                  │

│         │   ❓   │                  │

│         │   ?    │                  │

│         └────────┘                  │

│                                     │

│  Tap when you think you know:      │

│                                     │

│  ┌────┐  ┌────┐  ┌────┐           │

│  │ 🐄 │  │ 🐱 │  │ 🥭 │           │

│  └────┘  └────┘  └────┘           │

│                                     │

│  ┌────┐  ┌────┐  ┌────┐           │

│  │ 🚜 │  │ 🐟 │  │ 🍌 │           │

│  └────┘  └────┘  └────┘           │

│                                     │

└─────────────────────────────────────┘

```



\*\*Grid:\*\*

\- 2×3 tile layout (familiar from main board)

\- Tiles: `100.w × 100.h`

\- Spacing: `12.w`

\- Parent taps to guess



\*\*\*



\## Screen 10: Duet Success Celebration



```

┌─────────────────────────────────────┐

│                                     │

│         🎉  🎉  🎉                  │

│                                     │

│      দারুণ টিমওয়ার্ক!                │

│      Great Teamwork!                │

│                                     │

│    ┌──────────────────┐            │

│    │   👨‍👧  ❤️         │            │

│    │                  │            │

│    │  বাবা + শিশু      │            │

│    │  Parent + Child  │            │

│    │                  │            │

│    │  সঠিক উত্তর: 🐄   │            │

│    │  Correct: Cow    │            │

│    │                  │            │

│    └──────────────────┘            │

│                                     │

│  শিশু খুব ভালো বর্ণনা করেছে!        │

│  Child described it so well!       │

│                                     │

│  \[  পরের রাউন্ড / Next Round  ]    │

│                                     │

└─────────────────────────────────────┘

```



\*\*Animation:\*\*

\- Confetti falls from top (3 seconds)

\- Heart pulses between parent/child icons

\- Gentle chime plays

\- Both players see same screen



\*\*Non-Competitive:\*\* \[bitskingdom](https://bitskingdom.com/blog/ux-for-kids-gen-alpha-toddlers/)

\- No "Player 1 wins"

\- No points tally

\- Both celebrate together



\*\*\*



\## Screen 11: Role Switch Notification



```

┌─────────────────────────────────────┐

│                                     │

│      🔄 পালা বদল!                   │

│         Switch Roles!               │

│                                     │

│  ┌──────────────────────────────┐  │

│  │                              │  │

│  │    👨  ⇄  👧                 │  │

│  │                              │  │

│  │  এখন বাবা/মা বর্ণনা করবেন    │  │

│  │  Now parent describes        │  │

│  │                              │  │

│  │  শিশু অনুমান করবে             │  │

│  │  Child guesses               │  │

│  │                              │  │

│  └──────────────────────────────┘  │

│                                     │

│      Round 2 of 3                  │

│                                     │

│  \[      প্রস্তুত / Ready      ]     │

│                                     │

└─────────────────────────────────────┘

```



\*\*Auto-Switch Logic:\*\*

```dart

class DuetGameController {

&nbsp; int currentRound = 1;

&nbsp; bool childIsDescriber = true;

&nbsp; 

&nbsp; void switchRoles() {

&nbsp;   currentRound++;

&nbsp;   childIsDescriber = !childIsDescriber;

&nbsp;   

&nbsp;   // Show transition screen for 3 seconds

&nbsp;   showSwitchScreen();

&nbsp;   

&nbsp;   // Then load next round

&nbsp;   Future.delayed(Duration(seconds: 3), () {

&nbsp;     loadNextRound();

&nbsp;   });

&nbsp; }

}

```



\*\*\*



\## Screen 12: Duet Completion (3 Rounds Done)



```

┌─────────────────────────────────────┐

│                                     │

│      ⭐  ⭐  ⭐                       │

│                                     │

│    তোমরা দুর্দান্ত টিম!              │

│    You're an amazing team!         │

│                                     │

│  ┌────────────────────────────┐    │

│  │                            │    │

│  │  Rounds Completed: 3/3     │    │

│  │                            │    │

│  │  Words Practiced: 6        │    │

│  │                            │    │

│  │  Quality Time: 5 minutes   │    │

│  │                            │    │

│  │  👨‍👧  একসাথে শেখা সেরা!    │    │

│  │     Learning together      │    │

│  │     is the best!           │    │

│  │                            │    │

│  └────────────────────────────┘    │

│                                     │

│  \[  আবার খেলো  ] \[  মেইন মেনু  ]  │

│     Play Again      Main Menu      │

│                                     │

└─────────────────────────────────────┘

```



\*\*Stats Shown:\*\*

\- ✅ Rounds played (not wins/losses)

\- ✅ Words practiced together

\- ✅ Time spent bonding

\- ❌ NO individual scores

\- ❌ NO winner declaration



\*\*\*



\# 📱 FEATURE 3: QR PROGRESS SYNC



\*\*\*



\## Screen 13: Progress Export (Device A)



```

┌─────────────────────────────────────┐

│  ← Settings                         │

│                                     │

│  📤 অগ্রগতি শেয়ার করুন              │

│     Share Progress                  │

│  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━  │

│                                     │

│  অন্য ফোনে পাঠান:                   │

│  Send to another phone:             │

│                                     │

│  ┌────────────────────────────┐    │

│  │                            │    │

│  │  ████ ████ ████ ████       │    │

│  │  ████ ████ ████ ████       │    │

│  │  ████ ████ ████ ████       │    │

│  │  ████ ████ ████ ████       │    │

│  │                            │    │

│  │     QR Code Here           │    │

│  │                            │    │

│  └────────────────────────────┘    │

│                                     │

│  অন্য ডিভাইস দিয়ে স্ক্যান করুন    │

│  Scan with other device            │

│                                     │

│  ⏱️ মেয়াদ: ৫ মিনিট                 │

│     Valid for 5 minutes            │

│                                     │

│  \[  নতুন কোড তৈরি / New Code  ]    │

│                                     │

└─────────────────────────────────────┘

```



\*\*QR Data Structure:\*\*

```json

{

&nbsp; "version": "1.0",

&nbsp; "export\_date": "2026-01-26T10:30:00Z",

&nbsp; "device\_hash": "abc123...",

&nbsp; "encrypted\_data": {

&nbsp;   "tile\_taps": {"cow": 15, "cat": 12, ...},

&nbsp;   "completed\_categories": \["animals"],

&nbsp;   "completed\_stories": \["story\_01"],

&nbsp;   "favorites": \["cow", "mango"],

&nbsp;   "total\_time\_minutes": 125,

&nbsp;   "settings": {"sound": true, "language": "bn"}

&nbsp; },

&nbsp; "checksum": "sha256..."

}

```



\*\*Security:\*\*

```dart

import 'package:encrypt/encrypt.dart';



class QRProgressSync {

&nbsp; static String generateQR(UserProgress progress) {

&nbsp;   // Encrypt with AES-256

&nbsp;   final key = Key.fromSecureRandom(32);

&nbsp;   final iv = IV.fromLength(16);

&nbsp;   final encrypter = Encrypter(AES(key));

&nbsp;   

&nbsp;   final json = progress.toJson();

&nbsp;   final encrypted = encrypter.encrypt(json, iv: iv);

&nbsp;   

&nbsp;   // Encode to QR-friendly string

&nbsp;   return base64Encode(encrypted.bytes);

&nbsp; }

&nbsp; 

&nbsp; static UserProgress decodeQR(String qrData) {

&nbsp;   // Decrypt and parse

&nbsp;   final decrypted = encrypter.decrypt64(qrData);

&nbsp;   return UserProgress.fromJson(jsonDecode(decrypted));

&nbsp; }

}

```



\*\*\*



\## Screen 14: Progress Import (Device B)



```

┌─────────────────────────────────────┐

│  ← Settings                         │

│                                     │

│  📥 অগ্রগতি আমদানি করুন             │

│     Import Progress                 │

│  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━  │

│                                     │

│  QR কোড স্ক্যান করুন:               │

│  Scan QR Code:                      │

│                                     │

│  ┌────────────────────────────┐    │

│  │                            │    │

│  │       📷                   │    │

│  │                            │    │

│  │   Camera Viewfinder        │    │

│  │                            │    │

│  │   Align QR code here       │    │

│  │                            │    │

│  │   \[  Scanning...  ]        │    │

│  │                            │    │

│  └────────────────────────────┘    │

│                                     │

│  💡 অন্য ফোনের QR কোড দেখান         │

│     Show QR from other phone       │

│                                     │

│  \[  বাতিল / Cancel  ]              │

│                                     │

└─────────────────────────────────────┘

```



\*\*Camera Overlay:\*\*

\- Viewfinder: `300.w × 300.h` square

\- Corner guides (4 angles)

\- Scanning line animation (top to bottom)

\- Auto-detects QR in frame



\*\*\*



\## Screen 15: Import Confirmation Dialog



```

┌────────────────────────┐

│  ✅ QR স্ক্যান সফল!     │

│     QR Scanned!        │

│                        │

│  পাওয়া ডেটা:           │

│  Found data:           │

│                        │

│  📊 শিখেছে: ২৫ শব্দ    │

│     Learned: 25 words  │

│                        │

│  📖 পড়েছে: ২ গল্প     │

│     Read: 2 stories    │

│                        │

│  ⏱️ সময়: ১২৫ মিনিট     │

│     Time: 125 minutes  │

│                        │

│  ⚠️ আমদানি করলে বর্তমান│

│     ডেটা মুছে যাবে     │

│     Will replace       │

│     current data       │

│                        │

│  \[আমদানি করুন / Import]│

│                        │

│  \[বাতিল / Cancel]      │

│                        │

└────────────────────────┘

```



\*\*Merge Strategy:\*\*

\- Option 1: \*\*Replace\*\* (overwrites all)

\- Option 2: \*\*Merge\*\* (combines tap counts)

\- Option 3: \*\*Keep Both\*\* (asks per conflict)



\*\*\*



\## Screen 16: Import Success



```

┌─────────────────────────────────────┐

│                                     │

│         ✅                           │

│      Success!                       │

│                                     │

│  অগ্রগতি সফলভাবে আমদানি হয়েছে!     │

│  Progress imported successfully!   │

│                                     │

│  ┌────────────────────────────┐    │

│  │                            │    │

│  │  নতুন ডিভাইসে চালিয়ে যাও  │    │

│  │  Continue on new device    │    │

│  │                            │    │

│  │  সব পছন্দের আইটেম আছে      │    │

│  │  All favorites restored    │    │

│  │                            │    │

│  └────────────────────────────┘    │

│                                     │

│  \[  শেখা শুরু করো / Start Learning ]│

│                                     │

└─────────────────────────────────────┘

```



\*\*\*



\# 🎨 FEATURE 4: DRAW WHAT YOU LEARNED



\*\*\*



\## Screen 17: Drawing Mode Unlock Notification



```

┌────────────────────────┐

│  🎨 নতুন সুবিধা!        │

│     New Feature!       │

│                        │

│  তুমি "গরু" ৫ বার শুনেছো│

│  You heard "cow"       │

│  5 times!              │

│                        │

│      🐄                 │

│                        │

│  এখন আঁকতে পারো!        │

│  Now you can draw it!  │

│                        │

│  \[  আঁকো / Draw  ]     │

│                        │

│  \[  পরে / Later  ]     │

│                        │

└────────────────────────┘

```



\*\*Unlock Logic:\*\*

```dart

class DrawingUnlock {

&nbsp; Map<String, int> tileTapCounts = {};

&nbsp; 

&nbsp; bool canDrawItem(String itemId) {

&nbsp;   return tileTapCounts\[itemId] ?? 0 >= 5;

&nbsp; }

&nbsp; 

&nbsp; void checkAndShowUnlock(String itemId) {

&nbsp;   if (canDrawItem(itemId) \&\& !hasDrawnBefore(itemId)) {

&nbsp;     showDrawingUnlockDialog(itemId);

&nbsp;   }

&nbsp; }

}

```



\*\*\*



\## Screen 18: Drawing Canvas



```

┌─────────────────────────────────────┐

│  ✕ Close        গরু আঁকো    💾 Save │

│                                     │

│  ┌─────────────────────────────┐   │

│  │                             │   │

│  │                             │   │

│  │                             │   │

│  │     Blank Canvas            │   │

│  │     (Child draws here)      │   │

│  │                             │   │

│  │                             │   │

│  │                             │   │

│  └─────────────────────────────┘   │

│                                     │

│  Color Palette:                    │

│  ⬛ 🟢 🔵 🟡 🔴 ⚪                   │

│                                     │

│  Tools:                            │

│  \[🖌️ Brush] \[🗑️ Clear] \[↩️ Undo]   │

│                                     │

│  Brush Size: ⚪━━━●━━━━━⚪           │

│              Small      Large      │

│                                     │

└─────────────────────────────────────┘

```



\*\*Canvas Specs:\*\*

\- Size: `ScreenUtil.screenWidth \* 0.9` × `ScreenUtil.screenHeight \* 0.5`

\- Background: White

\- Brush sizes: 10.w, 20.w, 30.w (large for fat fingers)

\- Colors: 6 basic colors (black, green, blue, yellow, red, white)



\*\*Flutter Implementation:\*\*

```dart

class DrawingCanvas extends StatefulWidget {

&nbsp; final String itemName; // "গরু"

&nbsp; 

&nbsp; @override

&nbsp; State<DrawingCanvas> createState() => \_DrawingCanvasState();

}



class \_DrawingCanvasState extends State<DrawingCanvas> {

&nbsp; List<DrawingPoint> points = \[];

&nbsp; Color selectedColor = Colors.black;

&nbsp; double brushSize = 20.0;

&nbsp; 

&nbsp; @override

&nbsp; Widget build(BuildContext context) {

&nbsp;   return GestureDetector(

&nbsp;     onPanUpdate: (details) {

&nbsp;       setState(() {

&nbsp;         points.add(DrawingPoint(

&nbsp;           offset: details.localPosition,

&nbsp;           paint: Paint()

&nbsp;             ..color = selectedColor

&nbsp;             ..strokeWidth = brushSize

&nbsp;             ..strokeCap = StrokeCap.round,

&nbsp;         ));

&nbsp;       });

&nbsp;     },

&nbsp;     onPanEnd: (details) {

&nbsp;       points.add(DrawingPoint(offset: null, paint: Paint()));

&nbsp;     },

&nbsp;     child: CustomPaint(

&nbsp;       painter: DrawingPainter(points: points),

&nbsp;       size: Size.infinite,

&nbsp;     ),

&nbsp;   );

&nbsp; }

}



class DrawingPainter extends CustomPainter {

&nbsp; final List<DrawingPoint> points;

&nbsp; 

&nbsp; DrawingPainter({required this.points});

&nbsp; 

&nbsp; @override

&nbsp; void paint(Canvas canvas, Size size) {

&nbsp;   for (int i = 0; i < points.length - 1; i++) {

&nbsp;     if (points\[i].offset != null \&\& points\[i + 1].offset != null) {

&nbsp;       canvas.drawLine(

&nbsp;         points\[i].offset!,

&nbsp;         points\[i + 1].offset!,

&nbsp;         points\[i].paint,

&nbsp;       );

&nbsp;     }

&nbsp;   }

&nbsp; }

&nbsp; 

&nbsp; @override

&nbsp; bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}

```



\*\*\*



\## Screen 19: Drawing Complete - Save Confirmation



```

┌─────────────────────────────────────┐

│                                     │

│      তোমার আঁকা গরু                  │

│      Your Drawing of Cow            │

│                                     │

│  ┌─────────────────────────────┐   │

│  │                             │   │

│  │   (Child's drawing preview)│   │

│  │                             │   │

│  └─────────────────────────────┘   │

│                                     │

│  চমৎকার আঁকা!                       │

│  Beautiful drawing!                │

│                                     │

│  কোথায় সংরক্ষণ করবে?               │

│  Where to save?                    │

│                                     │

│  \[  📱 অ্যাপে রাখো  ]              │

│      Keep in App                   │

│                                     │

│  \[  📤 শেয়ার করো  ]               │

│      Share to WhatsApp             │

│                                     │

│  \[  🗑️ মুছে ফেলো  ]                │

│      Delete                        │

│                                     │

└─────────────────────────────────────┘

```



\*\*Save Options:\*\*

1\. \*\*Keep in App\*\*: Stores in local gallery (accessible in Favorites)

2\. \*\*Share\*\*: Opens share dialog (WhatsApp, Gallery)

3\. \*\*Delete\*\*: Discards (can redraw anytime)



\*\*\*



\## Screen 20: Drawing Gallery (My Drawings)



```

┌─────────────────────────────────────┐

│  ← Back                             │

│                                     │

│  🎨 আমার আঁকা                       │

│     My Drawings                     │

│  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━  │

│                                     │

│  ┌────────┐  ┌────────┐  ┌────────┐│

│  │ \[🐄]   │  │ \[🥭]   │  │ \[🚜]   ││

│  │ গরু     │  │ আম      │  │ রিকশা   ││

│  │ Jan 26 │  │ Jan 25 │  │ Jan 24 ││

│  └────────┘  └────────┘  └────────┘│

│                                     │

│  ┌────────┐  ┌────────┐  ┌────────┐│

│  │ \[🐱]   │  │ \[+]    │  │        ││

│  │ বিড়াল   │  │ Draw   │  │        ││

│  │ Jan 23 │  │ More   │  │        ││

│  └────────┘  └────────┘  └────────┘│

│                                     │

│  Tap to view • Long press to share │

│                                     │

└─────────────────────────────────────┘

```



\*\*Grid Layout:\*\*

```dart

GridView.builder(

&nbsp; gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

&nbsp;   crossAxisCount: 3,

&nbsp;   mainAxisSpacing: 12.w,

&nbsp;   crossAxisSpacing: 12.w,

&nbsp;   childAspectRatio: 0.9,

&nbsp; ),

&nbsp; itemCount: drawings.length + 1, // +1 for "Draw More" button

&nbsp; itemBuilder: (context, index) {

&nbsp;   if (index == drawings.length) {

&nbsp;     return DrawMoreButton();

&nbsp;   }

&nbsp;   return DrawingThumbnail(drawing: drawings\[index]);

&nbsp; },

)

```



\*\*\*



\## 🎯 SUMMARY: NEW FEATURES WIREFRAMES COMPLETE



\### \*\*Total New Screens Added: 20\*\*



| Feature | Screens | Screen Numbers |

|---------|---------|----------------|

| \*\*Voice Recognition Practice\*\* | 5 screens | 1-5 |

| \*\*Parent-Child Duet Mode\*\* | 7 screens | 6-12 |

| \*\*QR Progress Sync\*\* | 4 screens | 13-16 |

| \*\*Draw What You Learned\*\* | 4 screens | 17-20 |



\### \*\*Updated Total App Screens:\*\*

\- Phase 1 MVP: 22 screens

\- Phase 2 Enhanced: 22 screens

\- Phase 3 Premium: 18 screens

\- \*\*NEW Features: 20 screens\*\*

\- \*\*GRAND TOTAL: 82 SCREENS\*\*

