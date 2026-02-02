# 🎨 AI Image Generation Prompts - Master Index
## Touch & Learn Board - Asset Production Guide

**Project:** Touch & Learn Board (শেখার বোর্ড)  
**Target:** Bangladeshi Children Ages 1-5  
**AI Tools:** Midjourney v6, DALL-E 3, Stable Diffusion XL

---

## 📁 Prompt Files Overview

| # | File | Category | Items | Status |
|---|------|----------|-------|--------|
| 01 | [01-branding-icons.md](./01-branding-icons.md) | Branding & Icons | ~30 | ✅ |
| 02 | [02-animals-category.md](./02-animals-category.md) | Animals (পশু) | 28 | ✅ |
| 03 | [03-fruits-category.md](./03-fruits-category.md) | Fruits (ফল) | 22 | ✅ |
| 04 | [04-vehicles-category.md](./04-vehicles-category.md) | Vehicles (যানবাহন) | 20 | ✅ |
| 05 | [05-alphabet-numbers.md](./05-alphabet-numbers.md) | Alphabet & Numbers | 50+ | ✅ |
| 06 | [06-cultural-content.md](./06-cultural-content.md) | Cultural Content | 36 | ✅ |
| 07 | [07-stories-games-assets.md](./07-stories-games-assets.md) | Stories & Games | 30 | ✅ |

**Total Prompts:** ~220+ unique illustrations

---

## 🎯 Style Consistency Guide

### Global Style Keywords
```
ALWAYS INCLUDE:
├── "cute kawaii style"
├── "children's book illustration"
├── "flat design"
├── "soft shadows"
├── "clean outlines"
├── "pure white background for easy extraction"
├── "clean vector art"
├── "high quality 4K"
├── "isolated subject"
└── "PNG ready"
```

### Color Palette Reference
```
PRIMARY COLORS:
├── Warm Cream:    #FAF6F0  (backgrounds)
├── Soft Green:    #7FBA96  (primary accent)
├── Sky Blue:      #87CEEB  (secondary accent)
├── Mango Yellow:  #FFD54F  (highlight)
├── Clay Red:      #C75146  (warning/accent)
└── Dark Teal:     #1B5E5E  (text/icons)

USAGE:
├── Animals:       Green accent
├── Fruits:        Blue accent
├── Vehicles:      Yellow accent
├── Stories:       Red accent
├── Games:         Purple accent
└── Alphabet:      Teal accent
```

### Negative Prompts (Add to ALL)
```
--no scary, dark, realistic, photorealistic, 
complex details, detailed texture, 3D render, 
adult themes, violence, text errors, blurry, 
low quality, watermark, shadow heavy
```

---

## 🔧 Post-Processing Workflow

### Step 1: Generate Images
```
1. Copy prompt from markdown file
2. Paste into AI tool (Midjourney/DALL-E/SD)
3. Generate 4 variations
4. Select best result
5. Upscale if needed (Midjourney: U1-U4)
```

### Step 2: Remove Background
```
Tools:
├── remove.bg (online, quick)
├── Adobe Express (free tier)
├── Photoshop (Select Subject + Delete)
├── GIMP (Free, manual selection)
└── Canva Pro (Background Remover)

Process:
1. Upload generated image
2. Auto-remove white background
3. Check edges for artifacts
4. Export as PNG with transparency
```

### Step 3: Resize for App
```
Flutter Asset Sizes:
├── @1x: Base size (mdpi)
├── @2x: 2× base (xhdpi)
├── @3x: 3× base (xxhdpi)
└── @4x: 4× base (xxxhdpi)

Export Script (ImageMagick):
convert input.png -resize 150x150 output@1x.png
convert input.png -resize 300x300 output@2x.png
convert input.png -resize 450x450 output@3x.png
convert input.png -resize 600x600 output@4x.png
```

### Step 4: Organize Files
```
assets/
├── images/
│   ├── mascot/
│   │   ├── mithu_happy.png
│   │   └── mithu_sad.png
│   ├── animals/
│   │   ├── goru.png
│   │   └── biral.png
│   ├── fruits/
│   ├── vehicles/
│   ├── alphabet/
│   ├── numbers/
│   ├── cultural/
│   ├── stories/
│   └── games/
└── icons/
    ├── ui/
    └── categories/
```

---

## 📊 Asset Production Tracking

### Phase 1 - MVP (Priority)
```
MUST HAVE:
├── [ ] Mascot (4 expressions)
├── [ ] App Icon (3 variants)
├── [ ] Category Icons (5)
├── [ ] Animals (15 core)
├── [ ] Fruits (10 core)
├── [ ] Vehicles (10 core)
├── [ ] UI Icons (20)
└── [ ] Achievement Badges (3)

TOTAL: ~70 assets
```

### Phase 2 - Enhanced
```
SHOULD HAVE:
├── [ ] Remaining Animals (+13)
├── [ ] Remaining Fruits (+12)
├── [ ] Remaining Vehicles (+10)
├── [ ] Alphabet - Vowels (11)
├── [ ] Alphabet - Consonants (20 core)
├── [ ] Numbers (0-10)
├── [ ] Shapes (6)
└── [ ] Basic Backgrounds (3)

TOTAL: ~85 assets
```

### Phase 3 - Premium
```
NICE TO HAVE:
├── [ ] Full Consonants (+19)
├── [ ] Cultural - Festivals (6)
├── [ ] Cultural - Seasons (6)
├── [ ] Cultural - Family (7)
├── [ ] Cultural - Body Parts (8)
├── [ ] Cultural - Colors (9)
├── [ ] Story Illustrations (15+)
├── [ ] Game Assets (20)
└── [ ] Additional Backgrounds (5)

TOTAL: ~95 assets
```

---

## 💡 Tips for Best Results

### Midjourney v6 Tips
```
PARAMETERS:
├── --ar 1:1     Square (icons, tiles)
├── --ar 16:9   Landscape (stories)
├── --ar 9:16   Portrait (splash)
├── --style raw  More literal
├── --s 250     Medium stylization
└── --v 6       Latest version

PROMPT STRUCTURE:
Subject + Style + Colors + Background + Quality + Parameters
```

### DALL-E 3 Tips
```
ADJUSTMENTS:
├── Add "digital art" for cleaner results
├── Specify "no text" if text appears
├── Use "simple" and "minimal" keywords
└── Request "centered composition"
```

### Stable Diffusion XL Tips
```
SETTINGS:
├── CFG Scale: 7-9
├── Steps: 30-50
├── Sampler: DPM++ 2M Karras
└── Use negative prompt embedding

MODELS:
├── SDXL Base + Refiner
├── Playground v2.5
└── Juggernaut XL (for characters)
```

---

## 🔗 Quick Links

### Prompt Files
- [Branding & Icons](./01-branding-icons.md)
- [Animals Category](./02-animals-category.md)
- [Fruits Category](./03-fruits-category.md)
- [Vehicles Category](./04-vehicles-category.md)
- [Alphabet & Numbers](./05-alphabet-numbers.md)
- [Cultural Content](./06-cultural-content.md)
- [Stories & Games](./07-stories-games-assets.md)

### Related Docs
- [Blueprint](../Bluprint.md) - Master project spec
- [Wireframes](../wireframes/README.md) - UI/UX designs

---

## 📝 Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-01-25 | Initial prompt set created |

---

*Generated for Touch & Learn Board - শেখার বোর্ড*
