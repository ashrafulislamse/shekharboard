# 🔊 AI Text-to-Speech Scripts - Vocabulary Master
## Touch & Learn Board - Complete Audio Generation Guide

**Project:** Touch & Learn Board (শেখার বোর্ড)  
**Target:** Bangladeshi Children Ages 1-5  
**AI TTS Tools:** ElevenLabs, Google Cloud TTS, Azure TTS, Amazon Polly, Murf.ai

---

## 🎯 TTS Settings & Voice Guidelines

### Recommended AI TTS Tools

| Tool | Best For | Bangla Support | Notes |
|------|----------|----------------|-------|
| **ElevenLabs** | Natural voices | Limited (use phonetic) | Best quality |
| **Google Cloud TTS** | Bangla native | ✅ bn-BD | Recommended |
| **Azure TTS** | Bangla native | ✅ bn-BD | Good quality |
| **Amazon Polly** | Scalable | Limited | Use SSML |
| **Murf.ai** | Easy UI | Limited | Good for English |
| **Narakeet** | Batch processing | ✅ Bengali | Budget option |

### Voice Settings for Children's App

```
VOICE CHARACTERISTICS:
├── Gender: Female (preferred for children's apps)
├── Age: Young adult (warm, friendly tone)
├── Speed: 0.8x - 0.9x (slower for learning)
├── Pitch: Slightly higher (friendly, engaging)
├── Emotion: Happy, encouraging, warm
└── Clarity: Maximum (clear pronunciation)

GOOGLE CLOUD TTS (Recommended):
├── Language: bn-BD (Bengali - Bangladesh)
├── Voice: bn-BD-Standard-A (Female)
├── Speaking rate: 0.85
├── Pitch: +2.0
└── Volume gain: 0dB

AZURE TTS:
├── Language: bn-BD
├── Voice: bn-BD-NabanitaNeural (Female)
├── Rate: -15%
├── Pitch: +5%
└── Style: cheerful
```

### Audio File Specifications

```
OUTPUT FORMAT:
├── Format: MP3 (for app) / WAV (for editing)
├── Sample rate: 44100 Hz
├── Bit rate: 128 kbps (MP3)
├── Channels: Mono
├── Normalization: -3dB peak
└── Silence padding: 100ms start, 200ms end
```

---

## 🐄 পশু (Poshu) - Animals

### Farm Animals (গৃহপালিত প্রাণী)

| # | Bangla | Pronunciation | English | Audio Script |
|---|--------|---------------|---------|--------------|
| 1 | গরু | go-ru | Cow | গরু। গরু দুধ দেয়। |
| 2 | ছাগল | chha-gol | Goat | ছাগল। ছাগল ঘাস খায়। |
| 3 | ভেড়া | bhe-ra | Sheep | ভেড়া। ভেড়ার পশম নরম। |
| 4 | ঘোড়া | gho-ra | Horse | ঘোড়া। ঘোড়া দ্রুত দৌড়ায়। |
| 5 | মুরগি | mur-gi | Chicken | মুরগি। মুরগি ডিম দেয়। |
| 6 | হাঁস | hash | Duck | হাঁস। হাঁস পানিতে সাঁতার কাটে। |
| 7 | কবুতর | ko-bu-tor | Pigeon | কবুতর। কবুতর আকাশে উড়ে। |

### Wild Animals (বন্য প্রাণী)

| # | Bangla | Pronunciation | English | Audio Script |
|---|--------|---------------|---------|--------------|
| 8 | বাঘ | bagh | Tiger | বাঘ। বাঘ বাংলাদেশের জাতীয় পশু। |
| 9 | সিংহ | sing-ho | Lion | সিংহ। সিংহ জঙ্গলের রাজা। |
| 10 | হাতি | ha-ti | Elephant | হাতি। হাতি অনেক বড়। |
| 11 | বানর | ba-nor | Monkey | বানর। বানর গাছে লাফায়। |
| 12 | ভালুক | bha-luk | Bear | ভালুক। ভালুক মধু খায়। |
| 13 | হরিণ | ho-rin | Deer | হরিণ। হরিণ খুব সুন্দর। |
| 14 | শেয়াল | she-yal | Fox | শেয়াল। শেয়াল চালাক। |
| 15 | খরগোশ | khor-gosh | Rabbit | খরগোশ। খরগোশ গাজর খায়। |

### Pets (পোষা প্রাণী)

| # | Bangla | Pronunciation | English | Audio Script |
|---|--------|---------------|---------|--------------|
| 16 | বিড়াল | bi-ral | Cat | বিড়াল। বিড়াল মিউ মিউ করে। |
| 17 | কুকুর | ku-kur | Dog | কুকুর। কুকুর ঘেউ ঘেউ করে। |

### Water Animals (জলজ প্রাণী)

| # | Bangla | Pronunciation | English | Audio Script |
|---|--------|---------------|---------|--------------|
| 18 | মাছ | machh | Fish | মাছ। মাছ পানিতে সাঁতার কাটে। |
| 19 | কুমির | ku-mir | Crocodile | কুমির। কুমির নদীতে থাকে। |
| 20 | ব্যাঙ | byang | Frog | ব্যাঙ। ব্যাঙ লাফায়। |
| 21 | কাঁকড়া | kank-ra | Crab | কাঁকড়া। কাঁকড়ার আটটা পা। |
| 22 | কচ্ছপ | koch-chop | Turtle | কচ্ছপ। কচ্ছপ ধীরে চলে। |

### Birds (পাখি)

| # | Bangla | Pronunciation | English | Audio Script |
|---|--------|---------------|---------|--------------|
| 23 | পাখি | pa-khi | Bird | পাখি। পাখি আকাশে উড়ে। |
| 24 | কাক | kak | Crow | কাক। কাক কা কা করে। |
| 25 | চড়ুই | cho-rui | Sparrow | চড়ুই। চড়ুই ছোট পাখি। |
| 26 | ময়না | moy-na | Myna | ময়না। ময়না কথা বলে। |
| 27 | টিয়া | ti-ya | Parrot | টিয়া। টিয়া সবুজ রঙের। |
| 28 | প্রজাপতি | pro-ja-po-ti | Butterfly | প্রজাপতি। প্রজাপতি ফুলে বসে। |

### Full Audio Scripts (Animals)

```
=== WORD ONLY (1-2 seconds each) ===

গরু
ছাগল
ভেড়া
ঘোড়া
মুরগি
হাঁস
কবুতর
বাঘ
সিংহ
হাতি
বানর
ভালুক
হরিণ
শেয়াল
খরগোশ
বিড়াল
কুকুর
মাছ
কুমির
ব্যাঙ
কাঁকড়া
কচ্ছপ
পাখি
কাক
চড়ুই
ময়না
টিয়া
প্রজাপতি

=== WITH DESCRIPTION (3-5 seconds each) ===

গরু। গরু দুধ দেয়।
ছাগল। ছাগল ঘাস খায়।
ভেড়া। ভেড়ার পশম নরম।
ঘোড়া। ঘোড়া দ্রুত দৌড়ায়।
মুরগি। মুরগি ডিম দেয়।
হাঁস। হাঁস পানিতে সাঁতার কাটে।
কবুতর। কবুতর আকাশে উড়ে।
বাঘ। বাঘ বাংলাদেশের জাতীয় পশু।
সিংহ। সিংহ জঙ্গলের রাজা।
হাতি। হাতি অনেক বড়।
বানর। বানর গাছে লাফায়।
ভালুক। ভালুক মধু খায়।
হরিণ। হরিণ খুব সুন্দর।
শেয়াল। শেয়াল চালাক।
খরগোশ। খরগোশ গাজর খায়।
বিড়াল। বিড়াল মিউ মিউ করে।
কুকুর। কুকুর ঘেউ ঘেউ করে।
মাছ। মাছ পানিতে সাঁতার কাটে।
কুমির। কুমির নদীতে থাকে।
ব্যাঙ। ব্যাঙ লাফায়।
কাঁকড়া। কাঁকড়ার আটটা পা।
কচ্ছপ। কচ্ছপ ধীরে চলে।
পাখি। পাখি আকাশে উড়ে।
কাক। কাক কা কা করে।
চড়ুই। চড়ুই ছোট পাখি।
ময়না। ময়না কথা বলে।
টিয়া। টিয়া সবুজ রঙের।
প্রজাপতি। প্রজাপতি ফুলে বসে।
```

---

## 🍎 ফল (Fol) - Fruits

| # | Bangla | Pronunciation | English | Audio Script |
|---|--------|---------------|---------|--------------|
| 1 | আম | am | Mango | আম। আম মিষ্টি ফল। |
| 2 | কলা | ko-la | Banana | কলা। কলা হলুদ রঙের। |
| 3 | কাঁঠাল | kath-al | Jackfruit | কাঁঠাল। কাঁঠাল বড় ফল। |
| 4 | লিচু | li-chu | Lychee | লিচু। লিচু রসালো। |
| 5 | পেঁপে | pep-e | Papaya | পেঁপে। পেঁপে নরম ফল। |
| 6 | আনারস | a-na-ros | Pineapple | আনারস। আনারস টক-মিষ্টি। |
| 7 | নারিকেল | na-ri-kel | Coconut | নারিকেল। নারিকেলের পানি মিষ্টি। |
| 8 | তরমুজ | tor-muj | Watermelon | তরমুজ। তরমুজ লাল রঙের। |
| 9 | কমলা | kom-la | Orange | কমলা। কমলা কমলা রঙের। |
| 10 | লেবু | le-bu | Lemon | লেবু। লেবু টক। |
| 11 | আপেল | a-pel | Apple | আপেল। আপেল লাল ফল। |
| 12 | আঙুর | an-gur | Grapes | আঙুর। আঙুর ছোট ফল। |
| 13 | নাশপাতি | nash-pa-ti | Pear | নাশপাতি। নাশপাতি সবুজ ফল। |
| 14 | ডালিম | da-lim | Pomegranate | ডালিম। ডালিমের দানা লাল। |
| 15 | জাম | jam | Black Berry | জাম। জাম বেগুনি রঙের। |
| 16 | পেয়ারা | pe-ya-ra | Guava | পেয়ারা। পেয়ারা সবুজ ফল। |
| 17 | বেল | bel | Wood Apple | বেল। বেল শক্ত ফল। |
| 18 | আমড়া | am-ra | Hog Plum | আমড়া। আমড়া টক ফল। |
| 19 | জামরুল | jam-rul | Rose Apple | জামরুল। জামরুল পানসে। |
| 20 | সফেদা | so-fe-da | Sapodilla | সফেদা। সফেদা মিষ্টি। |
| 21 | স্ট্রবেরি | straw-be-ri | Strawberry | স্ট্রবেরি। স্ট্রবেরি লাল। |
| 22 | খেজুর | khe-jur | Date | খেজুর। খেজুর মিষ্টি। |

### Full Audio Scripts (Fruits)

```
=== WORD ONLY ===

আম
কলা
কাঁঠাল
লিচু
পেঁপে
আনারস
নারিকেল
তরমুজ
কমলা
লেবু
আপেল
আঙুর
নাশপাতি
ডালিম
জাম
পেয়ারা
বেল
আমড়া
জামরুল
সফেদা
স্ট্রবেরি
খেজুর

=== WITH DESCRIPTION ===

আম। আম মিষ্টি ফল।
কলা। কলা হলুদ রঙের।
কাঁঠাল। কাঁঠাল বড় ফল।
লিচু। লিচু রসালো।
পেঁপে। পেঁপে নরম ফল।
আনারস। আনারস টক-মিষ্টি।
নারিকেল। নারিকেলের পানি মিষ্টি।
তরমুজ। তরমুজ লাল রঙের।
কমলা। কমলা কমলা রঙের।
লেবু। লেবু টক।
আপেল। আপেল লাল ফল।
আঙুর। আঙুর ছোট ফল।
নাশপাতি। নাশপাতি সবুজ ফল।
ডালিম। ডালিমের দানা লাল।
জাম। জাম বেগুনি রঙের।
পেয়ারা। পেয়ারা সবুজ ফল।
বেল। বেল শক্ত ফল।
আমড়া। আমড়া টক ফল।
জামরুল। জামরুল পানসে।
সফেদা। সফেদা মিষ্টি।
স্ট্রবেরি। স্ট্রবেরি লাল।
খেজুর। খেজুর মিষ্টি।
```

---

## 🚗 যানবাহন (Janobahon) - Vehicles

| # | Bangla | Pronunciation | English | Audio Script |
|---|--------|---------------|---------|--------------|
| 1 | রিকশা | rik-sha | Rickshaw | রিকশা। রিকশা তিন চাকার গাড়ি। |
| 2 | নৌকা | nou-ka | Boat | নৌকা। নৌকা পানিতে চলে। |
| 3 | গরুর গাড়ি | go-rur ga-ri | Ox Cart | গরুর গাড়ি। গরু গাড়ি টানে। |
| 4 | ঠেলাগাড়ি | the-la-ga-ri | Push Cart | ঠেলাগাড়ি। ঠেলাগাড়ি ঠেলে চলে। |
| 5 | সিএনজি | si-en-ji | CNG Auto | সিএনজি। সিএনজি সবুজ গাড়ি। |
| 6 | বাস | bas | Bus | বাস। বাসে অনেক মানুষ যায়। |
| 7 | ট্যাক্সি | taxi | Taxi | ট্যাক্সি। ট্যাক্সি হলুদ গাড়ি। |
| 8 | ট্রাক | truck | Truck | ট্রাক। ট্রাক মাল বহন করে। |
| 9 | গাড়ি | ga-ri | Car | গাড়ি। গাড়ি রাস্তায় চলে। |
| 10 | মোটরসাইকেল | mo-tor-sai-kel | Motorcycle | মোটরসাইকেল। মোটরসাইকেল দুই চাকার। |
| 11 | সাইকেল | sai-kel | Bicycle | সাইকেল। সাইকেল প্যাডেলে চলে। |
| 12 | স্কুটার | sku-tar | Scooter | স্কুটার। স্কুটার ছোট গাড়ি। |
| 13 | ট্রেন | train | Train | ট্রেন। ট্রেন লাইনের উপর চলে। |
| 14 | লঞ্চ | launch | Ferry | লঞ্চ। লঞ্চ নদীতে চলে। |
| 15 | বিমান | bi-man | Airplane | বিমান। বিমান আকাশে উড়ে। |
| 16 | হেলিকপ্টার | he-li-kop-tar | Helicopter | হেলিকপ্টার। হেলিকপ্টার উপরে উড়ে। |
| 17 | ট্রাক্টর | trac-tor | Tractor | ট্রাক্টর। ট্রাক্টর মাঠে চলে। |
| 18 | অ্যাম্বুলেন্স | am-bu-lance | Ambulance | অ্যাম্বুলেন্স। অ্যাম্বুলেন্স রোগী নেয়। |
| 19 | ফায়ার ট্রাক | fire truck | Fire Truck | ফায়ার ট্রাক। ফায়ার ট্রাক আগুন নেভায়। |
| 20 | পুলিশ গাড়ি | police ga-ri | Police Car | পুলিশ গাড়ি। পুলিশ গাড়ি আমাদের রক্ষা করে। |

### Full Audio Scripts (Vehicles)

```
=== WORD ONLY ===

রিকশা
নৌকা
গরুর গাড়ি
ঠেলাগাড়ি
সিএনজি
বাস
ট্যাক্সি
ট্রাক
গাড়ি
মোটরসাইকেল
সাইকেল
স্কুটার
ট্রেন
লঞ্চ
বিমান
হেলিকপ্টার
ট্রাক্টর
অ্যাম্বুলেন্স
ফায়ার ট্রাক
পুলিশ গাড়ি

=== WITH DESCRIPTION ===

রিকশা। রিকশা তিন চাকার গাড়ি।
নৌকা। নৌকা পানিতে চলে।
গরুর গাড়ি। গরু গাড়ি টানে।
ঠেলাগাড়ি। ঠেলাগাড়ি ঠেলে চলে।
সিএনজি। সিএনজি সবুজ গাড়ি।
বাস। বাসে অনেক মানুষ যায়।
ট্যাক্সি। ট্যাক্সি হলুদ গাড়ি।
ট্রাক। ট্রাক মাল বহন করে।
গাড়ি। গাড়ি রাস্তায় চলে।
মোটরসাইকেল। মোটরসাইকেল দুই চাকার।
সাইকেল। সাইকেল প্যাডেলে চলে।
স্কুটার। স্কুটার ছোট গাড়ি।
ট্রেন। ট্রেন লাইনের উপর চলে।
লঞ্চ। লঞ্চ নদীতে চলে।
বিমান। বিমান আকাশে উড়ে।
হেলিকপ্টার। হেলিকপ্টার উপরে উড়ে।
ট্রাক্টর। ট্রাক্টর মাঠে চলে।
অ্যাম্বুলেন্স। অ্যাম্বুলেন্স রোগী নেয়।
ফায়ার ট্রাক। ফায়ার ট্রাক আগুন নেভায়।
পুলিশ গাড়ি। পুলিশ গাড়ি আমাদের রক্ষা করে।
```

---

## 🔤 বর্ণমালা (Bornomala) - Alphabet

### স্বরবর্ণ (Shoroborno) - Vowels

| # | Letter | Pronunciation | Audio Script |
|---|--------|---------------|--------------|
| 1 | অ | o | অ। অজগর আসছে তেড়ে। |
| 2 | আ | aa | আ। আমটি আমি খাব। |
| 3 | ই | i | ই। ইলিশ মাছ সুস্বাদু। |
| 4 | ঈ | ee | ঈ। ঈগল পাখি বড়। |
| 5 | উ | u | উ। উট মরুভূমিতে থাকে। |
| 6 | ঊ | oo | ঊ। ঊষা মানে ভোর। |
| 7 | ঋ | ri | ঋ। ঋষি ধ্যান করে। |
| 8 | এ | e | এ। একটি ফুল সুন্দর। |
| 9 | ঐ | oi | ঐ। ঐরাবত হাতি। |
| 10 | ও | o | ও। ওল সবজি। |
| 11 | ঔ | ou | ঔ। ঔষধ রোগ সারায়। |

### ব্যঞ্জনবর্ণ (Benjonborno) - Consonants

| # | Letter | Pronunciation | Audio Script |
|---|--------|---------------|--------------|
| 1 | ক | ko | ক। কলা হলুদ। |
| 2 | খ | kho | খ। খরগোশ লাফায়। |
| 3 | গ | go | গ। গরু দুধ দেয়। |
| 4 | ঘ | gho | ঘ। ঘড়ি টিক টিক করে। |
| 5 | ঙ | ngo | ঙ। বাংলা ভাষা। |
| 6 | চ | cho | চ। চাঁদ আকাশে। |
| 7 | ছ | chho | ছ। ছাতা বৃষ্টিতে লাগে। |
| 8 | জ | jo | জ। জাম বেগুনি। |
| 9 | ঝ | jho | ঝ। ঝরনা থেকে পানি পড়ে। |
| 10 | ঞ | nyo | ঞ। মিঞা ভালো। |
| 11 | ট | to | ট। টমেটো লাল। |
| 12 | ঠ | tho | ঠ। ঠোঁট গোলাপি। |
| 13 | ড | do | ড। ডাব মিষ্টি। |
| 14 | ঢ | dho | ঢ। ঢোল বাজে। |
| 15 | ণ | no | ণ। কণা ছোট। |
| 16 | ত | to | ত। তারা আকাশে। |
| 17 | থ | tho | থ। থালা গোল। |
| 18 | দ | do | দ। দই সাদা। |
| 19 | ধ | dho | ধ। ধান সোনালি। |
| 20 | ন | no | ন। নদী বয়ে যায়। |
| 21 | প | po | প। পাখি উড়ে। |
| 22 | ফ | fo | ফ। ফুল সুন্দর। |
| 23 | ব | bo | ব। বই পড়ি। |
| 24 | ভ | bho | ভ। ভালুক বড়। |
| 25 | ম | mo | ম। মা ভালোবাসে। |
| 26 | য | jo | য। যব খাই। |
| 27 | র | ro | র। রং সুন্দর। |
| 28 | ল | lo | ল। লাল রং। |
| 29 | শ | sho | শ। শাপলা ফুল। |
| 30 | ষ | sho | ষ। ষাঁড় বড়। |
| 31 | স | so | স। সূর্য উঠে। |
| 32 | হ | ho | হ। হাতি বড়। |
| 33 | ড় | ro | ড়। গাড়ি চলে। |
| 34 | ঢ় | rho | ঢ়। আষাঢ় মাস। |
| 35 | য় | yo | য়। হয় ভালো। |
| 36 | ৎ | t | ৎ। উৎসব মজার। |
| 37 | ং | ng | ং। বাংলা ভাষা। |
| 38 | ঃ | h | ঃ। দুঃখ কষ্ট। |
| 39 | ঁ | n | ঁ। চাঁদ সুন্দর। |

### Full Audio Scripts (Alphabet)

```
=== VOWELS (স্বরবর্ণ) ===

অ। অজগর আসছে তেড়ে।
আ। আমটি আমি খাব।
ই। ইলিশ মাছ সুস্বাদু।
ঈ। ঈগল পাখি বড়।
উ। উট মরুভূমিতে থাকে।
ঊ। ঊষা মানে ভোর।
ঋ। ঋষি ধ্যান করে।
এ। একটি ফুল সুন্দর।
ঐ। ঐরাবত হাতি।
ও। ওল সবজি।
ঔ। ঔষধ রোগ সারায়।

=== CONSONANTS (ব্যঞ্জনবর্ণ) ===

ক। কলা হলুদ।
খ। খরগোশ লাফায়।
গ। গরু দুধ দেয়।
ঘ। ঘড়ি টিক টিক করে।
ঙ। বাংলা ভাষা।
চ। চাঁদ আকাশে।
ছ। ছাতা বৃষ্টিতে লাগে।
জ। জাম বেগুনি।
ঝ। ঝরনা থেকে পানি পড়ে।
ঞ। মিঞা ভালো।
ট। টমেটো লাল।
ঠ। ঠোঁট গোলাপি।
ড। ডাব মিষ্টি।
ঢ। ঢোল বাজে।
ণ। কণা ছোট।
ত। তারা আকাশে।
থ। থালা গোল।
দ। দই সাদা।
ধ। ধান সোনালি।
ন। নদী বয়ে যায়।
প। পাখি উড়ে।
ফ। ফুল সুন্দর।
ব। বই পড়ি।
ভ। ভালুক বড়।
ম। মা ভালোবাসে।
য। যব খাই।
র। রং সুন্দর।
ল। লাল রং।
শ। শাপলা ফুল।
ষ। ষাঁড় বড়।
স। সূর্য উঠে।
হ। হাতি বড়।
ড়। গাড়ি চলে।
ঢ়। আষাঢ় মাস।
য়। হয় ভালো।
ৎ। উৎসব মজার।
ং। বাংলা ভাষা।
ঃ। দুঃখ কষ্ট।
ঁ। চাঁদ সুন্দর।
```

---

## 🔢 সংখ্যা (Songkha) - Numbers

| # | Bangla | Pronunciation | English | Audio Script |
|---|--------|---------------|---------|--------------|
| 0 | ০ (শূন্য) | shun-no | Zero | শূন্য। কিছুই নেই। |
| 1 | ১ (এক) | ek | One | এক। একটি আম। |
| 2 | ২ (দুই) | dui | Two | দুই। দুইটি কলা। |
| 3 | ৩ (তিন) | tin | Three | তিন। তিনটি আপেল। |
| 4 | ৪ (চার) | char | Four | চার। চারটি পাখি। |
| 5 | ৫ (পাঁচ) | pach | Five | পাঁচ। পাঁচটি আঙুল। |
| 6 | ৬ (ছয়) | chhoy | Six | ছয়। ছয়টি ফুল। |
| 7 | ৭ (সাত) | shat | Seven | সাত। সাতটি রং। |
| 8 | ৮ (আট) | at | Eight | আট। আটটি পা। |
| 9 | ৯ (নয়) | noy | Nine | নয়। নয়টি মাছ। |
| 10 | ১০ (দশ) | dosh | Ten | দশ। দশটি আঙুল। |

### Counting Songs

```
=== COUNTING RHYME ===

এক দুই তিন চার,
পাঁচ ছয় সাত আট,
নয় দশ গুনি সব,
আমরা সবাই পাট।

=== FINGER COUNTING ===

এক আঙুল, দুই আঙুল, তিন আঙুল, চার,
পাঁচ আঙুল মিলে হলো এক হাতের পাঁজর।
```

---

## 🎨 রং (Rong) - Colors

| # | Bangla | Pronunciation | English | Audio Script |
|---|--------|---------------|---------|--------------|
| 1 | লাল | lal | Red | লাল। আপেল লাল। |
| 2 | নীল | neel | Blue | নীল। আকাশ নীল। |
| 3 | সবুজ | so-buj | Green | সবুজ। পাতা সবুজ। |
| 4 | হলুদ | ho-lud | Yellow | হলুদ। কলা হলুদ। |
| 5 | কমলা | kom-la | Orange | কমলা। কমলা কমলা রঙের। |
| 6 | বেগুনি | be-gu-ni | Purple | বেগুনি। বেগুন বেগুনি। |
| 7 | গোলাপি | go-la-pi | Pink | গোলাপি। গোলাপ গোলাপি। |
| 8 | সাদা | sha-da | White | সাদা। দুধ সাদা। |
| 9 | কালো | ka-lo | Black | কালো। কাক কালো। |

---

## 📐 আকৃতি (Akriti) - Shapes

| # | Bangla | Pronunciation | English | Audio Script |
|---|--------|---------------|---------|--------------|
| 1 | বৃত্ত | brit-to | Circle | বৃত্ত। বল গোল বৃত্ত। |
| 2 | বর্গ | bor-go | Square | বর্গ। বাক্স বর্গ আকৃতির। |
| 3 | ত্রিভুজ | tri-bhuj | Triangle | ত্রিভুজ। ত্রিভুজের তিনটি কোণা। |
| 4 | আয়তক্ষেত্র | ay-to-khe-tro | Rectangle | আয়তক্ষেত্র। দরজা আয়তক্ষেত্র। |
| 5 | তারা | ta-ra | Star | তারা। আকাশে তারা জ্বলে। |
| 6 | হৃদয় | hri-doy | Heart | হৃদয়। ভালোবাসার চিহ্ন হৃদয়। |

---

## 👨‍👩‍👧‍👦 পরিবার (Poribar) - Family

| # | Bangla | Pronunciation | English | Audio Script |
|---|--------|---------------|---------|--------------|
| 1 | বাবা | ba-ba | Father | বাবা। বাবা আমাকে ভালোবাসে। |
| 2 | মা | ma | Mother | মা। মা সবার আপন। |
| 3 | ভাই | bhai | Brother | ভাই। ভাই আমার বন্ধু। |
| 4 | বোন | bon | Sister | বোন। বোন আমার সাথে খেলে। |
| 5 | দাদু | da-du | Grandfather | দাদু। দাদু গল্প বলে। |
| 6 | দিদা | di-da | Grandmother | দিদা। দিদা আদর করে। |
| 7 | শিশু | shi-shu | Baby | শিশু। শিশু খুব সুন্দর। |

---

## 🦶 শরীরের অংশ (Shorirer Ongso) - Body Parts

| # | Bangla | Pronunciation | English | Audio Script |
|---|--------|---------------|---------|--------------|
| 1 | মাথা | ma-tha | Head | মাথা। মাথায় চুল থাকে। |
| 2 | চোখ | chokh | Eyes | চোখ। চোখ দিয়ে দেখি। |
| 3 | নাক | nak | Nose | নাক। নাক দিয়ে শুঁকি। |
| 4 | কান | kan | Ears | কান। কান দিয়ে শুনি। |
| 5 | মুখ | mukh | Mouth | মুখ। মুখ দিয়ে খাই। |
| 6 | হাত | haat | Hands | হাত। হাত দিয়ে ধরি। |
| 7 | পা | pa | Feet | পা। পা দিয়ে হাঁটি। |
| 8 | আঙুল | an-gul | Fingers | আঙুল। আঙুল গুনি এক দুই। |

---

## 🎉 উৎসব (Utshob) - Festivals

| # | Bangla | English | Audio Script |
|---|--------|---------|--------------|
| 1 | পহেলা বৈশাখ | Bengali New Year | পহেলা বৈশাখ। বাংলা নববর্ষ। শুভ নববর্ষ! |
| 2 | ঈদ | Eid | ঈদ। ঈদ মোবারক! সবাই মিলে খুশি। |
| 3 | দুর্গা পূজা | Durga Puja | দুর্গা পূজা। শরতের উৎসব। |
| 4 | একুশে ফেব্রুয়ারি | Language Day | একুশে ফেব্রুয়ারি। ভাষা দিবস। আমার ভাষা বাংলা। |
| 5 | স্বাধীনতা দিবস | Independence Day | স্বাধীনতা দিবস। বাংলাদেশ স্বাধীন। |
| 6 | বিজয় দিবস | Victory Day | বিজয় দিবস। আমরা বিজয়ী। |

---

## 🌸 ঋতু (Ritu) - Seasons

| # | Bangla | English | Audio Script |
|---|--------|---------|--------------|
| 1 | গ্রীষ্ম | Summer | গ্রীষ্ম। গরমের সময়। আম পাকে। |
| 2 | বর্ষা | Monsoon | বর্ষা। বৃষ্টি পড়ে। ব্যাঙ ডাকে। |
| 3 | শরৎ | Autumn | শরৎ। কাশফুল ফোটে। আকাশ নীল। |
| 4 | হেমন্ত | Late Autumn | হেমন্ত। ধান কাটা হয়। নতুন চাল। |
| 5 | শীত | Winter | শীত। ঠাণ্ডার সময়। পিঠা খাই। |
| 6 | বসন্ত | Spring | বসন্ত। ফুল ফোটে। কোকিল ডাকে। |

---

## 🎵 UI Feedback Audio Scripts

### Success Messages

```
সাবাস!
বাহ্, দারুণ!
তুমি পারো!
অসাধারণ!
একদম ঠিক!
চমৎকার!
তুমি জিতেছ!
```

### Encouragement Messages

```
আবার চেষ্টা করো।
কোনো সমস্যা নেই।
তুমি পারবে!
চেষ্টা করতে থাকো।
আরেকবার চেষ্টা!
```

### Instruction Messages

```
ছবিতে টাচ করো।
শব্দ শোনো।
সঠিক উত্তর বেছে নাও।
আবার শোনো।
পরের পাতায় যাও।
```

---

## 📁 File Naming Convention

```
AUDIO FILE STRUCTURE:
assets/audio/
├── bn/                          (Bangla)
│   ├── animals/
│   │   ├── goru_word.mp3       (Word only)
│   │   ├── goru_desc.mp3       (With description)
│   │   └── goru_sound.mp3      (Animal sound)
│   ├── fruits/
│   │   ├── am_word.mp3
│   │   └── am_desc.mp3
│   ├── vehicles/
│   ├── alphabet/
│   │   ├── vowels/
│   │   └── consonants/
│   ├── numbers/
│   ├── colors/
│   ├── shapes/
│   ├── family/
│   ├── body/
│   ├── festivals/
│   ├── seasons/
│   └── feedback/
│       ├── success/
│       ├── encourage/
│       └── instruction/
└── sfx/                         (Sound effects)
    ├── tap.mp3
    ├── correct.mp3
    ├── wrong.mp3
    └── celebration.mp3

NAMING PATTERN:
[category]_[item]_[type].mp3

EXAMPLES:
├── animal_goru_word.mp3
├── animal_goru_desc.mp3
├── fruit_am_word.mp3
├── vehicle_riksha_word.mp3
├── alphabet_ko_letter.mp3
├── number_ek_word.mp3
└── feedback_success_01.mp3
```

---

## 🔧 Batch Processing Tips

### Google Cloud TTS API Example

```python
# Python script for batch TTS generation
from google.cloud import texttospeech

def generate_audio(text, output_file):
    client = texttospeech.TextToSpeechClient()
    
    synthesis_input = texttospeech.SynthesisInput(text=text)
    
    voice = texttospeech.VoiceSelectionParams(
        language_code="bn-BD",
        name="bn-BD-Standard-A",
        ssml_gender=texttospeech.SsmlVoiceGender.FEMALE
    )
    
    audio_config = texttospeech.AudioConfig(
        audio_encoding=texttospeech.AudioEncoding.MP3,
        speaking_rate=0.85,
        pitch=2.0
    )
    
    response = client.synthesize_speech(
        input=synthesis_input,
        voice=voice,
        audio_config=audio_config
    )
    
    with open(output_file, "wb") as out:
        out.write(response.audio_content)
```

### ElevenLabs API Example

```python
import requests

def generate_elevenlabs(text, output_file, voice_id):
    url = f"https://api.elevenlabs.io/v1/text-to-speech/{voice_id}"
    
    headers = {
        "xi-api-key": "YOUR_API_KEY",
        "Content-Type": "application/json"
    }
    
    data = {
        "text": text,
        "model_id": "eleven_multilingual_v2",
        "voice_settings": {
            "stability": 0.75,
            "similarity_boost": 0.75,
            "speed": 0.85
        }
    }
    
    response = requests.post(url, headers=headers, json=data)
    
    with open(output_file, "wb") as f:
        f.write(response.content)
```

---

**Total Audio Files Needed:** ~350+ unique recordings

**Next:** [02-tts-stories-rhymes.md](./02-tts-stories-rhymes.md) - Story narrations & rhymes
