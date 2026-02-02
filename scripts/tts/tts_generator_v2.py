#!/usr/bin/env python3
"""
Touch & Learn Board - Enhanced TTS Audio Generator v2
======================================================

Features:
- Multiple voice versions (male/female) with separate folders
- Official Camb.ai SDK support (recommended)
- Sound/Music generation for app effects
- Story narration with professional voices
- Text translation support
- Voice browser with gender filtering

Usage:
    py tts_generator_v2.py --provider cambai --voice male --category all
    py tts_generator_v2.py --provider cambai --voice female --category all
    py tts_generator_v2.py --list-voices --gender female
    py tts_generator_v2.py --generate-sound "Button click" --output click.mp3
    py tts_generator_v2.py --generate-music "Cheerful children's tune" --output bg_music.mp3
"""

import os
import sys
import time
import json
from pathlib import Path
from dotenv import load_dotenv
from typing import Optional, Literal

# Load environment variables
load_dotenv()

# ============================================================
# CONFIGURATION
# ============================================================

CONFIG = {
    "language": "bn-bd",
    "output_format": "mp3",
    "sample_rate": 48000,
    "speaking_rate": 0.85,
    "pitch": 2.0,
    # Voice configurations
    "voices": {
        "male": {
            "id": 147320,
            "folder": "assets/audio/bn",
            "name": "Male Voice (Default)"
        },
        "female": {
            "id": 144300,
            "folder": "assets/audio/bn-female", 
            "name": "Female Voice (Gentle Narrator)"
        },
        "anime": {
            "id": 147342,
            "folder": "assets/audio/bn-anime",
            "name": "Anime Protagonist (Age 14)"
        }
    },
    "default_voice": "female",
}

# ============================================================
# VOCABULARY DATA (Same as v1)
# ============================================================

ANIMALS = [
    {"id": "goru", "bn": "গরু", "desc": "গরু। গরু দুধ দেয়।"},
    {"id": "chhagol", "bn": "ছাগল", "desc": "ছাগল। ছাগল ঘাস খায়।"},
    {"id": "bhera", "bn": "ভেড়া", "desc": "ভেড়া। ভেড়ার পশম নরম।"},
    {"id": "ghora", "bn": "ঘোড়া", "desc": "ঘোড়া। ঘোড়া দ্রুত দৌড়ায়।"},
    {"id": "murgi", "bn": "মুরগি", "desc": "মুরগি। মুরগি ডিম দেয়।"},
    {"id": "hash", "bn": "হাঁস", "desc": "হাঁস। হাঁস পানিতে সাঁতার কাটে।"},
    {"id": "kobutor", "bn": "কবুতর", "desc": "কবুতর। কবুতর আকাশে উড়ে।"},
    {"id": "bagh", "bn": "বাঘ", "desc": "বাঘ। বাঘ বাংলাদেশের জাতীয় পশু।"},
    {"id": "singho", "bn": "সিংহ", "desc": "সিংহ। সিংহ জঙ্গলের রাজা।"},
    {"id": "hati", "bn": "হাতি", "desc": "হাতি। হাতি অনেক বড়।"},
    {"id": "banor", "bn": "বানর", "desc": "বানর। বানর গাছে লাফায়।"},
    {"id": "bhaluk", "bn": "ভালুক", "desc": "ভালুক। ভালুক মধু খায়।"},
    {"id": "horin", "bn": "হরিণ", "desc": "হরিণ। হরিণ খুব সুন্দর।"},
    {"id": "sheyal", "bn": "শেয়াল", "desc": "শেয়াল। শেয়াল চালাক।"},
    {"id": "khorgosh", "bn": "খরগোশ", "desc": "খরগোশ। খরগোশ গাজর খায়।"},
    {"id": "biral", "bn": "বিড়াল", "desc": "বিড়াল। বিড়াল মিউ মিউ করে।"},
    {"id": "kukur", "bn": "কুকুর", "desc": "কুকুর। কুকুর ঘেউ ঘেউ করে।"},
    {"id": "machh", "bn": "মাছ", "desc": "মাছ। মাছ পানিতে সাঁতার কাটে।"},
    {"id": "kumir", "bn": "কুমির", "desc": "কুমির। কুমির নদীতে থাকে।"},
    {"id": "byang", "bn": "ব্যাঙ", "desc": "ব্যাঙ। ব্যাঙ লাফায়।"},
    {"id": "kankra", "bn": "কাঁকড়া", "desc": "কাঁকড়ার আটটা পা।"},
    {"id": "kochchop", "bn": "কচ্ছপ", "desc": "কচ্ছপ। কচ্ছপ ধীরে চলে।"},
    {"id": "pakhi", "bn": "পাখি", "desc": "পাখি। পাখি আকাশে উড়ে।"},
    {"id": "kak", "bn": "কাক", "desc": "কাক। কাক কা কা করে।"},
    {"id": "chorui", "bn": "চড়ুই", "desc": "চড়ুই। চড়ুই ছোট পাখি।"},
    {"id": "moyna", "bn": "ময়না", "desc": "ময়না। ময়না কথা বলে।"},
    {"id": "tiya", "bn": "টিয়া", "desc": "টিয়া। টিয়া সবুজ রঙের।"},
    {"id": "projapoti", "bn": "প্রজাপতি", "desc": "প্রজাপতি। প্রজাপতি ফুলে বসে।"},
]

FRUITS = [
    {"id": "am", "bn": "আম", "desc": "আম। আম মিষ্টি ফল।"},
    {"id": "kola", "bn": "কলা", "desc": "কলা। কলা হলুদ রঙের।"},
    {"id": "kathal", "bn": "কাঁঠাল", "desc": "কাঁঠাল। কাঁঠাল বড় ফল।"},
    {"id": "lichu", "bn": "লিচু", "desc": "লিচু। লিচু রসালো।"},
    {"id": "pepe", "bn": "পেঁপে", "desc": "পেঁপে। পেঁপে নরম ফল।"},
    {"id": "anaros", "bn": "আনারস", "desc": "আনারস। আনারস টক-মিষ্টি।"},
    {"id": "narikel", "bn": "নারিকেল", "desc": "নারিকেল। নারিকেলের পানি মিষ্টি।"},
    {"id": "tormuj", "bn": "তরমুজ", "desc": "তরমুজ। তরমুজ লাল রঙের।"},
    {"id": "komla", "bn": "কমলা", "desc": "কমলা। কমলা কমলা রঙের।"},
    {"id": "lebu", "bn": "লেবু", "desc": "লেবু। লেবু টক।"},
    {"id": "apel", "bn": "আপেল", "desc": "আপেল। আপেল লাল ফল।"},
    {"id": "angur", "bn": "আঙুর", "desc": "আঙুর। আঙুর ছোট ফল।"},
    {"id": "nashpati", "bn": "নাশপাতি", "desc": "নাশপাতি। নাশপাতি সবুজ ফল।"},
    {"id": "dalim", "bn": "ডালিম", "desc": "ডালিম। ডালিমের দানা লাল।"},
    {"id": "jam", "bn": "জাম", "desc": "জাম। জাম বেগুনি রঙের।"},
    {"id": "peyara", "bn": "পেয়ারা", "desc": "পেয়ারা। পেয়ারা সবুজ ফল।"},
    {"id": "bel", "bn": "বেল", "desc": "বেল। বেল শক্ত ফল।"},
    {"id": "amra", "bn": "আমড়া", "desc": "আমড়া। আমড়া টক ফল।"},
    {"id": "jamrul", "bn": "জামরুল", "desc": "জামরুল। জামরুল পানসে।"},
    {"id": "sofeda", "bn": "সফেদা", "desc": "সফেদা। সফেদা মিষ্টি।"},
    {"id": "strawberry", "bn": "স্ট্রবেরি", "desc": "স্ট্রবেরি। স্ট্রবেরি লাল।"},
    {"id": "khejur", "bn": "খেজুর", "desc": "খেজুর। খেজুর মিষ্টি।"},
]

VEHICLES = [
    {"id": "riksha", "bn": "রিকশা", "desc": "রিকশা। রিকশা তিন চাকার গাড়ি।"},
    {"id": "nouka", "bn": "নৌকা", "desc": "নৌকা। নৌকা পানিতে চলে।"},
    {"id": "gorur_gari", "bn": "গরুর গাড়ি", "desc": "গরুর গাড়ি। গরু গাড়ি টানে।"},
    {"id": "thela_gari", "bn": "ঠেলাগাড়ি", "desc": "ঠেলাগাড়ি। ঠেলাগাড়ি ঠেলে চলে।"},
    {"id": "cng", "bn": "সিএনজি", "desc": "সিএনজি। সিএনজি সবুজ গাড়ি।"},
    {"id": "bus", "bn": "বাস", "desc": "বাস। বাসে অনেক মানুষ যায়।"},
    {"id": "taxi", "bn": "ট্যাক্সি", "desc": "ট্যাক্সি। ট্যাক্সি হলুদ গাড়ি।"},
    {"id": "truck", "bn": "ট্রাক", "desc": "ট্রাক। ট্রাক মাল বহন করে।"},
    {"id": "gari", "bn": "গাড়ি", "desc": "গাড়ি। গাড়ি রাস্তায় চলে।"},
    {"id": "motorcycle", "bn": "মোটরসাইকেল", "desc": "মোটরসাইকেল। মোটরসাইকেল দুই চাকার।"},
    {"id": "cycle", "bn": "সাইকেল", "desc": "সাইকেল। সাইকেল প্যাডেলে চলে।"},
    {"id": "scooter", "bn": "স্কুটার", "desc": "স্কুটার। স্কুটার ছোট গাড়ি।"},
    {"id": "train", "bn": "ট্রেন", "desc": "ট্রেন। ট্রেন লাইনের উপর চলে।"},
    {"id": "launch", "bn": "লঞ্চ", "desc": "লঞ্চ। লঞ্চ নদীতে চলে।"},
    {"id": "biman", "bn": "বিমান", "desc": "বিমান। বিমান আকাশে উড়ে।"},
    {"id": "helicopter", "bn": "হেলিকপ্টার", "desc": "হেলিকপ্টার। হেলিকপ্টার উপরে উড়ে।"},
    {"id": "tractor", "bn": "ট্রাক্টর", "desc": "ট্রাক্টর। ট্রাক্টর মাঠে চলে।"},
    {"id": "ambulance", "bn": "অ্যাম্বুলেন্স", "desc": "অ্যাম্বুলেন্স। অ্যাম্বুলেন্স রোগী নেয়।"},
    {"id": "fire_truck", "bn": "ফায়ার ট্রাক", "desc": "ফায়ার ট্রাক। ফায়ার ট্রাক আগুন নেভায়।"},
    {"id": "police_car", "bn": "পুলিশ গাড়ি", "desc": "পুলিশ গাড়ি। পুলিশ গাড়ি আমাদের রক্ষা করে।"},
]

NUMBERS = [
    {"id": "shunno", "bn": "০", "word": "শূন্য", "desc": "শূন্য। কিছুই নেই।"},
    {"id": "ek", "bn": "১", "word": "এক", "desc": "এক। একটি আম।"},
    {"id": "dui", "bn": "২", "word": "দুই", "desc": "দুই। দুইটি কলা।"},
    {"id": "tin", "bn": "৩", "word": "তিন", "desc": "তিন। তিনটি আপেল।"},
    {"id": "char", "bn": "৪", "word": "চার", "desc": "চার। চারটি পাখি।"},
    {"id": "pach", "bn": "৫", "word": "পাঁচ", "desc": "পাঁচ। পাঁচটি আঙুল।"},
    {"id": "chhoy", "bn": "৬", "word": "ছয়", "desc": "ছয়। ছয়টি ফুল।"},
    {"id": "shat", "bn": "৭", "word": "সাত", "desc": "সাত। সাতটি রং।"},
    {"id": "at", "bn": "৮", "word": "আট", "desc": "আট। আটটি পা।"},
    {"id": "noy", "bn": "৯", "word": "নয়", "desc": "নয়। নয়টি মাছ।"},
    {"id": "dosh", "bn": "১০", "word": "দশ", "desc": "দশ। দশটি আঙুল।"},
]

COLORS = [
    {"id": "lal", "bn": "লাল", "desc": "লাল। আপেল লাল।"},
    {"id": "neel", "bn": "নীল", "desc": "নীল। আকাশ নীল।"},
    {"id": "shobuj", "bn": "সবুজ", "desc": "সবুজ। পাতা সবুজ।"},
    {"id": "holud", "bn": "হলুদ", "desc": "হলুদ। কলা হলুদ।"},
    {"id": "komla_rong", "bn": "কমলা", "desc": "কমলা। কমলা কমলা রঙের।"},
    {"id": "beguni", "bn": "বেগুনি", "desc": "বেগুনি। বেগুন বেগুনি।"},
    {"id": "golapi", "bn": "গোলাপি", "desc": "গোলাপি। গোলাপ গোলাপি।"},
    {"id": "shada", "bn": "সাদা", "desc": "সাদা। দুধ সাদা।"},
    {"id": "kalo", "bn": "কালো", "desc": "কালো। কাক কালো।"},
]

VOWELS = [
    {"id": "o", "bn": "অ", "desc": "অ। অজগর আসছে তেড়ে।"},
    {"id": "aa", "bn": "আ", "desc": "আ। আমটি আমি খাব।"},
    {"id": "i", "bn": "ই", "desc": "ই। ইলিশ মাছ সুস্বাদু।"},
    {"id": "ee", "bn": "ঈ", "desc": "ঈ। ঈগল পাখি বড়।"},
    {"id": "u", "bn": "উ", "desc": "উ। উট মরুভূমিতে থাকে।"},
    {"id": "uu", "bn": "ঊ", "desc": "ঊ। ঊষা মানে ভোর।"},
    {"id": "ri", "bn": "ঋ", "desc": "ঋ। ঋষি ধ্যান করে।"},
    {"id": "e", "bn": "এ", "desc": "এ। একটি ফুল সুন্দর।"},
    {"id": "oi", "bn": "ঐ", "desc": "ঐ। ঐরাবত হাতি।"},
    {"id": "oo", "bn": "ও", "desc": "ও। ওল সবজি।"},
    {"id": "ou", "bn": "ঔ", "desc": "ঔ। ঔষধ রোগ সারায়।"},
]

FEEDBACK = [
    {"id": "success_01", "bn": "সাবাস!"},
    {"id": "success_02", "bn": "বাহ্, দারুণ!"},
    {"id": "success_03", "bn": "তুমি পারো!"},
    {"id": "success_04", "bn": "অসাধারণ!"},
    {"id": "success_05", "bn": "একদম ঠিক!"},
    {"id": "success_06", "bn": "চমৎকার!"},
    {"id": "try_again_01", "bn": "আবার চেষ্টা করো।"},
    {"id": "try_again_02", "bn": "কোনো সমস্যা নেই।"},
    {"id": "try_again_03", "bn": "তুমি পারবে!"},
    {"id": "instruction_01", "bn": "ছবিতে টাচ করো।"},
    {"id": "instruction_02", "bn": "শব্দ শোনো।"},
    {"id": "instruction_03", "bn": "সঠিক উত্তর বেছে নাও।"},
]

RHYMES = {
    "adarsha_chhele": {
        "title": "আদর্শ ছেলে",
        "full": """আদর্শ ছেলে হতে যদি চাও,
সকাল সকাল ঘুম থেকে জাগো।
দাঁত মাজো, মুখ ধোও,
পরিষ্কার কাপড় পরো।
সালাম দাও বড়দের,
ভালোবাসো ছোটদের।
মন দিয়ে লেখাপড়া করো,
সবসময় সত্য বলো।""",
        "verses": [
            "আদর্শ ছেলে হতে যদি চাও, সকাল সকাল ঘুম থেকে জাগো।",
            "দাঁত মাজো, মুখ ধোও, পরিষ্কার কাপড় পরো।",
            "সালাম দাও বড়দের, ভালোবাসো ছোটদের।",
            "মন দিয়ে লেখাপড়া করো, সবসময় সত্য বলো।",
        ]
    },
    "khoka_ghumalo": {
        "title": "খোকা ঘুমালো",
        "full": """খোকা ঘুমালো, পাড়া জুড়ালো,
বর্গি এলো দেশে।
বুলবুলিতে ধান খেয়েছে,
খাজনা দেব কিসে?
ধান ফুরালো, পান ফুরালো,
খাজনার উপায় কি?
আর কটা দিন সবুর করো,
রসুন বুনেছি।""",
        "verses": [
            "খোকা ঘুমালো, পাড়া জুড়ালো, বর্গি এলো দেশে।",
            "বুলবুলিতে ধান খেয়েছে, খাজনা দেব কিসে?",
            "ধান ফুরালো, পান ফুরালো, খাজনার উপায় কি?",
            "আর কটা দিন সবুর করো, রসুন বুনেছি।",
        ]
    },
    "chand_mama": {
        "title": "আয় আয় চাঁদ মামা",
        "full": """আয় আয় চাঁদ মামা,
টিপ দিয়ে যা।
চাঁদের কপালে চাঁদ,
টিপ দিয়ে যা।
ধান ভানলে কুঁড়ো দেব,
মাছ কাটলে মুড়ো দেব,
কাল যে তোর বিয়ে,
নাইয়র যেও যা।""",
        "verses": [
            "আয় আয় চাঁদ মামা, টিপ দিয়ে যা।",
            "চাঁদের কপালে চাঁদ, টিপ দিয়ে যা।",
            "ধান ভানলে কুঁড়ো দেব, মাছ কাটলে মুড়ো দেব,",
            "কাল যে তোর বিয়ে, নাইয়র যেও যা।",
        ]
    },
    "hattima": {
        "title": "হাট্টিমা টিম টিম",
        "full": """হাট্টিমা টিম টিম,
তারা মাঠে পাড়ে ডিম।
তাদের খাড়া দুটো শিং,
তারা হাতি নয় ডিম।
একটা আছিল রাজা,
তার ছিল কত সাজা।
সেই রাজার রানী,
হেসে বলে জানি জানি।""",
        "verses": [
            "হাট্টিমা টিম টিম, তারা মাঠে পাড়ে ডিম।",
            "তাদের খাড়া দুটো শিং, তারা হাতি নয় ডিম।",
            "একটা আছিল রাজা, তার ছিল কত সাজা।",
            "সেই রাজার রানী, হেসে বলে জানি জানি।",
        ]
    },
}

STORIES = {
    "gorur_golpo": {
        "title": "গরুর গল্প",
        "pages": [
            "একটি সবুজ মাঠে একটি গরু ছিল। গরুর নাম ছিল মতি।",
            "মতি খুব ভালো গরু ছিল। সে প্রতিদিন সবুজ ঘাস খেত।",
            "মতি অনেক দুধ দিত। সবাই মতির দুধ খেত।",
            "বাচ্চারা মতিকে ভালোবাসত। তারা মতির সাথে খেলত।",
            "মতি খুশি ছিল। সে সবাইকে ভালোবাসত। গল্প শেষ!",
        ]
    },
    "biral_o_mach": {
        "title": "বিড়াল ও মাছ",
        "pages": [
            "মিনি একটি ছোট বিড়াল। মিনি মাছ খেতে ভালোবাসে।",
            "একদিন মিনি পুকুরে গেল। সে দেখল অনেক মাছ।",
            "মিনি পানিতে পা দিল। পানি ঠাণ্ডা ছিল!",
            "একটি মাছ লাফ দিল। মিনি ভয় পেল!",
            "মিনি বাড়ি ফিরে গেল। মা মিনিকে মাছ দিল। গল্প শেষ!",
        ]
    },
    "lal_bus": {
        "title": "লাল বাস",
        "pages": [
            "এটি একটি লাল বাস। বাসটি অনেক বড়।",
            "বাসে অনেক মানুষ ওঠে। সবাই বসে যায়।",
            "বাস চলতে শুরু করল। বুম বুম বুম!",
            "বাস শহরে যায়। গাছ, বাড়ি পার হয়।",
            "সবাই নেমে গেল। বাস বলল বিদায়! গল্প শেষ!",
        ]
    },
}


# ============================================================
# CAMB.AI API CLIENT (Enhanced with all features)
# ============================================================

class CambAIClient:
    """
    Enhanced Camb.ai API Client with all available features:
    - Text-to-Speech (TTS)
    - Voice listing with gender/age filtering
    - Sound/Music generation
    - Story creation
    - Text translation
    """
    
    def __init__(self, api_key: Optional[str] = None):
        import requests
        self.requests = requests
        self.api_key = api_key or os.getenv("CAMBAI_API_KEY")
        self.base_url = "https://client.camb.ai/apis"
        self.headers = {
            "x-api-key": self.api_key,
            "Content-Type": "application/json"
        }
        
        if not self.api_key:
            raise ValueError("CAMBAI_API_KEY not found in environment")
    
    # -------------------- TTS --------------------
    
    def text_to_speech(
        self,
        text: str,
        output_path: str,
        voice_id: int = 147320,
        language: str = "bn-bd",
        model: str = "mars-pro",
        rate: float = 0.85
    ) -> bool:
        """Generate speech from text using streaming TTS API."""
        
        # Ensure minimum text length
        if len(text) < 3:
            text = text + "।"
        
        payload = {
            "text": text,
            "language": language,
            "voice_id": voice_id,
            "speech_model": model,
            "enhance_named_entities_pronunciation": True,
            "output_configuration": {
                "format": "mp3",
                "apply_enhancement": True
            },
            "voice_settings": {
                "enhance_reference_audio_quality": False,
                "maintain_source_accent": True
            },
            "inference_options": {
                "stability": 0.7,
                "temperature": 0.6,
                "inference_steps": 60,
                "speaker_similarity": 0.8
            }
        }
        
        # Add instructions for mars-instruct
        if model == "mars-instruct":
            payload["user_instructions"] = "Warm, clear, friendly tone for young children."
        
        # Retry logic
        for attempt in range(3):
            try:
                response = self.requests.post(
                    f"{self.base_url}/tts-stream",
                    headers=self.headers,
                    json=payload,
                    stream=True,
                    timeout=120
                )
                
                if response.status_code != 200:
                    print(f"    ❌ Error ({response.status_code}): {response.text[:100]}")
                    return False
                
                Path(output_path).parent.mkdir(parents=True, exist_ok=True)
                with open(output_path, "wb") as f:
                    for chunk in response.iter_content(chunk_size=1024):
                        if chunk:
                            f.write(chunk)
                return True
                
            except Exception as e:
                if attempt < 2:
                    print(f"    ⏳ Retry {attempt + 1}/3...")
                    time.sleep(2)
                else:
                    print(f"    ❌ Failed: {e}")
                    return False
        return False
    
    # -------------------- VOICES --------------------
    
    def list_voices(self, gender: Optional[str] = None) -> list:
        """
        List all available voices with optional gender filter.
        
        Gender codes: 1 = Male, 2 = Female
        """
        try:
            response = self.requests.get(
                f"{self.base_url}/list-voices",
                headers=self.headers,
                timeout=30
            )
            
            if response.status_code != 200:
                print(f"Error listing voices: {response.text}")
                return []
            
            voices = response.json()
            
            # Filter by gender if specified
            if gender:
                gender_code = 1 if gender.lower() == "male" else 2
                voices = [v for v in voices if v.get("gender") == gender_code]
            
            return voices
            
        except Exception as e:
            print(f"Error: {e}")
            return []
    
    # -------------------- SOUND/MUSIC GENERATION --------------------
    
    def create_sound(
        self, 
        prompt: str, 
        audio_type: Literal["sound", "music"] = "sound",
        duration: float = 8.0
    ) -> Optional[str]:
        """
        Generate sound effects or music from text description.
        
        Args:
            prompt: Description of the sound/music to generate
            audio_type: "sound" for SFX, "music" for musical content
            duration: Length in seconds (max 10 for sound, fixed for music)
        
        Returns:
            task_id for checking status, or None on failure
        """
        payload = {
            "prompt": prompt,
            "audio_type": audio_type,
            "duration": min(duration, 10.0)  # Max 10 seconds
        }
        
        try:
            response = self.requests.post(
                f"{self.base_url}/text-to-sound",
                headers=self.headers,
                json=payload,
                timeout=30
            )
            
            if response.status_code == 200:
                result = response.json()
                return result.get("task_id")
            else:
                print(f"Error creating sound: {response.text}")
                return None
                
        except Exception as e:
            print(f"Error: {e}")
            return None
    
    def get_sound_status(self, task_id: str) -> dict:
        """Check the status of a sound generation task."""
        try:
            response = self.requests.get(
                f"{self.base_url}/text-to-sound/{task_id}",
                headers=self.headers,
                timeout=30
            )
            return response.json()
        except Exception as e:
            return {"status": "ERROR", "error": str(e)}
    
    def generate_sound_and_wait(
        self,
        prompt: str,
        output_path: str,
        audio_type: Literal["sound", "music"] = "sound",
        duration: float = 8.0,
        max_wait: int = 120
    ) -> bool:
        """Generate sound/music and wait for completion, then download."""
        
        print(f"  🎵 Creating {audio_type}: {prompt[:50]}...")
        
        task_id = self.create_sound(prompt, audio_type, duration)
        if not task_id:
            return False
        
        # Poll for completion
        start_time = time.time()
        while time.time() - start_time < max_wait:
            status = self.get_sound_status(task_id)
            
            if status.get("status") == "SUCCESS":
                audio_url = status.get("audio_url")
                if audio_url:
                    # Download the audio
                    response = self.requests.get(audio_url, timeout=60)
                    if response.status_code == 200:
                        Path(output_path).parent.mkdir(parents=True, exist_ok=True)
                        with open(output_path, "wb") as f:
                            f.write(response.content)
                        print(f"    ✅ Saved: {output_path}")
                        return True
                return False
            
            elif status.get("status") == "FAILED":
                print(f"    ❌ Generation failed")
                return False
            
            print(f"    ⏳ Processing... ({int(time.time() - start_time)}s)")
            time.sleep(5)
        
        print(f"    ❌ Timeout after {max_wait}s")
        return False
    
    # -------------------- STORY CREATION --------------------
    
    def create_story_audio(
        self,
        content: str,
        output_path: str,
        voice_id: int = 147320,
        title: str = "Story",
        language_id: int = 6  # Bengali
    ) -> bool:
        """
        Create narrated story from text content.
        
        Note: This creates a temp file and uses the Story API.
        For simple cases, TTS is recommended.
        """
        # For short stories, TTS is more efficient
        # Story API is better for long documents (.txt/.docx)
        return self.text_to_speech(content, output_path, voice_id)


# ============================================================
# ENHANCED TTS GENERATOR
# ============================================================

class TTSGeneratorV2:
    """Enhanced TTS generator with multi-voice support."""
    
    def __init__(
        self,
        voice: str = "male",
        provider: str = "cambai"
    ):
        self.voice_config = CONFIG["voices"].get(voice, CONFIG["voices"]["male"])
        self.voice_id = self.voice_config["id"]
        self.output_dir = Path(self.voice_config["folder"])
        self.voice_name = voice
        self.provider_name = provider
        
        # Initialize Camb.ai client
        self.client = CambAIClient()
        
        self.stats = {"success": 0, "failed": 0, "skipped": 0}
    
    def generate_category(self, category_name: str, items: list, subfolder: str):
        """Generate audio for a vocabulary category."""
        print(f"\n{'='*50}")
        print(f"📁 Generating: {category_name} ({self.voice_name} voice)")
        print(f"{'='*50}")
        
        output_folder = self.output_dir / subfolder
        output_folder.mkdir(parents=True, exist_ok=True)
        
        for item in items:
            item_id = item["id"]
            
            # Generate word audio
            word_path = output_folder / f"{item_id}_word.mp3"
            if not word_path.exists():
                text = item.get("word", item["bn"])
                print(f"  🔊 {text} → {word_path.name}")
                if self.client.text_to_speech(text, str(word_path), voice_id=self.voice_id):
                    self.stats["success"] += 1
                else:
                    self.stats["failed"] += 1
                time.sleep(0.5)
            else:
                self.stats["skipped"] += 1
            
            # Generate description audio
            if "desc" in item:
                desc_path = output_folder / f"{item_id}_desc.mp3"
                if not desc_path.exists():
                    print(f"  🔊 {item['desc'][:30]}... → {desc_path.name}")
                    if self.client.text_to_speech(item["desc"], str(desc_path), voice_id=self.voice_id):
                        self.stats["success"] += 1
                    else:
                        self.stats["failed"] += 1
                    time.sleep(0.5)
                else:
                    self.stats["skipped"] += 1
    
    def generate_rhymes(self):
        """Generate audio for nursery rhymes."""
        print(f"\n{'='*50}")
        print(f"🎵 Generating: Rhymes ({self.voice_name} voice)")
        print(f"{'='*50}")
        
        for rhyme_id, rhyme_data in RHYMES.items():
            rhyme_folder = self.output_dir / "rhymes" / rhyme_id
            rhyme_folder.mkdir(parents=True, exist_ok=True)
            
            # Full rhyme
            full_path = rhyme_folder / "full.mp3"
            if not full_path.exists():
                print(f"  🎵 {rhyme_data['title']} (full)")
                if self.client.text_to_speech(rhyme_data["full"], str(full_path), voice_id=self.voice_id):
                    self.stats["success"] += 1
                else:
                    self.stats["failed"] += 1
                time.sleep(0.5)
            else:
                self.stats["skipped"] += 1
            
            # Individual verses
            for i, verse in enumerate(rhyme_data["verses"], 1):
                verse_path = rhyme_folder / f"verse_{i:02d}.mp3"
                if not verse_path.exists():
                    print(f"  🎵 {rhyme_data['title']} (verse {i})")
                    if self.client.text_to_speech(verse, str(verse_path), voice_id=self.voice_id):
                        self.stats["success"] += 1
                    else:
                        self.stats["failed"] += 1
                    time.sleep(0.5)
                else:
                    self.stats["skipped"] += 1
    
    def generate_stories(self):
        """Generate audio for stories."""
        print(f"\n{'='*50}")
        print(f"📖 Generating: Stories ({self.voice_name} voice)")
        print(f"{'='*50}")
        
        for story_id, story_data in STORIES.items():
            story_folder = self.output_dir / "stories" / story_id
            story_folder.mkdir(parents=True, exist_ok=True)
            
            for i, page_text in enumerate(story_data["pages"], 1):
                page_path = story_folder / f"page_{i:02d}.mp3"
                if not page_path.exists():
                    print(f"  📖 {story_data['title']} (page {i})")
                    if self.client.text_to_speech(page_text, str(page_path), voice_id=self.voice_id):
                        self.stats["success"] += 1
                    else:
                        self.stats["failed"] += 1
                    time.sleep(0.5)
                else:
                    self.stats["skipped"] += 1
    
    def generate_all(self):
        """Generate all audio files."""
        print("\n" + "="*60)
        print("🚀 Touch & Learn Board - TTS Generator v2")
        print(f"   Voice: {self.voice_config['name']} (ID: {self.voice_id})")
        print(f"   Output: {self.output_dir}")
        print("="*60)
        
        self.generate_category("Animals (পশু)", ANIMALS, "animals")
        self.generate_category("Fruits (ফল)", FRUITS, "fruits")
        self.generate_category("Vehicles (যানবাহন)", VEHICLES, "vehicles")
        self.generate_category("Numbers (সংখ্যা)", NUMBERS, "numbers")
        self.generate_category("Colors (রং)", COLORS, "colors")
        self.generate_category("Vowels (স্বরবর্ণ)", VOWELS, "alphabet/vowels")
        self.generate_category("Feedback", FEEDBACK, "feedback")
        
        self.generate_rhymes()
        self.generate_stories()
        
        self._print_summary()
    
    def _print_summary(self):
        """Print generation summary."""
        print("\n" + "="*60)
        print("📊 Generation Complete!")
        print("="*60)
        print(f"  ✅ Success: {self.stats['success']}")
        print(f"  ❌ Failed:  {self.stats['failed']}")
        print(f"  ⏭️  Skipped: {self.stats['skipped']}")
        print(f"  🎤 Voice:   {self.voice_config['name']}")
        print(f"  📁 Output:  {self.output_dir.absolute()}")
        print("="*60)


# ============================================================
# CLI INTERFACE
# ============================================================

def print_voices(voices: list, limit: int = 20):
    """Pretty print voice list."""
    print(f"\n{'ID':<10} {'Name':<20} {'Gender':<10} {'Age':<6} {'Description'}")
    print("-" * 80)
    
    gender_map = {1: "Male", 2: "Female", None: "Unknown"}
    
    for voice in voices[:limit]:
        vid = voice.get("id", "?")
        name = voice.get("voice_name", "Unknown")[:18]
        gender = gender_map.get(voice.get("gender"), "Unknown")
        age = voice.get("age") or "?"
        desc = (voice.get("description") or "")[:30]
        print(f"{vid:<10} {name:<20} {gender:<10} {age:<6} {desc}")
    
    if len(voices) > limit:
        print(f"\n... and {len(voices) - limit} more voices")


def main():
    import argparse
    
    parser = argparse.ArgumentParser(
        description="Enhanced TTS Audio Generator v2 for Touch & Learn Board",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Generate with male voice (default)
  py tts_generator_v2.py --voice male --category all
  
  # Generate with female voice to separate folder
  py tts_generator_v2.py --voice female --category all
  
  # List female voices
  py tts_generator_v2.py --list-voices --gender female
  
  # Generate sound effect
  py tts_generator_v2.py --generate-sound "Cheerful button click" --output sounds/click.mp3
  
  # Generate background music
  py tts_generator_v2.py --generate-music "Happy children's tune, playful, 80 BPM" --output sounds/bg.mp3
  
  # Test a specific voice
  py tts_generator_v2.py --test-voice 144300 --text "হ্যালো, আমি বাংলায় কথা বলছি"

Voice Folders:
  Male:   assets/audio/bn/
  Female: assets/audio/bn-female/
        """
    )
    
    # Voice and category options
    parser.add_argument("--voice", choices=["male", "female", "anime"], default="male",
                        help="Voice version to use: male, female, or anime (default: male)")
    parser.add_argument("--category", choices=["animals", "fruits", "vehicles", "numbers", 
                        "colors", "alphabet", "feedback", "rhymes", "stories", "all"],
                        default="all", help="Category to generate")
    
    # Voice listing
    parser.add_argument("--list-voices", action="store_true",
                        help="List available Camb.ai voices")
    parser.add_argument("--gender", choices=["male", "female"],
                        help="Filter voices by gender (use with --list-voices)")
    
    # Voice testing
    parser.add_argument("--test-voice", type=int, metavar="VOICE_ID",
                        help="Test a specific voice ID")
    parser.add_argument("--text", default="হ্যালো! আমি বাংলায় কথা বলছি।",
                        help="Text to speak for voice test")
    
    # Sound/Music generation
    parser.add_argument("--generate-sound", metavar="PROMPT",
                        help="Generate sound effect from description")
    parser.add_argument("--generate-music", metavar="PROMPT",
                        help="Generate music from description")
    parser.add_argument("--output", "-o", metavar="FILE",
                        help="Output file path for sound/music generation")
    parser.add_argument("--duration", type=float, default=8.0,
                        help="Duration in seconds for sound generation (max 10)")
    
    # Utility
    parser.add_argument("--list-categories", action="store_true",
                        help="List all available categories")
    parser.add_argument("--dry-run", action="store_true",
                        help="Show what would be generated")
    
    args = parser.parse_args()
    
    # Initialize client for voice/sound operations
    try:
        client = CambAIClient()
    except ValueError as e:
        print(f"\n❌ {e}")
        print("   Make sure CAMBAI_API_KEY is set in .env file")
        return
    
    # List voices
    if args.list_voices:
        print("\n🎤 Fetching available voices...")
        voices = client.list_voices(gender=args.gender)
        if voices:
            filter_text = f" ({args.gender})" if args.gender else ""
            print(f"\nFound {len(voices)} voices{filter_text}:")
            print_voices(voices)
        else:
            print("No voices found")
        return
    
    # Test voice
    if args.test_voice:
        print(f"\n🔊 Testing voice ID {args.test_voice}...")
        output = f"test_voice_{args.test_voice}.mp3"
        if client.text_to_speech(args.text, output, voice_id=args.test_voice):
            print(f"✅ Saved: {output}")
        else:
            print("❌ Failed to generate test audio")
        return
    
    # Generate sound effect
    if args.generate_sound:
        if not args.output:
            print("❌ Please specify --output file path")
            return
        client.generate_sound_and_wait(
            args.generate_sound, 
            args.output, 
            audio_type="sound",
            duration=args.duration
        )
        return
    
    # Generate music
    if args.generate_music:
        if not args.output:
            print("❌ Please specify --output file path")
            return
        client.generate_sound_and_wait(
            args.generate_music,
            args.output,
            audio_type="music",
            duration=args.duration
        )
        return
    
    # List categories
    if args.list_categories:
        print("\n📚 Available Categories:")
        print("-" * 40)
        print(f"  animals   - {len(ANIMALS)} items")
        print(f"  fruits    - {len(FRUITS)} items")
        print(f"  vehicles  - {len(VEHICLES)} items")
        print(f"  numbers   - {len(NUMBERS)} items")
        print(f"  colors    - {len(COLORS)} items")
        print(f"  alphabet  - {len(VOWELS)} items (vowels)")
        print(f"  feedback  - {len(FEEDBACK)} items")
        print(f"  rhymes    - {len(RHYMES)} rhymes")
        print(f"  stories   - {len(STORIES)} stories")
        print("-" * 40)
        print("\n🎤 Voice Options:")
        for name, config in CONFIG["voices"].items():
            print(f"  {name:<10} - ID: {config['id']}, Output: {config['folder']}")
        return
    
    # Dry run
    if args.dry_run:
        print("\n🔍 Dry Run")
        print(f"   Voice:    {args.voice}")
        print(f"   Category: {args.category}")
        print(f"   Output:   {CONFIG['voices'][args.voice]['folder']}")
        return
    
    # Generate audio
    generator = TTSGeneratorV2(voice=args.voice)
    
    if args.category == "all":
        generator.generate_all()
    elif args.category == "animals":
        generator.generate_category("Animals", ANIMALS, "animals")
        generator._print_summary()
    elif args.category == "fruits":
        generator.generate_category("Fruits", FRUITS, "fruits")
        generator._print_summary()
    elif args.category == "vehicles":
        generator.generate_category("Vehicles", VEHICLES, "vehicles")
        generator._print_summary()
    elif args.category == "numbers":
        generator.generate_category("Numbers", NUMBERS, "numbers")
        generator._print_summary()
    elif args.category == "colors":
        generator.generate_category("Colors", COLORS, "colors")
        generator._print_summary()
    elif args.category == "alphabet":
        generator.generate_category("Vowels", VOWELS, "alphabet/vowels")
        generator._print_summary()
    elif args.category == "feedback":
        generator.generate_category("Feedback", FEEDBACK, "feedback")
        generator._print_summary()
    elif args.category == "rhymes":
        generator.generate_rhymes()
        generator._print_summary()
    elif args.category == "stories":
        generator.generate_stories()
        generator._print_summary()


if __name__ == "__main__":
    main()
