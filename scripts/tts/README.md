# 🎙️ TTS Automation - Quick Start Guide

## Setup (One-time)

### 1. Install Python
Download from https://python.org (3.10+)

### 2. Get API Keys

**⭐ Camb.ai (RECOMMENDED - Best Native Bangla!):**
1. Go to https://studio.camb.ai/
2. Sign up and get API key from "API" section
3. Choose voice ID from voice library (or clone your own!)
4. Copy API key to `.env` file
5. Docs: https://docs.camb.ai/

**Google Cloud TTS:**
1. Go to https://console.cloud.google.com/
2. Create new project → Enable "Cloud Text-to-Speech API"
3. Create Service Account → Download JSON key
4. Set path in `.env` file

**Azure TTS:**
1. Go to https://portal.azure.com/
2. Create "Speech" resource
3. Copy Key & Region to `.env`

### 3. Configure Environment
```bash
cd scripts/tts
copy .env.example .env
# Edit .env with your API keys
```

### 4. Install Dependencies
```bash
pip install -r requirements.txt
```

---

## Usage

### Windows (Double-click or CMD)
```cmd
run_tts.bat
run_tts.bat --category animals
run_tts.bat --provider cambai --category all    # ⭐ Recommended!
run_tts.bat --provider azure --category rhymes
```

### Python Direct
```bash
python generate_tts.py --provider cambai --category all  # ⭐ Best Bangla!
python generate_tts.py --provider google --category all
```

### Available Providers
- `cambai` - ⭐ Best native Bangla (bn-bd) with MARS models
- `google` - Good Bangla support, cost-effective
- `azure` - Neural voices, good quality
- `elevenlabs` - Best voice cloning, limited Bangla

### Available Categories
- `animals` - 28 animals
- `fruits` - 22 fruits  
- `vehicles` - 20 vehicles
- `numbers` - 0-10
- `colors` - 9 colors
- `alphabet` - Vowels
- `feedback` - UI messages
- `rhymes` - 4 nursery rhymes
- `stories` - 3 stories
- `all` - Everything

---

## Output

Files are saved to: `assets/audio/bn/`

```
assets/audio/bn/
├── animals/
│   ├── goru_word.mp3      (গরু)
│   └── goru_desc.mp3      (গরু। গরু দুধ দেয়।)
├── rhymes/
│   └── adarsha_chhele/
│       ├── full.mp3
│       └── verse_01.mp3
└── stories/
    └── gorur_golpo/
        └── page_01.mp3
```

---

## Cost Comparison

| Provider | Free Tier | Est. Cost | Bangla Quality |
|----------|-----------|-----------|----------------|
| **Camb.ai** | Pay-as-you-go | ~$5-15 | ⭐⭐⭐⭐⭐ Native bn-bd |
| Google | 4M chars/mo | ~$5 | ⭐⭐⭐⭐ Good |
| Azure | 500K chars/mo | ~$5 | ⭐⭐⭐⭐ Good |
| ElevenLabs | 10K chars/mo | ~$100 | ⭐⭐⭐ Multilingual |

**💡 Tip:** Use **Camb.ai** for best native Bengali (Bangladesh) support with MARS models!
