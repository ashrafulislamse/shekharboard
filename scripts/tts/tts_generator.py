#!/usr/bin/env python3
"""
Touch & Learn Board - TTS Audio Generator
Generates Bangla audio files from vocabulary and story scripts.

Usage:
    py tts_generator.py --provider cambai --category all
    py tts_generator.py --provider google --category animals
"""

import os
import time
from pathlib import Path
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# ============================================================
# CONFIGURATION
# ============================================================

CONFIG = {
    "language": "bn-BD",
    "output_format": "mp3",
    "sample_rate": 44100,
    "speaking_rate": 0.85,  # Slower for children
    "pitch": 2.0,  # Slightly higher for friendly tone
    "output_dir": "../../assets/audio/bn",
}

# ============================================================
# VOCABULARY DATA
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
# TTS PROVIDER CLASSES
# ============================================================

class GoogleTTS:
    """Google Cloud Text-to-Speech provider."""
    
    def __init__(self):
        from google.cloud import texttospeech
        self.client = texttospeech.TextToSpeechClient()
        self.texttospeech = texttospeech
    
    def generate(self, text, output_path, rate=0.85, pitch=2.0):
        """Generate audio file from text."""
        synthesis_input = self.texttospeech.SynthesisInput(text=text)
        
        voice = self.texttospeech.VoiceSelectionParams(
            language_code="bn-BD",
            name="bn-BD-Standard-A",
            ssml_gender=self.texttospeech.SsmlVoiceGender.FEMALE
        )
        
        audio_config = self.texttospeech.AudioConfig(
            audio_encoding=self.texttospeech.AudioEncoding.MP3,
            speaking_rate=rate,
            pitch=pitch
        )
        
        response = self.client.synthesize_speech(
            input=synthesis_input,
            voice=voice,
            audio_config=audio_config
        )
        
        Path(output_path).parent.mkdir(parents=True, exist_ok=True)
        with open(output_path, "wb") as out:
            out.write(response.audio_content)
        
        return True


class ElevenLabsTTS:
    """ElevenLabs Text-to-Speech provider."""
    
    def __init__(self):
        import requests
        self.api_key = os.getenv("ELEVENLABS_API_KEY")
        self.voice_id = os.getenv("ELEVENLABS_VOICE_ID", "21m00Tcm4TlvDq8ikWAM")
        self.requests = requests
    
    def generate(self, text, output_path, rate=0.85, pitch=2.0):
        """Generate audio file from text."""
        url = f"https://api.elevenlabs.io/v1/text-to-speech/{self.voice_id}"
        
        headers = {
            "xi-api-key": self.api_key,
            "Content-Type": "application/json"
        }
        
        data = {
            "text": text,
            "model_id": "eleven_multilingual_v2",
            "voice_settings": {
                "stability": 0.75,
                "similarity_boost": 0.75,
                "speed": rate
            }
        }
        
        response = self.requests.post(url, headers=headers, json=data)
        
        if response.status_code == 200:
            Path(output_path).parent.mkdir(parents=True, exist_ok=True)
            with open(output_path, "wb") as f:
                f.write(response.content)
            return True
        else:
            print(f"Error: {response.status_code} - {response.text}")
            return False


class AzureTTS:
    """Azure Cognitive Services Text-to-Speech provider."""
    
    def __init__(self):
        import azure.cognitiveservices.speech as speechsdk
        self.speech_key = os.getenv("AZURE_SPEECH_KEY")
        self.speech_region = os.getenv("AZURE_SPEECH_REGION", "southeastasia")
        self.speechsdk = speechsdk
    
    def generate(self, text, output_path, rate=0.85, pitch=2.0):
        """Generate audio file from text."""
        speech_config = self.speechsdk.SpeechConfig(
            subscription=self.speech_key,
            region=self.speech_region
        )
        speech_config.speech_synthesis_voice_name = "bn-BD-NabanitaNeural"
        
        Path(output_path).parent.mkdir(parents=True, exist_ok=True)
        audio_config = self.speechsdk.audio.AudioOutputConfig(filename=output_path)
        
        synthesizer = self.speechsdk.SpeechSynthesizer(
            speech_config=speech_config,
            audio_config=audio_config
        )
        
        # SSML for rate and pitch control
        ssml = f"""
        <speak version="1.0" xmlns="http://www.w3.org/2001/10/synthesis" xml:lang="bn-BD">
            <voice name="bn-BD-NabanitaNeural">
                <prosody rate="{int((rate - 1) * 100)}%" pitch="{int(pitch)}%">
                    {text}
                </prosody>
            </voice>
        </speak>
        """
        
        result = synthesizer.speak_ssml_async(ssml).get()
        
        return result.reason == self.speechsdk.ResultReason.SynthesizingAudioCompleted


class CambAITTS:
    """Camb.ai Text-to-Speech provider using MARS models.
    
    Features:
    - Native Bengali (Bangladesh) support: bn-bd
    - MARS models: mars-pro, mars-flash, mars-instruct
    - Voice cloning capability
    - Streaming support for real-time playback
    """
    
    def __init__(self):
        import requests
        self.api_key = os.getenv("CAMBAI_API_KEY")
        self.voice_id = int(os.getenv("CAMBAI_VOICE_ID", "147320"))
        self.requests = requests
        self.base_url = "https://client.camb.ai/apis"
        # Model options: mars-pro (balanced), mars-flash (fast), mars-instruct (emotional)
        self.speech_model = os.getenv("CAMBAI_MODEL", "mars-pro")
    
    def generate(self, text, output_path, rate=0.85, pitch=2.0):
        """Generate audio file from text using Camb.ai streaming API."""
        url = f"{self.base_url}/tts-stream"
        
        # Ensure text meets minimum length (3 chars)
        if len(text) < 3:
            text = text + "।"  # Add Bangla danda to extend
        
        headers = {
            "x-api-key": self.api_key,
            "Content-Type": "application/json"
        }
        
        # Camb.ai payload for Bengali (Bangladesh)
        # Note: user_instructions only works with mars-instruct model
        payload = {
            "text": text,
            "language": "bn-bd",  # Bengali (Bangladesh) - native support!
            "voice_id": self.voice_id,
            "speech_model": self.speech_model,
            "enhance_named_entities_pronunciation": True,
            "output_configuration": {
                "format": "mp3",
                "apply_enhancement": True
            },
            "voice_settings": {
                "enhance_reference_audio_quality": False,
                "maintain_source_accent": True  # Keep authentic Bangla accent
            },
            "inference_options": {
                "stability": 0.7,
                "temperature": 0.6,
                "inference_steps": 60,
                "speaker_similarity": 0.8
            }
        }
        
        # Add user_instructions only for mars-instruct model
        if self.speech_model == "mars-instruct":
            payload["user_instructions"] = "Warm, clear, friendly tone for young children aged 1-5."
        
        # Retry logic for network issues
        max_retries = 3
        for attempt in range(max_retries):
            try:
                # Stream the audio response
                response = self.requests.post(
                    url,
                    headers=headers,
                    json=payload,
                    stream=True,
                    timeout=120  # Increased timeout
                )
                
                if response.status_code != 200:
                    error_msg = response.text[:200] if response.text else "Unknown error"
                    print(f"    ❌ Camb.ai Error ({response.status_code}): {error_msg}")
                    return False
                
                # Save streamed audio to file
                Path(output_path).parent.mkdir(parents=True, exist_ok=True)
                with open(output_path, "wb") as audio_file:
                    for chunk in response.iter_content(chunk_size=1024):
                        if chunk:
                            audio_file.write(chunk)
                
                return True
                
            except (self.requests.exceptions.Timeout, self.requests.exceptions.ConnectionError) as e:
                if attempt < max_retries - 1:
                    print(f"    ⏳ Retry {attempt + 1}/{max_retries}...")
                    time.sleep(2)  # Wait before retry
                else:
                    print(f"    ❌ Camb.ai Timeout after {max_retries} attempts")
                    return False
            except self.requests.exceptions.RequestException as e:
                print(f"    ❌ Camb.ai API Error: {e}")
                return False
        
        return False


# ============================================================
# MAIN GENERATOR CLASS
# ============================================================

class TTSGenerator:
    """Main TTS generation orchestrator."""
    
    def __init__(self, provider="google"):
        self.output_dir = Path(CONFIG["output_dir"])
        self.provider_name = provider
        self.provider = self._get_provider(provider)
        self.stats = {"success": 0, "failed": 0, "skipped": 0}
    
    def _get_provider(self, name):
        providers = {
            "google": GoogleTTS,
            "elevenlabs": ElevenLabsTTS,
            "azure": AzureTTS,
            "cambai": CambAITTS,
        }
        provider_class = providers.get(name)
        if provider_class is None:
            print(f"❌ Unknown provider: {name}")
            print(f"   Available: {', '.join(providers.keys())}")
            raise ValueError(f"Unknown provider: {name}")
        return provider_class()
    
    def generate_category(self, category_name, items, subfolder):
        """Generate audio for a vocabulary category."""
        print(f"\n{'='*50}")
        print(f"📁 Generating: {category_name}")
        print(f"{'='*50}")
        
        output_folder = self.output_dir / subfolder
        output_folder.mkdir(parents=True, exist_ok=True)
        
        for item in items:
            item_id = item["id"]
            
            # Generate word-only audio
            word_path = output_folder / f"{item_id}_word.mp3"
            if not word_path.exists():
                text = item.get("word", item["bn"])
                print(f"  🔊 {text} → {word_path.name}")
                try:
                    self.provider.generate(text, str(word_path))
                    self.stats["success"] += 1
                except Exception as e:
                    print(f"    ❌ Error: {e}")
                    self.stats["failed"] += 1
                time.sleep(0.5)  # Rate limiting
            else:
                self.stats["skipped"] += 1
            
            # Generate description audio
            if "desc" in item:
                desc_path = output_folder / f"{item_id}_desc.mp3"
                if not desc_path.exists():
                    print(f"  🔊 {item['desc'][:30]}... → {desc_path.name}")
                    try:
                        self.provider.generate(item["desc"], str(desc_path))
                        self.stats["success"] += 1
                    except Exception as e:
                        print(f"    ❌ Error: {e}")
                        self.stats["failed"] += 1
                    time.sleep(0.5)
                else:
                    self.stats["skipped"] += 1
    
    def generate_rhymes(self):
        """Generate audio for nursery rhymes."""
        print(f"\n{'='*50}")
        print(f"🎵 Generating: Rhymes")
        print(f"{'='*50}")
        
        for rhyme_id, rhyme_data in RHYMES.items():
            rhyme_folder = self.output_dir / "rhymes" / rhyme_id
            rhyme_folder.mkdir(parents=True, exist_ok=True)
            
            # Full rhyme
            full_path = rhyme_folder / "full.mp3"
            if not full_path.exists():
                print(f"  🎵 {rhyme_data['title']} (full)")
                try:
                    self.provider.generate(
                        rhyme_data["full"], 
                        str(full_path),
                        rate=0.8  # Slower for rhymes
                    )
                    self.stats["success"] += 1
                except Exception as e:
                    print(f"    ❌ Error: {e}")
                    self.stats["failed"] += 1
                time.sleep(0.5)
            else:
                self.stats["skipped"] += 1
            
            # Individual verses
            for i, verse in enumerate(rhyme_data["verses"], 1):
                verse_path = rhyme_folder / f"verse_{i:02d}.mp3"
                if not verse_path.exists():
                    print(f"  🎵 {rhyme_data['title']} (verse {i})")
                    try:
                        self.provider.generate(verse, str(verse_path), rate=0.8)
                        self.stats["success"] += 1
                    except Exception as e:
                        print(f"    ❌ Error: {e}")
                        self.stats["failed"] += 1
                    time.sleep(0.5)
                else:
                    self.stats["skipped"] += 1
    
    def generate_stories(self):
        """Generate audio for stories."""
        print(f"\n{'='*50}")
        print(f"📖 Generating: Stories")
        print(f"{'='*50}")
        
        for story_id, story_data in STORIES.items():
            story_folder = self.output_dir / "stories" / story_id
            story_folder.mkdir(parents=True, exist_ok=True)
            
            for i, page_text in enumerate(story_data["pages"], 1):
                page_path = story_folder / f"page_{i:02d}.mp3"
                if not page_path.exists():
                    print(f"  📖 {story_data['title']} (page {i})")
                    try:
                        self.provider.generate(
                            page_text, 
                            str(page_path),
                            rate=0.75  # Even slower for stories
                        )
                        self.stats["success"] += 1
                    except Exception as e:
                        print(f"    ❌ Error: {e}")
                        self.stats["failed"] += 1
                    time.sleep(0.5)
                else:
                    self.stats["skipped"] += 1
    
    def generate_all(self):
        """Generate all audio files."""
        print("\n" + "="*60)
        print("🚀 Touch & Learn Board - TTS Audio Generator")
        print(f"   Provider: {self.provider_name.upper()}")
        print("="*60)
        
        # Vocabulary categories
        self.generate_category("Animals (পশু)", ANIMALS, "animals")
        self.generate_category("Fruits (ফল)", FRUITS, "fruits")
        self.generate_category("Vehicles (যানবাহন)", VEHICLES, "vehicles")
        self.generate_category("Numbers (সংখ্যা)", NUMBERS, "numbers")
        self.generate_category("Colors (রং)", COLORS, "colors")
        self.generate_category("Vowels (স্বরবর্ণ)", VOWELS, "alphabet/vowels")
        self.generate_category("Feedback", FEEDBACK, "feedback")
        
        # Rhymes and stories
        self.generate_rhymes()
        self.generate_stories()
        
        # Summary
        self._print_summary()
    
    def _print_summary(self):
        """Print generation summary."""
        print("\n" + "="*60)
        print("📊 Generation Complete!")
        print("="*60)
        print(f"  ✅ Success: {self.stats['success']}")
        print(f"  ❌ Failed:  {self.stats['failed']}")
        print(f"  ⏭️  Skipped: {self.stats['skipped']}")
        print(f"  📁 Output:  {self.output_dir.absolute()}")
        print("="*60)


# ============================================================
# CLI INTERFACE
# ============================================================

def main():
    import argparse
    
    parser = argparse.ArgumentParser(
        description="Generate TTS audio for Touch & Learn Board",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  py tts_generator.py --provider cambai --category all
  py tts_generator.py --provider google --category animals
  py tts_generator.py --provider azure --category rhymes
  py tts_generator.py --list-categories
        """
    )
    parser.add_argument(
        "--provider", 
        choices=["google", "elevenlabs", "azure", "cambai"],
        default="cambai",
        help="TTS provider to use (cambai recommended for best Bangla support)"
    )
    parser.add_argument(
        "--category",
        choices=["animals", "fruits", "vehicles", "numbers", "colors", 
                 "alphabet", "feedback", "rhymes", "stories", "all"],
        default="all",
        help="Category to generate"
    )
    parser.add_argument(
        "--list-categories",
        action="store_true",
        help="List all available categories with item counts"
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Show what would be generated without creating files"
    )
    
    args = parser.parse_args()
    
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
        total = len(ANIMALS) + len(FRUITS) + len(VEHICLES) + len(NUMBERS) + len(COLORS) + len(VOWELS) + len(FEEDBACK)
        print(f"  Total vocabulary: {total} items")
        return
    
    if args.dry_run:
        print("\n🔍 Dry Run - No files will be created")
        print(f"   Provider: {args.provider}")
        print(f"   Category: {args.category}")
        return
    
    try:
        generator = TTSGenerator(provider=args.provider)
    except Exception as e:
        print(f"\n❌ Failed to initialize {args.provider} provider:")
        print(f"   {e}")
        print("\n💡 Make sure you have:")
        print("   1. Created .env file from .env.example")
        print("   2. Added your API keys")
        print("   3. Installed required packages: pip install -r requirements.txt")
        return
    
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
