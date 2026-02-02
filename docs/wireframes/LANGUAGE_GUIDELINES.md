# 🌐 Language Guidelines for Touch & Learn Board

## Core Principle: All UI in Bangla, English via Code Localization

**STATUS: ✅ Wireframes Updated** (Last updated: January 2026)

---

## 🎯 Quick Summary

| Screen Type | Wireframe/Stitch | Flutter Code |
|-------------|------------------|--------------|
| **Child Screens** | বাংলা ONLY | `app_bn.arb` only |
| **Parent Screens** | বাংলা ONLY | `app_bn.arb` + `app_en.arb` |

**Key Rule**: ALL Stitch designs use Bangla text. English is added ONLY in Flutter code via localization files.

---

## 📱 Screen Type Classification

### 👶 CHILD-FACING SCREENS (Bangla Only)

These screens are used directly by children ages 1-5. They should display **Bangla text only** - no English translations.

| Screen # | Screen Name | Text Language |
|----------|-------------|---------------|
| 2 | Splash Screen | বাংলা only |
| 4 | Tutorial Overlay | বাংলা only (gestures + icons) |
| 5 | Main Learning Board | বাংলা only |
| 8-15 | Learning Content Screens | বাংলা only |
| 26 | Loading Skeleton | No text (visual only) |
| 28 | Session Time Limit | বাংলা only |
| 29-33 | Story Screens | বাংলা only |
| 34-41 | Game Screens | বাংলা only |
| 42-47 | Alphabet/Number Learning | বাংলা only |
| 48-50 | Accessibility Modes | বাংলা only |
| 51-54 | Cultural Content | বাংলা only |
| 59-62 | Session Management | বাংলা only |

**Rules for Child Screens:**
```
✅ CORRECT:
   - Button: "শোনো" (just Bangla)
   - Word: "গরু" (just Bangla)
   - Prompt: "ছবিতে টিপো" (just Bangla)

❌ WRONG:
   - Button: "শোনো / Listen" (mixed)
   - Word: "গরু (Cow)" (with translation)
   - Prompt: "ছবিতে টিপো / Tap the picture" (bilingual)
```

---

### 👨‍👩‍👧 PARENT-FACING SCREENS (Based on Language Preference)

Parents choose their preferred language during first launch (Screen 1). All parent-facing screens then display in **that chosen language only** - not bilingual.

| Screen # | Screen Name | Text Language |
|----------|-------------|---------------|
| 1 | Language Selection | Both shown (for selection) |
| 3 | Welcome Screen | Based on selection |
| 16 | Math Gate Dialog | Based on preference |
| 17 | Parent Settings | Based on preference |
| 18 | Parent Dashboard | Based on preference |
| 19-22 | Parent Tools | Based on preference |
| 23-25, 27 | Error/Warning Screens | Based on preference |
| 55-58 | Monetization Screens | Based on preference |

**Rules for Parent Screens:**
```
IF parent_language == "bn" (Bangla):
   - Show: "শব্দ বন্ধ করুন"
   - Show: "সেটিংস"
   
IF parent_language == "en" (English):
   - Show: "Turn off sound"
   - Show: "Settings"

❌ NEVER show both: "শব্দ বন্ধ / Turn off sound"
```

---

## 📝 Updated Text Patterns

### Learning Item Detail (Child Screen)
```
BEFORE (Wrong):
┌─────────────────────────────┐
│         গরু               │
│         Cow               │ ← Remove this
│                           │
│  🔊 শোনো / Listen         │ ← Change to: 🔊 শোনো
└─────────────────────────────┘

AFTER (Correct):
┌─────────────────────────────┐
│         গরু               │
│                           │
│      🔊 শোনো              │
└─────────────────────────────┘
```

### Parent Settings (Parent Screen)
```
BEFORE (Wrong - Bilingual):
┌─────────────────────────────┐
│  🔊 শব্দ / Sound           │ ← Mixed
│  চালু / ON    বন্ধ / OFF   │ ← Mixed
└─────────────────────────────┘

AFTER (If parent chose Bangla):
┌─────────────────────────────┐
│  🔊 শব্দ                    │
│  চালু ✓       বন্ধ         │
└─────────────────────────────┘

AFTER (If parent chose English):
┌─────────────────────────────┐
│  🔊 Sound                   │
│  ON ✓         OFF          │
└─────────────────────────────┘
```

---

## 🎯 Specific Text Updates Required

### Child Screen Updates (Remove English):

| Location | Current (Wrong) | Correct |
|----------|-----------------|---------|
| Listen button | শোনো / Listen | শোনো |
| Category badge | প্রাণী / Animals | প্রাণী |
| Syllable section | বর্ণ শিখো / Learn Syllables | বর্ণ শিখো |
| Swipe hint | পাশে সোয়াইপ করো / Swipe for more | পাশে সোয়াইপ করো |
| Completion text | তুমি সব শিখেছো! / You learned everything! | তুমি সব শিখেছো! |
| Game prompts | খুঁজে বের কর / Find It! | খুঁজে বের কর |
| Story title | গল্পের ঘর / Story World | গল্পের ঘর |
| Quiz prompt | উত্তর বেছে নাও / Choose your answer | উত্তর বেছে নাও |

### Parent Screen Updates (Use Language Variable):

```dart
// Implementation pattern
String getText(String key) {
  final parentLang = SettingsService.parentLanguage; // "bn" or "en"
  return translations[parentLang][key];
}

// Example usage
Text(getText('settings')),  // Shows "সেটিংস" or "Settings"
Text(getText('sound_on')),  // Shows "চালু" or "ON"
```

---

## 🔧 Implementation Notes

### 1. Localization Files
Create separate translation files:
- `lib/l10n/app_bn.arb` - Bangla strings
- `lib/l10n/app_en.arb` - English strings

### 2. Context Detection
```dart
bool isChildScreen(BuildContext context) {
  // Child screens: Main board, learning, games, stories
  final route = ModalRoute.of(context)?.settings.name;
  return childRoutes.contains(route);
}

Locale getScreenLocale(BuildContext context) {
  if (isChildScreen(context)) {
    return const Locale('bn'); // Always Bangla for child
  }
  return Locale(SettingsService.parentLanguage); // Parent's choice
}
```

### 3. UI Components
- Child buttons: Text-only in Bangla, rely on icons for understanding
- Parent buttons: Full text in chosen language
- Child: Large icons with minimal/Bangla text
- Parent: Standard text-heavy UI

---

## ✅ Summary

| Screen Type | Language Display | Example |
|-------------|------------------|---------|
| **Child screens** | Bangla only | "শোনো" |
| **Parent screens (Bangla selected)** | Bangla only | "সেটিংস" |
| **Parent screens (English selected)** | English only | "Settings" |
| **Language selection (Screen 1)** | Both (for choosing) | "বাংলা / English" |

**Key Insight**: The child is LEARNING Bangla, so showing English defeats the purpose. Parents can choose their comfort language, but it's a choice - not a forced bilingual display.
