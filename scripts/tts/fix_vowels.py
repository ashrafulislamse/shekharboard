#!/usr/bin/env python3
"""
Fix missing vowel audio files using gTTS (FREE Google Translate TTS)
These single-letter files failed with Camb.ai (minimum 3 chars required)
"""

from gtts import gTTS
from pathlib import Path

# Vowel data - single Bangla letters
VOWELS = [
    ('o', 'অ'),
    ('aa', 'আ'),
    ('i', 'ই'),
    ('ee', 'ঈ'),
    ('u', 'উ'),
    ('uu', 'ঊ'),
    ('ri', 'ঋ'),
    ('e', 'এ'),
    ('oi', 'ঐ'),
    ('oo', 'ও'),
    ('ou', 'ঔ'),
]

def main():
    # Generate for all voice folders
    folders = [
        'assets/audio/bn/alphabet/vowels',
        'assets/audio/bn-female/alphabet/vowels',
        'assets/audio/bn-anime/alphabet/vowels'
    ]
    
    total_generated = 0
    total_skipped = 0
    
    for folder in folders:
        output_dir = Path(folder)
        output_dir.mkdir(parents=True, exist_ok=True)
        
        print(f'\n{"="*50}')
        print(f'Generating in: {folder}')
        print("="*50)
        
        for vid, letter in VOWELS:
            output_file = output_dir / f'{vid}_word.mp3'
            
            if output_file.exists():
                print(f'  [SKIP] {letter} ({vid}_word.mp3) - already exists')
                total_skipped += 1
                continue
            
            try:
                # gTTS with Bangla - slow=True for clearer pronunciation
                tts = gTTS(text=letter, lang='bn', slow=True)
                tts.save(str(output_file))
                print(f'  [OK]   {letter} -> {output_file.name}')
                total_generated += 1
            except Exception as e:
                print(f'  [FAIL] {letter} - Error: {e}')
    
    print(f'\n{"="*50}')
    print('SUMMARY')
    print("="*50)
    print(f'  Generated: {total_generated}')
    print(f'  Skipped:   {total_skipped}')
    print(f'  Provider:  gTTS (FREE - Google Translate)')
    print("="*50)

if __name__ == "__main__":
    main()
