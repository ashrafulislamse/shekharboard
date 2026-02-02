#!/usr/bin/env python3
"""
Camb.ai Voice Finder - List and test available voices
"""

import os
import requests
from dotenv import load_dotenv

load_dotenv()

API_KEY = os.getenv("CAMBAI_API_KEY")
BASE_URL = "https://client.camb.ai/apis"

def list_voices():
    """List all available voices from Camb.ai"""
    url = f"{BASE_URL}/list-voices"
    headers = {"x-api-key": API_KEY}
    
    try:
        response = requests.get(url, headers=headers, timeout=30)
        response.raise_for_status()
        voices = response.json()
        
        print("\n" + "="*70)
        print("🎙️ Available Camb.ai Voices")
        print("="*70)
        
        # Filter for Bengali voices
        bn_voices = []
        all_voices = []
        
        for voice in voices:
            voice_id = voice.get('id', voice.get('voice_id', 'N/A'))
            name = voice.get('name', 'Unknown')
            gender = voice.get('gender', 'Unknown')
            language = voice.get('language', voice.get('languages', []))
            
            all_voices.append({
                'id': voice_id,
                'name': name,
                'gender': gender,
                'language': language
            })
            
            # Check if Bengali
            lang_str = str(language).lower()
            if 'bn' in lang_str or 'bengali' in lang_str or 'bangla' in lang_str:
                bn_voices.append({
                    'id': voice_id,
                    'name': name,
                    'gender': gender,
                    'language': language
                })
        
        # Print Bengali voices first
        if bn_voices:
            print("\n🇧🇩 BENGALI VOICES:")
            print("-"*70)
            for v in bn_voices:
                gender_emoji = "👩" if v['gender'].lower() == 'female' else "👨"
                print(f"  {gender_emoji} ID: {v['id']:10} | {v['name']:20} | {v['gender']:8} | {v['language']}")
        
        # Print first 20 voices as sample
        print(f"\n📋 ALL VOICES (showing first 30 of {len(all_voices)}):")
        print("-"*70)
        for v in all_voices[:30]:
            gender_emoji = "👩" if str(v['gender']).lower() == 'female' else "👨" if str(v['gender']).lower() == 'male' else "❓"
            print(f"  {gender_emoji} ID: {str(v['id']):10} | {str(v['name'])[:20]:20} | {str(v['gender']):8}")
        
        if len(all_voices) > 30:
            print(f"  ... and {len(all_voices) - 30} more voices")
        
        return voices
        
    except requests.exceptions.RequestException as e:
        print(f"❌ Error fetching voices: {e}")
        return None

def test_voice(voice_id, text="হ্যালো! আমি তোমার শিক্ষক।", output_file="test_voice.mp3"):
    """Test a specific voice with sample text"""
    url = f"{BASE_URL}/tts-stream"
    
    headers = {
        "x-api-key": API_KEY,
        "Content-Type": "application/json"
    }
    
    payload = {
        "text": text,
        "language": "bn-bd",
        "voice_id": int(voice_id),
        "speech_model": "mars-pro",
        "output_configuration": {
            "format": "mp3",
            "apply_enhancement": True
        },
        "inference_options": {
            "stability": 0.7,
            "temperature": 0.6
        }
    }
    
    print(f"\n🔊 Testing voice ID: {voice_id}")
    print(f"   Text: {text}")
    
    try:
        response = requests.post(url, headers=headers, json=payload, stream=True, timeout=60)
        
        if response.status_code == 200:
            with open(output_file, "wb") as f:
                for chunk in response.iter_content(chunk_size=1024):
                    if chunk:
                        f.write(chunk)
            print(f"   ✅ Saved to: {output_file}")
            return True
        else:
            print(f"   ❌ Error: {response.status_code} - {response.text[:200]}")
            return False
            
    except Exception as e:
        print(f"   ❌ Error: {e}")
        return False

def main():
    import argparse
    
    parser = argparse.ArgumentParser(description="Camb.ai Voice Finder")
    parser.add_argument("--list", action="store_true", help="List all available voices")
    parser.add_argument("--test", type=int, help="Test a specific voice ID")
    parser.add_argument("--text", type=str, default="হ্যালো! আমি তোমার শিক্ষক। আজ আমরা বাংলা শিখব।", 
                        help="Text to test")
    parser.add_argument("--output", type=str, default="test_voice.mp3", help="Output file")
    
    args = parser.parse_args()
    
    if args.list:
        list_voices()
    elif args.test:
        test_voice(args.test, args.text, args.output)
    else:
        # Default: list voices then offer to test
        voices = list_voices()
        
        print("\n" + "="*70)
        print("💡 To test a voice, run:")
        print("   py voice_finder.py --test <VOICE_ID>")
        print("   py voice_finder.py --test <VOICE_ID> --text \"তোমার টেক্সট\"")
        print("="*70)

if __name__ == "__main__":
    main()
