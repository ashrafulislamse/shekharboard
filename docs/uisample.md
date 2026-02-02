<!DOCTYPE html>

<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Bangla Kids App Splash Screen</title>
<!-- Material Symbols -->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;700;800&amp;family=Noto+Sans+Bengali:wght@400;700&amp;family=Baloo+Da+2:wght@400;600;800&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#1c5f5f",
                        "background-light": "#f6f8f8",
                        "background-dark": "#131f1f",
                    },
                    fontFamily: {
                        "display": ["Plus Jakarta Sans", "Noto Sans", "sans-serif"],
                        "bangla": ["Baloo Da 2", "Noto Sans Bengali", "sans-serif"],
                    },
                    borderRadius: {"DEFAULT": "1rem", "lg": "2rem", "xl": "3rem", "full": "9999px"},
                },
            },
        }
    </script>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background-light dark:bg-background-dark text-[#121717] dark:text-white font-display overflow-hidden">
<div class="relative flex h-screen w-full flex-col items-center justify-between overflow-hidden">
<!-- Background Gradient Layer -->
<div class="absolute inset-0 bg-gradient-to-b from-[#E8F5F3] to-[#FFF8E7] dark:from-[#0f2e2e] dark:to-[#131f1f] z-0"></div>
<!-- Floating Decorative Elements (Background Layer) -->
<div class="absolute inset-0 z-0 overflow-hidden opacity-80 pointer-events-none">
<!-- Top Left Floating 'অ' -->
<div class="absolute top-[10%] left-[8%] animate-pulse">
<div class="flex items-center justify-center w-16 h-16 bg-white/40 dark:bg-white/10 backdrop-blur-sm rounded-full shadow-sm transform -rotate-12">
<span class="font-bangla text-3xl font-bold text-[#1c5f5f] dark:text-[#7FBA96]">অ</span>
</div>
</div>
<!-- Top Right Floating '১' -->
<div class="absolute top-[15%] right-[10%]">
<div class="flex items-center justify-center w-12 h-12 bg-white/50 dark:bg-white/10 backdrop-blur-sm rounded-full shadow-sm transform rotate-6">
<span class="font-bangla text-2xl font-bold text-[#D97706] dark:text-[#FCD34D]">১</span>
</div>
</div>
<!-- Middle Left Floating 'আ' -->
<div class="absolute top-[40%] left-[-2%]">
<div class="flex items-center justify-center w-20 h-20 bg-[#E8F5F3]/60 dark:bg-white/5 backdrop-blur-sm rounded-full transform rotate-12">
<span class="font-bangla text-4xl font-bold text-[#1c5f5f]/80 dark:text-[#7FBA96]">আ</span>
</div>
</div>
<!-- Middle Right Floating '২' -->
<div class="absolute top-[50%] right-[5%]">
<div class="flex items-center justify-center w-14 h-14 bg-white/30 dark:bg-white/10 backdrop-blur-sm rounded-full transform -rotate-6">
<span class="font-bangla text-3xl font-bold text-[#D97706]/80 dark:text-[#FCD34D]">২</span>
</div>
</div>
<!-- Bottom Left Floating '৩' -->
<div class="absolute bottom-[20%] left-[12%]">
<div class="flex items-center justify-center w-10 h-10 bg-white/40 dark:bg-white/5 backdrop-blur-sm rounded-full">
<span class="font-bangla text-xl font-bold text-[#1c5f5f] dark:text-[#7FBA96]">৩</span>
</div>
</div>
<!-- Floating Animal Icon Illustration (Tiger Cub) -->
<div class="absolute bottom-[25%] right-[20%] opacity-80">
<div class="w-16 h-16 bg-center bg-no-repeat bg-contain" data-alt="Cute cartoon tiger cub illustration peeking out" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuBBnBiFFWYGuDlF3WdLPBoBRZ7NugYKIYUcRcPXavluwfuMBqKd0lSVl3vfvDYd8k20fPgCG-G2KY4QICFteDoEyCBYj07wuQeVR2UR_NKaxGKyOppE4PUBIgh0yNDxW005v_CBVJf8uqa-y9RLbkjGrsZPRsPsZG9E71OreilaeVvJVV8OrOlntOe5GlCNpFfAcbSkYWLxtJmc4CXS52AWjjO4TvBivvjt0v8b4qSSHX82vAhfENmpvbiH7BY5jLFdX0VtKkjKmOkn'); border-radius: 9999px;"></div>
</div>
<!-- Floating Nature Icon (Leaf) -->
<div class="absolute top-[25%] right-[30%] text-[#7FBA96] opacity-40">
<span class="material-symbols-outlined text-4xl" style="font-variation-settings: 'FILL' 1;">eco</span>
</div>
<!-- Floating Nature Icon (Bird/Kingfisher representation) -->
<div class="absolute top-[8%] left-[40%] opacity-60">
<div class="w-12 h-12 bg-center bg-no-repeat bg-contain" data-alt="Small colorful kingfisher bird illustration" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuAAknmkn-vlBiinvYfotkubtOEcIihbpzPNmdTHMT_Ok1DfXqKCWWr5sxJU2lm8bhhejjRuzPIv6SJmK3yQS8S1ViBdsTX7ipD7HlLytOEdq9AVXyWRCs5SVoqmJa5mHrHA6Ol34aSFPIon2-cG34pVU8Q1HI-83Rs5B4oJoJgoxkpTr0AGUsmMLaxvZS9w_-7D0lz2RZwCSqlSREFch1obs8jwBF3KPLcUuanO8Sm3SNV-Hg17udMzpsooyzTRGgKYTAPyQN0YzxnE'); border-radius: 9999px;"></div>
</div>
</div>
<!-- Main Content Area -->
<div class="relative z-10 flex flex-grow flex-col items-center justify-center w-full px-6 pb-12">
<!-- Mascot Container -->
<div class="mb-8 relative group">
<!-- Glow effect behind mascot -->
<div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-64 h-64 bg-white/40 dark:bg-[#7FBA96]/20 rounded-full blur-3xl"></div>
<!-- Mascot Image -->
<div class="relative w-64 h-64 @[480px]:w-72 @[480px]:h-72 bg-center bg-no-repeat bg-contain drop-shadow-2xl transition-transform hover:scale-105 duration-500" data-alt="Friendly cartoon owl mascot wearing a traditional Bangladeshi Panjabi sitting on a colorful open storybook" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuBk-JvWYi7pr4BmwDfgqDKpzfED3zwc1XfWP2E5uyP7GDb8GZ_C-F3YGIK5FVMDZkaXjKc3b4BWE0pxknmDNLsTbupwhAe6o4FFjoU8ghhbYjoawq_TZKcuNuZcE53mymM7NCSTfYYe-DQ-n3JgkUJDKwFh7Ce8flWrTm9mqaqnoSDMGt8BKTPrVbPQBGg77712hQ7c13CAPRoo5coBWh9gPHwT8q01oRYOVfvfp0VShHohdTx8w3p123F6O0N8WhVedc9XrfPYsMnZ');">
</div>
</div>
<!-- App Title -->
<div class="flex flex-col items-center gap-2 text-center">
<h1 class="font-bangla text-[#1c5f5f] dark:text-[#E8F5F3] text-4xl @[480px]:text-5xl font-extrabold leading-tight tracking-tight drop-shadow-sm">
                    টাচ অ্যান্ড <br/> লার্ন বোর্ড
                </h1>
<!-- Subtitle decorative line -->
<div class="h-1.5 w-16 rounded-full bg-[#7FBA96] mt-4"></div>
</div>
</div>
<!-- Footer / Loading Section -->
<div class="relative z-10 w-full p-8 flex flex-col items-center justify-end">
<!-- Loading Dots Animation (Static Representation) -->
<div class="flex gap-3 justify-center items-center h-12">
<div class="w-3.5 h-3.5 rounded-full bg-[#7FBA96]"></div>
<div class="w-3.5 h-3.5 rounded-full bg-[#7FBA96]/70"></div>
<div class="w-3.5 h-3.5 rounded-full bg-[#7FBA96]/40"></div>
</div>
<!-- Safe Area Spacer for Home Indicator -->
<div class="h-4 w-full"></div>
</div>
</div>
</body></html>

and

<!DOCTYPE html>

<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Parent Language Selection</title>
<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Lexend:wght@300;400;500;700&amp;family=Noto+Sans+Bengali:wght@400;500;700&amp;family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#7fb89c",
                        "background-light": "#f6f7f7",
                        "background-dark": "#161c19",
                        "cream": "#FAF6F0",
                        "teal-dark": "#1B5E5E",
                    },
                    fontFamily: {
                        "display": ["Lexend", "sans-serif"],
                        "bengali": ["Noto Sans Bengali", "sans-serif"],
                    },
                    borderRadius: {"DEFAULT": "1rem", "lg": "2rem", "xl": "3rem", "full": "9999px"},
                },
            },
        }
    </script>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body>
<div class="relative flex h-full min-h-screen w-full flex-col bg-cream group/design-root overflow-x-hidden font-display">
<!-- Top Spacer for safe area -->
<div class="h-8 w-full"></div>
<!-- Mascot & Branding Section -->
<div class="flex flex-col items-center px-4 pt-8 pb-4">
<!-- Mascot Image -->
<div class="w-48 h-48 mb-6 bg-center bg-contain bg-no-repeat transition-transform hover:scale-105 duration-300" data-alt="Friendly illustrated cow mascot with golden yellow accents looking happy" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuBRXxTAICNbNv5K-M2FBp1zqp0B1OzQLLQHacSzrd7y20QiEo42byCmI8jOY4gapNerkinaEfCvWpCMFuTmwrfj18qgEFjp_uu9KhprmPlh-TJUsA0_4E26mcMK6M4Oker_x1oklw6dzEVH5Eek8G_u7Pr99BIgguqNlv846QD2Z_MGi5X70BcdmlVJm8SI1Sdr3v0Ob6TkoWERvdGssQnuEFd0_UGYoiAVcm3yUPTMJkglP8Rj0u3PQ5wBcndxSiUYqZLUf0B18MnK");'>
</div>
<!-- Main Title (Bengali) -->
<h1 class="text-teal-dark font-bengali text-4xl font-bold leading-tight text-center tracking-tight mb-1">
                শেখার বোর্ড
            </h1>
<!-- Subtitle (English) -->
<h2 class="text-teal-dark/80 text-lg font-medium tracking-wide text-center">
                Touch &amp; Learn Board
            </h2>
</div>
<!-- Language Selection Section -->
<div class="flex flex-col flex-1 px-6 pt-8 pb-4">
<!-- Instruction Text -->
<h3 class="text-teal-dark font-bengali text-[22px] font-bold leading-tight text-center mb-8">
                পিতা-মাতার ইন্টারফেস ভাষা
                <span class="block text-sm text-teal-dark/60 font-display font-normal mt-1">(Choose Parent Language)</span>
</h3>
<!-- Buttons Container -->
<div class="flex flex-col gap-4 w-full max-w-sm mx-auto">
<!-- Primary Button: Bengali -->
<button class="relative flex items-center justify-center w-full h-16 bg-primary hover:bg-primary/90 active:scale-95 transition-all rounded-full shadow-lg shadow-primary/20 group">
<div class="flex flex-col items-center leading-none">
<span class="text-white font-bengali text-xl font-bold">বাংলা</span>
<span class="text-white/90 text-xs font-medium tracking-wide">Bengali</span>
</div>
<!-- Checkmark icon for selected state visualization -->
<span class="material-symbols-outlined absolute right-6 text-white text-2xl">check_circle</span>
</button>
<!-- Secondary Button: English -->
<button class="flex items-center justify-center w-full h-16 bg-transparent border-2 border-teal-dark hover:bg-teal-dark/5 active:scale-95 transition-all rounded-full text-teal-dark font-bold text-lg">
                    English
                </button>
</div>
</div>
<!-- Footer Info Box -->
<div class="px-6 pb-10 mt-auto">
<div class="bg-[#FFD54F]/20 rounded-2xl p-4 flex gap-3 items-start max-w-sm mx-auto border border-[#FFD54F]/30">
<span class="material-symbols-outlined text-[#F9A825] shrink-0 mt-0.5">info</span>
<div class="flex flex-col">
<p class="text-teal-dark font-bengali font-bold text-sm leading-snug">
                        শিশুর কন্টেন্ট সবসময় বাংলায় থাকবে
                    </p>
<p class="text-teal-dark/70 text-xs leading-snug mt-0.5">
                        Child content will always remain in Bangla
                    </p>
</div>
</div>
</div>
</div>
</body></html>

and

<!DOCTYPE html>

<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Learning Board Splash Screen</title>
<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Lexend:wght@300;400;500;700&amp;family=Noto+Sans+Bengali:wght@400;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<!-- Theme Configuration -->
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#7eb995",
                        "background-light": "#FAF6F0", // Custom Cream for this specific design request
                        "background-dark": "#161c18",
                        "dark-teal": "#1B5E5E",
                        "light-teal": "#E0F2F1",
                        "cream": "#FAF6F0",
                    },
                    fontFamily: {
                        "display": ["Lexend", "sans-serif"],
                        "bengali": ["Noto Sans Bengali", "sans-serif"],
                    },
                    borderRadius: {"DEFAULT": "1rem", "lg": "2rem", "xl": "3rem", "full": "9999px"},
                },
            },
        }
    </script>
<style>
        /* Custom styles just for centering and layout specifics */
        body {
            font-family: 'Lexend', 'Noto Sans', sans-serif;
        }
        .bengali-text {
            font-family: 'Noto Sans Bengali', sans-serif;
        }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background-light dark:bg-background-dark min-h-screen flex flex-col items-center justify-between overflow-hidden relative">
<!-- Decorative Top Element (Optional subtle shape for warmth) -->
<div class="absolute top-[-10%] right-[-20%] w-[80vw] h-[80vw] bg-primary/5 rounded-full blur-3xl pointer-events-none"></div>
<!-- Main Content Area -->
<div class="flex-1 flex flex-col items-center justify-center w-full px-6 z-10">
<!-- Mascot Image -->
<!-- Using a container to constrain the image size properly for a phone layout -->
<div class="w-64 h-64 md:w-80 md:h-80 relative mb-8 animate-fade-in">
<div class="w-full h-full bg-center bg-contain bg-no-repeat drop-shadow-xl" data-alt="Friendly illustrated cow character with golden yellow accents smiling warmly" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuBMYsaV0PU_anCqVZ0_GnNiIs2N2mANPszeT5nnf-jAtAfHSGYuz1c9KiQWuEABl_ottNNap5ixk6hF0bFdfx44hDKnth_lC8Nvc10Hc4HByJvr9Qgd6PJaaeX9I9DZqqpHYW7clsU_p2oe9AiDvi-V3iqNhF0A6GVow4C40SSnS126RC-tGeKIjxX2Fju41cusrO3I9mJnYYeVXjfQZXCX44cfocBBuXcvth98vPT36tt4a_p-sixPVXWxPWHQU4A8QdSGCKHbUksq"); mask-image: url("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyMDAgMjAwIj48Y2lyY2xlIGN4PSIxMDAiIGN5PSIxMDAiIHI9IjEwMCIvPjwvc3ZnPg=="); -webkit-mask-image: url("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyMDAgMjAwIj48Y2lyY2xlIGN4PSIxMDAiIGN5PSIxMDAiIHI9IjEwMCIvPjwvc3ZnPg=="); background-color: #fceea7;'>
<!-- Note: The actual image in a real app would be a transparent PNG. Since we are using Unsplash placeholders, I added a mask and a yellow background to simulate the "golden yellow accents" on the cow character feeling -->
</div>
</div>
<!-- App Title -->
<h1 class="bengali-text text-dark-teal dark:text-primary text-[40px] md:text-[48px] font-bold leading-tight text-center drop-shadow-sm mb-2">
            শেখার বোর্ড
        </h1>
<!-- Subtitle / Tagline (Optional but adds to the splash feel) -->
<p class="font-display text-dark-teal/70 dark:text-white/70 text-sm tracking-widest uppercase font-medium mt-2">
            For Little Learners
        </p>
</div>
<!-- Bottom Section: Loading Indicators -->
<div class="w-full flex flex-col items-center justify-end pb-16 z-10 gap-6">
<!-- Page/Loading Indicators -->
<div class="flex flex-row items-center justify-center gap-3">
<div class="h-3 w-3 rounded-full bg-dark-teal dark:bg-primary animate-pulse"></div>
<div class="h-3 w-3 rounded-full bg-dark-teal/60 dark:bg-primary/60 animate-pulse delay-75"></div>
<div class="h-3 w-3 rounded-full bg-dark-teal/40 dark:bg-primary/40 animate-pulse delay-150"></div>
<div class="h-3 w-3 rounded-full bg-dark-teal/20 dark:bg-primary/20 animate-pulse delay-200"></div>
<div class="h-3 w-3 rounded-full bg-dark-teal/10 dark:bg-primary/10 animate-pulse delay-300"></div>
</div>
<!-- Progress Bar -->
<div class="w-[200px] flex flex-col gap-2">
<div class="rounded-full bg-primary/20 dark:bg-gray-700 h-2 w-full overflow-hidden">
<div class="h-full rounded-full bg-primary transition-all duration-1000 ease-out" style="width: 60%;"></div>
</div>
<!-- Loading Text -->
<div class="text-center">
<span class="text-xs text-dark-teal/60 dark:text-gray-400 font-display font-medium">Loading...</span>
</div>
</div>
</div>
<!-- Decorative Bottom Element (Optional subtle shape for balance) -->
<div class="absolute bottom-[-5%] left-[-10%] w-[60vw] h-[60vw] bg-primary/10 rounded-full blur-3xl pointer-events-none"></div>
</body></html>

and

<!DOCTYPE html>

<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Shekhar Board - Parent Welcome</title>
<!-- Material Symbols -->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<!-- Google Fonts: Lexend (Theme) and Noto Sans Bengali (User Request) -->
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Lexend:wght@300;400;500;600;700&amp;family=Noto+Sans+Bengali:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#89ae97",
                        "background-light": "#f7f7f7",
                        "background-dark": "#171b19",
                        "brand-cream": "#FAF6F0", 
                        "brand-teal-dark": "#1B5E5E",
                    },
                    fontFamily: {
                        "display": ["Lexend", "sans-serif"],
                        "bengali": ["Noto Sans Bengali", "sans-serif"],
                    },
                    borderRadius: {"DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px"},
                },
            },
        }
    </script>
<style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="antialiased">
<!-- Main Container -->
<!-- Using bg-brand-cream (#FAF6F0) as requested for light mode, falling back to dark theme background -->
<div class="relative flex h-full min-h-screen w-full flex-col bg-brand-cream dark:bg-background-dark overflow-x-hidden font-display transition-colors duration-200">
<!-- Safe Area Spacer for iOS -->
<div class="h-8 w-full shrink-0"></div>
<!-- Main Content Wrapper -->
<div class="flex flex-col flex-grow px-6 pb-6 pt-4">
<!-- Header Section -->
<div class="flex flex-col items-center justify-center text-center mb-8">
<!-- Logo/Illustration Placeholder -->
<div class="mb-6 h-32 w-32 overflow-hidden rounded-full bg-white p-4 shadow-sm dark:bg-gray-800">
<div class="h-full w-full bg-contain bg-center bg-no-repeat" data-alt="Abstract logo of a playful educational board for children" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDy622sI7Gu9aIa6t8Iu-S3hXWoSRkDtaad9Kd2tObSxDkwT7ks4cn3t8FbE5fPANuw1D51kZuG3UkoBVueLIa1Sm9h6Rv2Y7zMCf89Jn9HfTEcL7wVk-I_qvkhWskACG67yJQjxVWKhR9aYah0tOUhvoUew8tOgcu1NdpHSu42o6bkFhDqOcmNaOM6IzxAH6CE8A-FDmqg9JjnapHUUpAHzr4lh57__RWaLS2dFvbYNa2tvPXfd_7UjMNuvkjHYm351-A6Com_lk9v");'>
</div>
</div>
<!-- Welcome Text -->
<!-- Using font-bengali for Bangla text and requested dark teal color -->
<h1 class="font-bengali text-[32px] font-bold leading-tight tracking-tight text-brand-teal-dark dark:text-white mb-2">
                    স্বাগতম!
                </h1>
<p class="font-bengali text-lg font-medium text-gray-600 dark:text-gray-300">
                    শেখার বোর্ড-এ আপনাকে স্বাগতম
                </p>
</div>
<!-- Trust Cards Section -->
<div class="flex flex-col gap-4 w-full max-w-md mx-auto">
<!-- Card 1: Offline -->
<div class="flex items-center gap-4 rounded-xl bg-white p-4 shadow-[0_2px_8px_rgba(0,0,0,0.04)] transition-transform active:scale-[0.99] dark:bg-[#252a28]">
<div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-primary/10 text-primary">
<span class="material-symbols-outlined text-2xl">check_circle</span>
</div>
<div class="flex flex-col">
<span class="font-bengali text-base font-bold text-[#141514] dark:text-white leading-tight">
                            সম্পূর্ণ অফলাইন
                        </span>
<span class="font-bengali text-xs text-gray-500 dark:text-gray-400 mt-0.5">ইন্টারনেট সংযোগ প্রয়োজন নেই</span>
</div>
</div>
<!-- Card 2: No Ads -->
<div class="flex items-center gap-4 rounded-xl bg-white p-4 shadow-[0_2px_8px_rgba(0,0,0,0.04)] transition-transform active:scale-[0.99] dark:bg-[#252a28]">
<div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-primary/10 text-primary">
<span class="material-symbols-outlined text-2xl">check_circle</span>
</div>
<div class="flex flex-col">
<span class="font-bengali text-base font-bold text-[#141514] dark:text-white leading-tight">
                            কোনো বিজ্ঞাপন নেই
                        </span>
<span class="font-bengali text-xs text-gray-500 dark:text-gray-400 mt-0.5">শিশুদের জন্য নিরাপদ পরিবেশ</span>
</div>
</div>
<!-- Card 3: For Bangladeshi Children -->
<div class="flex items-center gap-4 rounded-xl bg-white p-4 shadow-[0_2px_8px_rgba(0,0,0,0.04)] transition-transform active:scale-[0.99] dark:bg-[#252a28]">
<div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-primary/10 text-primary">
<span class="material-symbols-outlined text-2xl">check_circle</span>
</div>
<div class="flex flex-col">
<span class="font-bengali text-base font-bold text-[#141514] dark:text-white leading-tight">
                            বাংলাদেশী শিশুদের জন্য
                        </span>
<span class="font-bengali text-xs text-gray-500 dark:text-gray-400 mt-0.5">সাংস্কৃতিক ও ভাষাগতভাবে উপযুক্ত</span>
</div>
</div>
<!-- Card 4: Safe Design -->
<div class="flex items-center gap-4 rounded-xl bg-white p-4 shadow-[0_2px_8px_rgba(0,0,0,0.04)] transition-transform active:scale-[0.99] dark:bg-[#252a28]">
<div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-primary/10 text-primary">
<span class="material-symbols-outlined text-2xl">check_circle</span>
</div>
<div class="flex flex-col">
<span class="font-bengali text-base font-bold text-[#141514] dark:text-white leading-tight">
                            নিরাপদ ও শিক্ষামূলক ডিজাইন
                        </span>
<span class="font-bengali text-xs text-gray-500 dark:text-gray-400 mt-0.5">অভিভাবকদের দ্বারা পরীক্ষিত</span>
</div>
</div>
</div>
<!-- Spacer to push button to bottom -->
<div class="grow"></div>
<!-- Footer Action -->
<div class="mt-8 w-full max-w-md mx-auto pb-6">
<button class="flex w-full items-center justify-center rounded-xl bg-primary py-4 px-6 text-center text-white shadow-lg shadow-primary/20 transition-all hover:bg-primary/90 active:scale-95">
<span class="font-bengali text-lg font-bold tracking-wide">শুরু করুন</span>
<span class="material-symbols-outlined ml-2 text-xl">arrow_forward</span>
</button>
<p class="mt-4 text-center text-xs text-gray-400 dark:text-gray-600 font-display">
                    By continuing you agree to our <a class="underline hover:text-primary" href="#">Terms</a> &amp; <a class="underline hover:text-primary" href="#">Privacy Policy</a>
</p>
</div>
</div>
</div>
</body></html>

and

<!DOCTYPE html>

<html class="dark" lang="bn"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Tap Gesture Tutorial Overlay</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Lexend:wght@300;400;500;700&amp;family=Noto+Sans+Bengali:wght@400;600;700&amp;family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#7eb995",
                        "background-light": "#f6f7f7",
                        "background-dark": "#161c18",
                    },
                    fontFamily: {
                        "display": ["Lexend", "sans-serif"],
                        "bengali": ["Noto Sans Bengali", "sans-serif"],
                    },
                    borderRadius: {
                        "DEFAULT": "0.25rem",
                        "lg": "0.5rem",
                        "xl": "0.75rem",
                        "2xl": "1rem",
                        "full": "9999px"
                    },
                    animation: {
                        'tap-gesture': 'tap 1.5s ease-in-out infinite',
                        'pulse-glow': 'glow 2s cubic-bezier(0.4, 0, 0.6, 1) infinite',
                    },
                    keyframes: {
                        tap: {
                            '0%, 100%': { transform: 'translateY(0) scale(1)', opacity: '0.9' },
                            '50%': { transform: 'translateY(10px) scale(0.9)', opacity: '1' },
                        },
                        glow: {
                            '0%, 100%': { boxShadow: '0 0 0 0px rgba(126, 185, 149, 0.2)' },
                            '50%': { boxShadow: '0 0 0 12px rgba(126, 185, 149, 0)' },
                        }
                    }
                },
            },
        }
    </script>
<style>
        /* Custom styles for specific visual tweaks */
        .glass-panel {
            background: rgba(31, 35, 33, 0.6);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
        }
        
        .no-scrollbar::-webkit-scrollbar {
            display: none;
        }
        .no-scrollbar {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background-dark text-white font-display antialiased overflow-hidden selection:bg-primary selection:text-white">
<div class="relative w-full h-screen max-w-md mx-auto flex flex-col bg-[#131614] shadow-2xl overflow-hidden">
<!-- Header / Top Bar (Contextual Mockup) -->
<div class="w-full flex justify-between items-center p-4 pt-12 z-0 opacity-30">
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-white text-3xl">arrow_back</span>
</div>
<div class="h-2 w-32 bg-gray-700 rounded-full overflow-hidden">
<div class="h-full w-1/4 bg-primary"></div>
</div>
<div class="h-10 w-10 bg-gray-700 rounded-full"></div>
</div>
<!-- Main Grid Area -->
<div class="flex-1 px-4 py-2 relative">
<!-- The Grid Itself -->
<div class="grid grid-cols-2 gap-4 pb-20">
<!-- 1. The TARGET Card (Cow) -->
<!-- Note: z-30 elevates it above the overlay layer -->
<div class="relative z-30 flex flex-col gap-4">
<div class="group relative w-full aspect-[4/3] bg-[#1f2321] rounded-2xl flex flex-col overflow-visible shadow-2xl transition-all duration-300">
<!-- Glow Ring Effect -->
<div class="absolute -inset-[3px] rounded-2xl border-4 border-primary shadow-[0_0_30px_rgba(126,185,149,0.4)] animate-pulse-glow z-0"></div>
<!-- Card Content -->
<div class="relative z-10 h-full w-full rounded-2xl overflow-hidden bg-[#1f2321] border border-gray-700">
<div class="w-full h-full bg-center bg-no-repeat bg-cover transform transition-transform duration-500 hover:scale-105" data-alt="Illustration of a cute cow standing in a green field" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDcha9MLukTLxMJ9Px72oH1J6G4p9rBv2XmqD5BmHibMq-C0F9N7191PNAuGSs-XhAFQ2xdywYWBHPn3ZaZFCnGPrE7nhgViywxAH6Ci3DIDeqfMKJ8M9eBhF5B08pL07-joMjnD3gbvOV6fgbqN5dq0EoLwDvPMt_rOA46gTFVJSd7E1dkrDzcFWVOqP50NrvQoajGnPDXCcGMYB-kIeK2ppw8CEbwLzPDrazLgEEMbUVEeTYSRPMTKVjUZzJtRMwPavZhnbik9ZPg");'>
</div>
<!-- Gradient for text readability on card -->
<div class="absolute bottom-0 left-0 w-full h-1/2 bg-gradient-to-t from-black/80 to-transparent"></div>
<div class="absolute bottom-3 left-3">
<p class="text-white text-xl font-bengali font-bold leading-none tracking-wide">গরু</p>
</div>
</div>
<!-- Hand Gesture Overlay (Tutorial Indicator) -->
<div class="absolute -right-4 top-1/2 z-50 pointer-events-none animate-tap-gesture filter drop-shadow-xl">
<!-- Realistic Hand Illustration using an image for high quality look as requested -->
<div class="w-20 h-20 bg-contain bg-no-repeat bg-center" data-alt="Illustrated hand demonstrating a tap gesture" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuA6nrWn9r3MvCn4UUelaHd5ukllCQg2m-3M3kcsl9iC_Mn5hozfi1r-a4vhUt8ZDLjPhrIY0Xhb2TfuCC8nXy3XfoyqxXc2aXoj8yCu3BSOz0Rmi9iAig4oXwvH_4-dQtoYxls2-MHeNQEByGAB05ENhcomICsNPBlQ2y2bYko8oLViJoLyIFE5lySHZgvjvHP_Bf44-VgFuhqk9vpf3XJw-5o0KOSyn4gAQQ92O5D14Skjpqyyq8JoeVkqK8E5z9JmnhSwI_7sCPbR'); filter: brightness(1.1);">
</div>
<!-- Motion Lines (CSS Shapes) -->
<div class="absolute top-2 left-0 -translate-x-full flex flex-col gap-1 opacity-60">
<div class="w-2 h-1 bg-white rounded-full"></div>
<div class="w-3 h-1 bg-white rounded-full translate-x-1"></div>
</div>
</div>
</div>
<!-- Instructional Text (Attached to the target for context) -->
<div class="flex flex-col items-center justify-center text-center animate-pulse">
<h2 class="text-white font-bengali font-bold text-2xl drop-shadow-lg">ছবিতে টিপুন</h2>
</div>
</div>
<!-- 2. Other Grid Items (Background Context) -->
<!-- Lion -->
<div class="flex flex-col gap-2 opacity-100">
<div class="w-full aspect-[4/3] bg-[#1f2321] rounded-2xl overflow-hidden border border-gray-800 relative">
<div class="w-full h-full bg-center bg-no-repeat bg-cover opacity-60 grayscale-[30%]" data-alt="Illustration of a lion face" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuBzKbyW3lrlrH6_jNXGiIruV3x6qomLocJfjjOWhdnJL8kTt3URSjMIg63QzQxrRcUWrkChF9UO4NomuQIG6Uavi1GjunP98WB7A6jRAShw_TrLjkVrrTKo00_c6PA_ZH6QaGhw21QDbM-27pYHz6M8DdN-EacPEA1F4p-t4uH4Y17H3LViWMWLk7uTlFa0ohPw08PYyIbo2zYtVGSrxWBsfgsPCjbZzNmyShF-pHWVRXTEHb50i0vfxpM6-kQWnEDXRNCk7je0b2zO");'></div>
<div class="absolute bottom-3 left-3">
<p class="text-white/70 text-lg font-bengali font-medium">সিংহ</p>
</div>
</div>
</div>
<!-- Tiger -->
<div class="flex flex-col gap-2 opacity-100">
<div class="w-full aspect-[4/3] bg-[#1f2321] rounded-2xl overflow-hidden border border-gray-800 relative">
<div class="w-full h-full bg-center bg-no-repeat bg-cover opacity-60 grayscale-[30%]" data-alt="Illustration of a tiger in the wild" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuAVh-AIrsmCKELGo6nf0B3c5FJYz_8LidzTy4OJ7HklkkX97fdjNeYuE-Aagll67XzYJKKNx4lGUeWNy240nqmLM4W3mPpi600XvIa4n01THDzhS_byTdrqBg-278QraF83k7Q8iOGuNPSFCWc7_MS1pOno7ZIuyFpYbBr__9LzRM3vwBU6CQzIaSEDiC2jM6G8_P-D3ErHi1Lpqe6BvjJWVnR5Zq1SZbQGIxgOX8D4jwxqSZP0Pq7IFHelREX7m-3GXC1G2gX4XqzR");'></div>
<div class="absolute bottom-3 left-3">
<p class="text-white/70 text-lg font-bengali font-medium">বাঘ</p>
</div>
</div>
</div>
<!-- Elephant -->
<div class="flex flex-col gap-2 opacity-100">
<div class="w-full aspect-[4/3] bg-[#1f2321] rounded-2xl overflow-hidden border border-gray-800 relative">
<div class="w-full h-full bg-center bg-no-repeat bg-cover opacity-60 grayscale-[30%]" data-alt="Illustration of an elephant standing" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDl62H8dxJ1IGHEkaPtHdu63Q-BujxEIx2hjKsexOarBfKVGhJFNl-TTN_AdNCS_vERQxj0-GUhECYetHsv_F7YzIPgLF-WhDfEuqENjQZ3v8uVanf8Tn-fjVgTM4yasRUDfTOuMPKf1Pwzy8rLg0UNF8_v7Cj2uKdGJDAcvDg4ZXYAky5gyX47sS0ei7t8xXdLtU2zuZzjkmASw0hpuixZCAknyHzXE3CRuCOhz9DqgylwO_CwniT2ilA0sTas_zLbPGJJXq7czRNp");'></div>
<div class="absolute bottom-3 left-3">
<p class="text-white/70 text-lg font-bengali font-medium">হাতি</p>
</div>
</div>
</div>
<!-- Monkey -->
<div class="flex flex-col gap-2 opacity-100">
<div class="w-full aspect-[4/3] bg-[#1f2321] rounded-2xl overflow-hidden border border-gray-800 relative">
<div class="w-full h-full bg-center bg-no-repeat bg-cover opacity-60 grayscale-[30%]" data-alt="Illustration of a monkey on a tree" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDer4lAXm-3iMKf64ta0VZS9fp5Ywuaj2cObRVvj9DhXGP2pBnOeC3kMsFgn7BhZpDYvdvVKCZe0n-dcUPFLVuRgWB4l-4W2VCI_3WukrYEj-q_eAFjwS6dGtXzpFFekz1VSeW8FVbSdbfKUfLtWvhz45EeU5YUcbFV6ThClM_2u2Cqok8HQy2CfjUyFCWj_O4QtkVi1SdZi6ECivLb8vfe9gGkxpWG0NkJOjTm7tBgSmOuV8Kd190cpSLPMlNzmMxb6hU-R6rG6RA1");'></div>
<div class="absolute bottom-3 left-3">
<p class="text-white/70 text-lg font-bengali font-medium">বানর</p>
</div>
</div>
</div>
<!-- Cat -->
<div class="flex flex-col gap-2 opacity-100">
<div class="w-full aspect-[4/3] bg-[#1f2321] rounded-2xl overflow-hidden border border-gray-800 relative">
<div class="w-full h-full bg-center bg-no-repeat bg-cover opacity-60 grayscale-[30%]" data-alt="Illustration of a cat face closeup" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuBeNEnQYIOiErHITDNUke2AzKZ01ZwJJuyuJn2IoLA0tMnoCSdf_aQOOCD3M4OUlUd2ZGox2xpaEnvh7oxDQ_PW5nGiB_-I7_D1FQ3h7LDTxilAwpgkbNvN9213p-AhYzYLEZrbUv3CkN_xQmXgGz6kmczb-6lZRGbvuruXKu7Jb_Z22fwDslZ05mbcpaKSveu6azB7da5zJGYKOMe_xtdLPstbkvzAccvSywqL1U1QK-Mul1T3TRnlWT4HIwp2aawiqO8uYIPBC3f2");'></div>
<div class="absolute bottom-3 left-3">
<p class="text-white/70 text-lg font-bengali font-medium">বিড়াল</p>
</div>
</div>
</div>
</div>
</div>
<!-- The Dark Overlay Layer -->
<!-- This sits above normal content (z-0) but below the target card (z-30) -->
<div class="absolute inset-0 z-20 bg-black/70 backdrop-blur-sm"></div>
<!-- Bottom Controls / Pagination Layer -->
<div class="absolute bottom-0 left-0 w-full z-40 pb-8 pt-12 bg-gradient-to-t from-black via-black/80 to-transparent flex flex-col items-center justify-end gap-6">
<!-- Pagination Dots -->
<div class="flex flex-row items-center justify-center gap-3">
<div class="h-2.5 w-2.5 rounded-full bg-white shadow-[0_0_8px_rgba(255,255,255,0.8)]"></div>
<div class="h-2.5 w-2.5 rounded-full bg-white/20"></div>
<div class="h-2.5 w-2.5 rounded-full bg-white/20"></div>
</div>
<!-- Skip Button -->
<button class="px-6 py-2 rounded-full active:scale-95 transition-transform text-white/60 hover:text-white hover:bg-white/10 text-base font-bengali font-medium">
                এড়িয়ে যান
            </button>
</div>
</div>
</body></html>

and

<!DOCTYPE html>

<html class="dark" lang="bn"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Tap Gesture Tutorial Overlay</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Lexend:wght@300;400;500;700&amp;family=Noto+Sans+Bengali:wght@400;600;700&amp;family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#7eb995",
                        "background-light": "#f6f7f7",
                        "background-dark": "#161c18",
                    },
                    fontFamily: {
                        "display": ["Lexend", "sans-serif"],
                        "bengali": ["Noto Sans Bengali", "sans-serif"],
                    },
                    borderRadius: {
                        "DEFAULT": "0.25rem",
                        "lg": "0.5rem",
                        "xl": "0.75rem",
                        "2xl": "1rem",
                        "full": "9999px"
                    },
                    animation: {
                        'tap-gesture': 'tap 1.5s ease-in-out infinite',
                        'pulse-glow': 'glow 2s cubic-bezier(0.4, 0, 0.6, 1) infinite',
                    },
                    keyframes: {
                        tap: {
                            '0%, 100%': { transform: 'translateY(0) scale(1)', opacity: '0.9' },
                            '50%': { transform: 'translateY(10px) scale(0.9)', opacity: '1' },
                        },
                        glow: {
                            '0%, 100%': { boxShadow: '0 0 0 0px rgba(126, 185, 149, 0.2)' },
                            '50%': { boxShadow: '0 0 0 12px rgba(126, 185, 149, 0)' },
                        }
                    }
                },
            },
        }
    </script>
<style>
        /* Custom styles for specific visual tweaks */
        .glass-panel {
            background: rgba(31, 35, 33, 0.6);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
        }
        
        .no-scrollbar::-webkit-scrollbar {
            display: none;
        }
        .no-scrollbar {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background-dark text-white font-display antialiased overflow-hidden selection:bg-primary selection:text-white">
<div class="relative w-full h-screen max-w-md mx-auto flex flex-col bg-[#131614] shadow-2xl overflow-hidden">
<!-- Header / Top Bar (Contextual Mockup) -->
<div class="w-full flex justify-between items-center p-4 pt-12 z-0 opacity-30">
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-white text-3xl">arrow_back</span>
</div>
<div class="h-2 w-32 bg-gray-700 rounded-full overflow-hidden">
<div class="h-full w-1/4 bg-primary"></div>
</div>
<div class="h-10 w-10 bg-gray-700 rounded-full"></div>
</div>
<!-- Main Grid Area -->
<div class="flex-1 px-4 py-2 relative">
<!-- The Grid Itself -->
<div class="grid grid-cols-2 gap-4 pb-20">
<!-- 1. The TARGET Card (Cow) -->
<!-- Note: z-30 elevates it above the overlay layer -->
<div class="relative z-30 flex flex-col gap-4">
<div class="group relative w-full aspect-[4/3] bg-[#1f2321] rounded-2xl flex flex-col overflow-visible shadow-2xl transition-all duration-300">
<!-- Glow Ring Effect -->
<div class="absolute -inset-[3px] rounded-2xl border-4 border-primary shadow-[0_0_30px_rgba(126,185,149,0.4)] animate-pulse-glow z-0"></div>
<!-- Card Content -->
<div class="relative z-10 h-full w-full rounded-2xl overflow-hidden bg-[#1f2321] border border-gray-700">
<div class="w-full h-full bg-center bg-no-repeat bg-cover transform transition-transform duration-500 hover:scale-105" data-alt="Illustration of a cute cow standing in a green field" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDcha9MLukTLxMJ9Px72oH1J6G4p9rBv2XmqD5BmHibMq-C0F9N7191PNAuGSs-XhAFQ2xdywYWBHPn3ZaZFCnGPrE7nhgViywxAH6Ci3DIDeqfMKJ8M9eBhF5B08pL07-joMjnD3gbvOV6fgbqN5dq0EoLwDvPMt_rOA46gTFVJSd7E1dkrDzcFWVOqP50NrvQoajGnPDXCcGMYB-kIeK2ppw8CEbwLzPDrazLgEEMbUVEeTYSRPMTKVjUZzJtRMwPavZhnbik9ZPg");'>
</div>
<!-- Gradient for text readability on card -->
<div class="absolute bottom-0 left-0 w-full h-1/2 bg-gradient-to-t from-black/80 to-transparent"></div>
<div class="absolute bottom-3 left-3">
<p class="text-white text-xl font-bengali font-bold leading-none tracking-wide">গরু</p>
</div>
</div>
<!-- Hand Gesture Overlay (Tutorial Indicator) -->
<div class="absolute -right-4 top-1/2 z-50 pointer-events-none animate-tap-gesture filter drop-shadow-xl">
<!-- Realistic Hand Illustration using an image for high quality look as requested -->
<div class="w-20 h-20 bg-contain bg-no-repeat bg-center" data-alt="Illustrated hand demonstrating a tap gesture" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuA6nrWn9r3MvCn4UUelaHd5ukllCQg2m-3M3kcsl9iC_Mn5hozfi1r-a4vhUt8ZDLjPhrIY0Xhb2TfuCC8nXy3XfoyqxXc2aXoj8yCu3BSOz0Rmi9iAig4oXwvH_4-dQtoYxls2-MHeNQEByGAB05ENhcomICsNPBlQ2y2bYko8oLViJoLyIFE5lySHZgvjvHP_Bf44-VgFuhqk9vpf3XJw-5o0KOSyn4gAQQ92O5D14Skjpqyyq8JoeVkqK8E5z9JmnhSwI_7sCPbR'); filter: brightness(1.1);">
</div>
<!-- Motion Lines (CSS Shapes) -->
<div class="absolute top-2 left-0 -translate-x-full flex flex-col gap-1 opacity-60">
<div class="w-2 h-1 bg-white rounded-full"></div>
<div class="w-3 h-1 bg-white rounded-full translate-x-1"></div>
</div>
</div>
</div>
<!-- Instructional Text (Attached to the target for context) -->
<div class="flex flex-col items-center justify-center text-center animate-pulse">
<h2 class="text-white font-bengali font-bold text-2xl drop-shadow-lg">ছবিতে টিপুন</h2>
</div>
</div>
<!-- 2. Other Grid Items (Background Context) -->
<!-- Lion -->
<div class="flex flex-col gap-2 opacity-100">
<div class="w-full aspect-[4/3] bg-[#1f2321] rounded-2xl overflow-hidden border border-gray-800 relative">
<div class="w-full h-full bg-center bg-no-repeat bg-cover opacity-60 grayscale-[30%]" data-alt="Illustration of a lion face" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuBzKbyW3lrlrH6_jNXGiIruV3x6qomLocJfjjOWhdnJL8kTt3URSjMIg63QzQxrRcUWrkChF9UO4NomuQIG6Uavi1GjunP98WB7A6jRAShw_TrLjkVrrTKo00_c6PA_ZH6QaGhw21QDbM-27pYHz6M8DdN-EacPEA1F4p-t4uH4Y17H3LViWMWLk7uTlFa0ohPw08PYyIbo2zYtVGSrxWBsfgsPCjbZzNmyShF-pHWVRXTEHb50i0vfxpM6-kQWnEDXRNCk7je0b2zO");'></div>
<div class="absolute bottom-3 left-3">
<p class="text-white/70 text-lg font-bengali font-medium">সিংহ</p>
</div>
</div>
</div>
<!-- Tiger -->
<div class="flex flex-col gap-2 opacity-100">
<div class="w-full aspect-[4/3] bg-[#1f2321] rounded-2xl overflow-hidden border border-gray-800 relative">
<div class="w-full h-full bg-center bg-no-repeat bg-cover opacity-60 grayscale-[30%]" data-alt="Illustration of a tiger in the wild" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuAVh-AIrsmCKELGo6nf0B3c5FJYz_8LidzTy4OJ7HklkkX97fdjNeYuE-Aagll67XzYJKKNx4lGUeWNy240nqmLM4W3mPpi600XvIa4n01THDzhS_byTdrqBg-278QraF83k7Q8iOGuNPSFCWc7_MS1pOno7ZIuyFpYbBr__9LzRM3vwBU6CQzIaSEDiC2jM6G8_P-D3ErHi1Lpqe6BvjJWVnR5Zq1SZbQGIxgOX8D4jwxqSZP0Pq7IFHelREX7m-3GXC1G2gX4XqzR");'></div>
<div class="absolute bottom-3 left-3">
<p class="text-white/70 text-lg font-bengali font-medium">বাঘ</p>
</div>
</div>
</div>
<!-- Elephant -->
<div class="flex flex-col gap-2 opacity-100">
<div class="w-full aspect-[4/3] bg-[#1f2321] rounded-2xl overflow-hidden border border-gray-800 relative">
<div class="w-full h-full bg-center bg-no-repeat bg-cover opacity-60 grayscale-[30%]" data-alt="Illustration of an elephant standing" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDl62H8dxJ1IGHEkaPtHdu63Q-BujxEIx2hjKsexOarBfKVGhJFNl-TTN_AdNCS_vERQxj0-GUhECYetHsv_F7YzIPgLF-WhDfEuqENjQZ3v8uVanf8Tn-fjVgTM4yasRUDfTOuMPKf1Pwzy8rLg0UNF8_v7Cj2uKdGJDAcvDg4ZXYAky5gyX47sS0ei7t8xXdLtU2zuZzjkmASw0hpuixZCAknyHzXE3CRuCOhz9DqgylwO_CwniT2ilA0sTas_zLbPGJJXq7czRNp");'></div>
<div class="absolute bottom-3 left-3">
<p class="text-white/70 text-lg font-bengali font-medium">হাতি</p>
</div>
</div>
</div>
<!-- Monkey -->
<div class="flex flex-col gap-2 opacity-100">
<div class="w-full aspect-[4/3] bg-[#1f2321] rounded-2xl overflow-hidden border border-gray-800 relative">
<div class="w-full h-full bg-center bg-no-repeat bg-cover opacity-60 grayscale-[30%]" data-alt="Illustration of a monkey on a tree" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDer4lAXm-3iMKf64ta0VZS9fp5Ywuaj2cObRVvj9DhXGP2pBnOeC3kMsFgn7BhZpDYvdvVKCZe0n-dcUPFLVuRgWB4l-4W2VCI_3WukrYEj-q_eAFjwS6dGtXzpFFekz1VSeW8FVbSdbfKUfLtWvhz45EeU5YUcbFV6ThClM_2u2Cqok8HQy2CfjUyFCWj_O4QtkVi1SdZi6ECivLb8vfe9gGkxpWG0NkJOjTm7tBgSmOuV8Kd190cpSLPMlNzmMxb6hU-R6rG6RA1");'></div>
<div class="absolute bottom-3 left-3">
<p class="text-white/70 text-lg font-bengali font-medium">বানর</p>
</div>
</div>
</div>
<!-- Cat -->
<div class="flex flex-col gap-2 opacity-100">
<div class="w-full aspect-[4/3] bg-[#1f2321] rounded-2xl overflow-hidden border border-gray-800 relative">
<div class="w-full h-full bg-center bg-no-repeat bg-cover opacity-60 grayscale-[30%]" data-alt="Illustration of a cat face closeup" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuBeNEnQYIOiErHITDNUke2AzKZ01ZwJJuyuJn2IoLA0tMnoCSdf_aQOOCD3M4OUlUd2ZGox2xpaEnvh7oxDQ_PW5nGiB_-I7_D1FQ3h7LDTxilAwpgkbNvN9213p-AhYzYLEZrbUv3CkN_xQmXgGz6kmczb-6lZRGbvuruXKu7Jb_Z22fwDslZ05mbcpaKSveu6azB7da5zJGYKOMe_xtdLPstbkvzAccvSywqL1U1QK-Mul1T3TRnlWT4HIwp2aawiqO8uYIPBC3f2");'></div>
<div class="absolute bottom-3 left-3">
<p class="text-white/70 text-lg font-bengali font-medium">বিড়াল</p>
</div>
</div>
</div>
</div>
</div>
<!-- The Dark Overlay Layer -->
<!-- This sits above normal content (z-0) but below the target card (z-30) -->
<div class="absolute inset-0 z-20 bg-black/70 backdrop-blur-sm"></div>
<!-- Bottom Controls / Pagination Layer -->
<div class="absolute bottom-0 left-0 w-full z-40 pb-8 pt-12 bg-gradient-to-t from-black via-black/80 to-transparent flex flex-col items-center justify-end gap-6">
<!-- Pagination Dots -->
<div class="flex flex-row items-center justify-center gap-3">
<div class="h-2.5 w-2.5 rounded-full bg-white shadow-[0_0_8px_rgba(255,255,255,0.8)]"></div>
<div class="h-2.5 w-2.5 rounded-full bg-white/20"></div>
<div class="h-2.5 w-2.5 rounded-full bg-white/20"></div>
</div>
<!-- Skip Button -->
<button class="px-6 py-2 rounded-full active:scale-95 transition-transform text-white/60 hover:text-white hover:bg-white/10 text-base font-bengali font-medium">
                এড়িয়ে যান
            </button>
</div>
</div>
</body></html>
and

<!DOCTYPE html>

<html class="dark" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Swipe Gesture Tutorial</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Lexend:wght@300;400;500;600;700&amp;family=Noto+Sans+Bengali:wght@400;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            colors: {
              "primary": "#4ceb89",
              "background-light": "#f6f8f7",
              "background-dark": "#112117",
            },
            fontFamily: {
              "display": ["Lexend", "sans-serif"],
              "bengali": ["Noto Sans Bengali", "sans-serif"],
            },
            borderRadius: {"DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "2xl": "1rem", "full": "9999px"},
            boxShadow: {
                'glow': '0 0 20px rgba(76, 235, 137, 0.3)',
            }
          },
        },
      }
    </script>
<style>
        /* Custom styles for elements not easily handled by Tailwind utilities alone */
        .hand-shadow {
            filter: drop-shadow(0px 4px 6px rgba(0,0,0,0.5));
        }
        .trail-gradient {
            background: linear-gradient(90deg, rgba(76, 235, 137, 0) 0%, rgba(76, 235, 137, 0.4) 50%, rgba(76, 235, 137, 0.8) 100%);
        }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background-dark font-display text-white overflow-hidden h-screen w-full relative select-none">
<!-- UNDERLYING APP LAYER -->
<!-- This simulates the app state behind the overlay -->
<div class="absolute inset-0 flex flex-col z-0 pointer-events-none">
<!-- Header -->
<div class="flex items-center p-4 pt-6 justify-between opacity-40">
<span class="material-symbols-outlined text-3xl">arrow_back</span>
<div class="h-2 w-32 bg-white/10 rounded-full"></div>
<span class="material-symbols-outlined text-3xl">settings</span>
</div>
<!-- Main Content Area: Cards -->
<div class="flex-1 flex items-center justify-start pl-8 pr-4 gap-6 overflow-hidden w-full">
<!-- Center Card (Cat) -->
<!-- This is the "Active" card being learned -->
<div class="relative shrink-0 w-[75%] aspect-[3/4] bg-[#1c2620] rounded-2xl p-4 flex flex-col gap-4 shadow-xl border border-white/5">
<!-- Image Area -->
<div class="w-full flex-1 bg-cover bg-center rounded-xl relative overflow-hidden" data-alt="Illustration of a cute cat sitting comfortably" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuA83CBrIgzEOVtoYoeMp3t8fq-AGW2SxHEau_rekK6OFclFOcB_IJqNcKKgLBBcRiCTZTvLq57mjA7DNZ-OScjWC4VpK1tIXb6ebIThXq9k6sJ9CW2YavEtlP5l7l9iujlZ1bQoUreOI4iAi6WPFo7J2-P6D4i8IGYjri1djTuKE4ZVrw8GulX891GZsIpVx9Mc9bhwmVQTt6tim1PSFH-bMfwF-pfsuGZS8MEiYRdi00hl5IVYJVm8PjrDSdCSQ-weSXm2iK_lwKMF');">
<!-- Gradient overlay for text readability if needed -->
<div class="absolute inset-0 bg-gradient-to-t from-black/40 to-transparent"></div>
</div>
<!-- Card Text -->
<div class="flex flex-col gap-1 items-center pb-2">
<h2 class="text-white text-3xl font-bold leading-tight font-bengali">বিড়াল</h2>
<p class="text-[#9db8a8] text-lg font-normal leading-normal">Cat</p>
</div>
</div>
<!-- Right Peeking Card (Fish) -->
<!-- 50% opacity to indicate next item -->
<div class="relative shrink-0 w-[75%] aspect-[3/4] bg-[#1c2620] rounded-2xl p-4 flex flex-col gap-4 shadow-xl border border-white/5 opacity-50">
<div class="w-full flex-1 bg-cover bg-center rounded-xl" data-alt="Illustration of a colorful fish swimming" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuBfpgeWa6utKlxl4dNHDUiIdajEbebjEZK0IBzfl6ytN2BnUUw4h_6Q-5A4OrIWZaDSFdTxSD1LZtt4ODURwqzzMZAwfr2dnWv4Z5E6zYWRTiEseT5YzODBHthfRl2UrxKGNfO2e_3YviGq1uyb9N09_bWDQ9NqqPg4L7pXw8KpASx31hBdotIMAH9HFyNr38c_Jifo7AIIH7MK_XsLgvwvZn5TmPvVvUmGzy2NnPXozGT5sP4KpwZgeJZUbWwS5qpfo8baIr_LoBTW');">
</div>
<div class="flex flex-col gap-1 items-center pb-2">
<h2 class="text-white text-3xl font-bold leading-tight font-bengali">মাছ</h2>
<p class="text-[#9db8a8] text-lg font-normal leading-normal">Fish</p>
</div>
</div>
</div>
<!-- Bottom placeholder space -->
<div class="h-24 w-full"></div>
</div>
<!-- OVERLAY LAYER -->
<!-- 70% opacity dark background -->
<div class="fixed inset-0 bg-black/70 z-50 flex flex-col items-center justify-end pb-12">
<!-- Interactive Tutorial Area (Centered vertically relative to the screen usually, but here positioned over the cards visually) -->
<div class="absolute inset-0 flex flex-col items-center justify-center pointer-events-none">
<!-- Gesture Visualization Container -->
<div class="relative w-full max-w-xs h-40 flex items-center justify-center translate-y-8">
<!-- Motion Trail -->
<!-- Visualizing the left-to-right swipe -->
<div class="absolute left-16 right-24 h-16 flex items-center">
<!-- Dashed Path / Gradient Trail -->
<div class="w-full h-3 trail-gradient rounded-full blur-[1px]"></div>
<!-- Directional Arrow Head -->
<span class="material-symbols-outlined text-primary text-4xl -ml-2 drop-shadow-glow" style="font-variation-settings: 'FILL' 1;">
                        arrow_right_alt
                    </span>
</div>
<!-- Realistic Hand Icon -->
<!-- Positioned 'mid-swipe' -->
<div class="relative z-10 hand-shadow transform translate-x-8 translate-y-6">
<!-- Using a Material Icon styled to look like a large illustration -->
<span class="material-symbols-outlined text-white text-[100px] opacity-90 rotate-[-15deg]" style="font-variation-settings: 'FILL' 1, 'wght' 300;">
                        pan_tool_alt
                    </span>
<!-- Touch ripple effect simulation -->
<div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-16 h-16 bg-white/20 rounded-full animate-ping"></div>
</div>
</div>
<!-- Instruction Text -->
<h1 class="text-white text-2xl font-bold text-center mt-6 font-bengali drop-shadow-md tracking-wide">
                পাশে সোয়াইপ করো
            </h1>
</div>
<!-- Bottom Controls -->
<div class="flex flex-col items-center gap-8 relative z-50">
<!-- Pagination Dots -->
<div class="flex items-center gap-3">
<div class="w-2.5 h-2.5 rounded-full bg-white/30"></div>
<div class="w-2.5 h-2.5 rounded-full bg-white shadow-[0_0_8px_rgba(255,255,255,0.6)] scale-110"></div>
<div class="w-2.5 h-2.5 rounded-full bg-white/30"></div>
</div>
<!-- Skip Button -->
<!-- Ensure hit area is generous -->
<button class="text-white/70 font-bengali text-sm font-medium py-3 px-8 rounded-full hover:bg-white/10 transition-all active:scale-95">
                এড়িয়ে যান
            </button>
</div>
</div>
</body></html>

and
<!DOCTYPE html>

<html class="dark" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Exit Tutorial Overlay</title>
<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Bengali:wght@400;700&amp;family=Plus+Jakarta+Sans:wght@400;500;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<!-- Tailwind Config -->
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#7eb995",
                        "background-light": "#f6f7f7",
                        "background-dark": "#161c18",
                    },
                    fontFamily: {
                        "display": ["Plus Jakarta Sans", "sans-serif"],
                        "bengali": ["Noto Sans Bengali", "sans-serif"],
                    },
                    borderRadius: {"DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px"},
                },
            },
        }
    </script>
<style>
        /* Custom pulsing glow animation */
        @keyframes subtle-pulse {
            0%, 100% { box-shadow: 0 0 15px 0px rgba(255, 255, 255, 0.3); transform: scale(1); }
            50% { box-shadow: 0 0 25px 5px rgba(255, 255, 255, 0.5); transform: scale(1.02); }
        }
        .glow-target {
            animation: subtle-pulse 2s infinite ease-in-out;
        }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="bg-background-dark font-display antialiased overflow-hidden">
<div class="relative h-screen w-full flex flex-col overflow-hidden bg-[#131614]">
<!-- UNDERLYING APP CONTENT (Simulated Background) -->
<!-- This represents the screen the user is trying to exit from. It's blurred and dimmed by the overlay. -->
<div class="absolute inset-0 z-0 flex flex-col w-full h-full opacity-40 pointer-events-none">
<!-- Simulated Header -->
<div class="flex items-center justify-between px-4 py-3 bg-[#131614] border-b border-white/5">
<div class="flex size-10 items-center justify-center">
<span class="material-symbols-outlined text-white/50 text-2xl">close</span>
</div>
<div class="text-white/50 font-medium">Learn Colors</div>
<div class="size-10"></div>
</div>
<!-- Simulated Body Content (Map/Game) -->
<div class="flex-1 w-full p-4 grid grid-cols-2 gap-4 overflow-hidden relative">
<!-- Abstract colorful shapes representing app content -->
<div class="bg-indigo-500/30 rounded-xl h-32 w-full animate-pulse" style="animation-duration: 4s;"></div>
<div class="bg-rose-500/30 rounded-xl h-32 w-full mt-8" data-alt="abstract game pattern background" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuCy-w3xYu1pC8E3Nh4mEcP4atuzIMzWx7cPmKGDiA_bXUl8OeBRA1p0Q9O3T0RYFte68W-DOJav07JxAoVqF9ywgpaXGUtTsjdUEkaBgDv7fyKnziAbasfiKGGaeqR7WQEvmvTgFNJ9yamWK6-jcwJSoWeXZY3w_F6QNGENc0qWGisZpWdazYFaxcMPLB5bLGEAEeMEFduWTBcI2l92ikbhwXmJJOxGff2aANzUcXb9lVrhz3gpJT6Lco8RBrJURKxPt35AmVClTo0b');"></div>
<div class="bg-emerald-500/30 rounded-xl h-48 w-full col-span-2 relative overflow-hidden">
<div class="absolute inset-0 bg-cover bg-center opacity-30" data-alt="map of learning levels" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuDtxm5NU1ET-rgcDT3U6KGkKbI9LbJ_CvLwyd08I3v3LaoA1WTQv7UCaMLg6MoOvcs1j8fOHKt3WbNOQUQ8o01auSSRXJ2T25G7uDste8vU_AUEIpmOANXjFFaCQrpJQTiuGr8UAKPE-xrp73dQJ9_l5nFIgfr89hpHLVQ1-Kl62iJ0JV0MMirqQolfocjQ2G5Sck3NO4rfGidPsg6LiUeINNw2VnWWPFmx0wOUGMYUr6ytT7OLICpw1rb-0DO9VWNBL4uaB0lY-NPJ');"></div>
</div>
<div class="bg-amber-500/30 rounded-xl h-32 w-full"></div>
<div class="bg-sky-500/30 rounded-xl h-32 w-full mt-4"></div>
</div>
</div>
<!-- OVERLAY CONTAINER -->
<div class="absolute inset-0 z-20 flex flex-col bg-[#000000]/70 backdrop-blur-sm">
<!-- STEP 1: TOP LEFT TARGET HIGHLIGHT -->
<!-- We recreate the UI element exactly where it would be in the underlying app, but highlighted -->
<div class="px-4 py-3 flex justify-between items-center w-full">
<div class="relative group">
<!-- Pulsing Glow Ring -->
<div class="absolute -inset-2 rounded-full bg-white/20 animate-pulse"></div>
<!-- The Button Highlight -->
<button class="relative flex size-12 shrink-0 items-center justify-center rounded-full bg-white/10 border-2 border-white glow-target text-white z-20">
<span class="material-symbols-outlined text-[28px]">close</span>
</button>
<!-- Pointer Container (Hand + Arrow) -->
<div class="absolute left-2 top-full mt-4 flex flex-col items-center z-10 w-24 pointer-events-none">
<!-- Curved Arrow SVG -->
<svg class="text-white drop-shadow-lg mb-2 ml-4" fill="none" height="40" viewbox="0 0 50 60" width="40" xmlns="http://www.w3.org/2000/svg">
<!-- A simple curved arrow pointing up-left -->
<path d="M25 55 C 25 35, 30 25, 10 10" fill="none" stroke="white" stroke-linecap="round" stroke-width="3"></path>
<path d="M5 18 L 10 10 L 18 13" stroke="white" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"></path>
</svg>
<!-- Realistic Hand Icon -->
<div class="size-20 bg-contain bg-no-repeat bg-center drop-shadow-2xl" data-alt="3D hand illustration pointing upwards" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuBHQi22rwcmHP_dWUncVcnhtuva9z2oeXIhJZdaVzVQduQQQmDb4vmhArGx7xH7faWVinXF0yx7xOYPlC_TiYErefueDLKAoJbIyQ_f3c_Bwtaynv6BkwxTf0A567w-F_p0x3pTT0rfeV2OFWEUtG4wTKbQVxdIO9Cc4Qj5-PY5Lpx0BnJhm8aAbgdkm2ITf1VgAb0VDKO39PmXI4Np-Y4zu9oH07BwFwVvOO8YwNS54f8oPhK8Fipr00Z0V1_BqginkQdyD79gYobG'); transform: rotate(90deg);">
</div>
</div>
</div>
<!-- Empty space to balance header -->
<div></div>
</div>
<!-- STEP 2: CENTER INSTRUCTION TEXT -->
<div class="flex-1 flex flex-col items-center justify-center px-6 text-center z-10 mt-12">
<h2 class="text-white font-bengali font-bold text-3xl md:text-4xl leading-snug drop-shadow-md">
                    বের হতে এখানে টিপুন
                </h2>
<!-- Optional Subtitle for clarity, though not requested, keeping it hidden or minimal -->
</div>
<!-- STEP 3: BOTTOM CONTROLS (Pagination & CTA) -->
<div class="w-full pb-8 pt-4 px-6 flex flex-col items-center bg-gradient-to-t from-black/80 via-black/40 to-transparent">
<!-- Page Indicators -->
<div class="flex flex-row items-center justify-center gap-3 py-6">
<div class="h-2.5 w-2.5 rounded-full bg-white/30"></div>
<div class="h-2.5 w-2.5 rounded-full bg-white/30"></div>
<div class="h-2.5 w-2.5 rounded-full bg-white shadow-[0_0_8px_rgba(255,255,255,0.6)]"></div>
</div>
<!-- Primary Action Button -->
<div class="w-full max-w-sm">
<button class="w-full flex cursor-pointer items-center justify-center overflow-hidden rounded-xl h-14 px-5 bg-primary hover:bg-[#6fa885] transition-colors active:scale-95 shadow-lg shadow-primary/20">
<span class="text-white font-bengali text-xl font-bold tracking-wide">বুঝেছি!</span>
</button>
</div>
<!-- Safe area spacing for mobile bottom bar -->
<div class="h-6"></div>
</div>
</div>
</div>
</body></html>
and
