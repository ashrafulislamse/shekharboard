# 🎙️ TTS Audio Generation Log

**Generated:** January 25, 2026  
**Provider:** Camb.ai (MARS-Pro model)  
**Voice:** Male (Voice ID: 147320)  
**Language:** Bengali Bangladesh (bn-bd)

---

## ✅ Successfully Generated

| Category | Files | Status |
|----------|-------|--------|
| Animals (পশু) | 56 | ✅ Complete |
| Fruits (ফল) | 44 | ✅ Complete |
| Vehicles (যানবাহন) | 40 | ✅ Complete |
| Numbers (সংখ্যা) | 22 | ✅ Complete |
| Colors (রং) | 18 | ✅ Complete |
| Feedback | 12 | ✅ Complete |
| Rhymes (ছড়া) | 20 | ✅ Complete |
| Stories (গল্প) | 15 | ✅ Complete |
| **Total** | **227** | ✅ |

---

## ❌ Failed - Vowels (স্বরবর্ণ) Single Letters

**Reason:** Camb.ai API requires minimum 3 characters. Single Bangla vowels are too short.

| ID | Letter | Status | Notes |
|----|--------|--------|-------|
| o | অ | ❌ Failed | Too short (1 char) |
| aa | আ | ❌ Failed | Too short |
| i | ই | ❌ Failed | Too short |
| ee | ঈ | ❌ Failed | Too short |
| u | উ | ❌ Failed | Too short |
| uu | ঊ | ❌ Failed | Too short |
| ri | ঋ | ❌ Failed | Too short |
| e | এ | ❌ Failed | Too short |
| oi | ঐ | ❌ Failed | Too short |
| oo | ও | ❌ Failed | Too short |
| ou | ঔ | ❌ Failed | Too short |

**Note:** The **descriptions** (অ। অজগর আসছে তেড়ে।) were generated successfully.

### Solution Options:
1. Use Google Cloud TTS for single letters (supports short text)
2. Record manually with native speaker
3. Extend text: "অ অক্ষর" instead of just "অ"

---

## 📁 Output Structure

```
assets/audio/bn/
├── animals/          # 56 files (28 words + 28 descriptions)
├── fruits/           # 44 files
├── vehicles/         # 40 files
├── numbers/          # 22 files
├── colors/           # 18 files
├── alphabet/
│   └── vowels/       # 11 files (descriptions only)
├── feedback/         # 12 files
├── rhymes/
│   ├── adarsha_chhele/   # 5 files
│   ├── khoka_ghumalo/    # 5 files
│   ├── chand_mama/       # 5 files
│   └── hattima/          # 5 files
└── stories/
    ├── gorur_golpo/      # 5 files
    ├── biral_o_mach/     # 5 files
    └── lal_bus/          # 5 files
```

---

## 🔊 Voice Settings Used

```json
{
  "provider": "Camb.ai",
  "model": "mars-pro",
  "voice_id": 147320,
  "language": "bn-bd",
  "voice_type": "Male",
  "settings": {
    "stability": 0.7,
    "temperature": 0.6,
    "speaker_similarity": 0.8,
    "maintain_source_accent": true
  }
}
```

---

## 📝 TODO - Pending Audio

- [ ] Vowels single letters (অ, আ, ই, ঈ, উ, ঊ, ঋ, এ, ঐ, ও, ঔ) - 11 files
- [ ] Consonants (ব্যঞ্জনবর্ণ) - Not yet added to script
- [ ] Female voice version (for variety)
- [ ] Quiz audio prompts
- [ ] Game sound effects

---

## 🔄 Re-run Commands

```bash
# Generate specific category
py tts_generator.py --provider cambai --category animals

# Generate all
py tts_generator.py --provider cambai --category all

# List categories
py tts_generator.py --list-categories
```
