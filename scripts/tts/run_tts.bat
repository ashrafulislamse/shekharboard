@echo off
REM ============================================================
REM Touch & Learn Board - TTS Audio Generator
REM Windows Batch Script
REM ============================================================

echo.
echo ========================================
echo  Touch Learn Board - TTS Generator
echo ========================================
echo.

REM Check if virtual environment exists
if not exist "venv" (
    echo Creating virtual environment...
    python -m venv venv
)

REM Activate virtual environment
call venv\Scripts\activate.bat

REM Check if dependencies are installed
pip show google-cloud-texttospeech >nul 2>&1
if errorlevel 1 (
    echo Installing dependencies...
    pip install -r requirements.txt
)

REM Check for .env file
if not exist ".env" (
    echo.
    echo WARNING: .env file not found!
    echo Please copy .env.example to .env and add your API keys.
    echo.
    pause
    exit /b 1
)

REM Parse command line arguments
set PROVIDER=google
set CATEGORY=all

:parse_args
if "%~1"=="" goto run
if "%~1"=="--provider" (
    set PROVIDER=%~2
    shift
    shift
    goto parse_args
)
if "%~1"=="--category" (
    set CATEGORY=%~2
    shift
    shift
    goto parse_args
)
if "%~1"=="--help" (
    goto show_help
)
shift
goto parse_args

:show_help
echo.
echo Usage: run_tts.bat [options]
echo.
echo Options:
echo   --provider ^<name^>    TTS provider (google, elevenlabs, azure)
echo   --category ^<name^>    Category to generate:
echo                         animals, fruits, vehicles, numbers,
echo                         colors, alphabet, feedback, rhymes,
echo                         stories, all
echo   --help               Show this help message
echo.
echo Examples:
echo   run_tts.bat                              # Generate all with Google
echo   run_tts.bat --provider azure             # Use Azure TTS
echo   run_tts.bat --category animals           # Generate animals only
echo   run_tts.bat --provider google --category rhymes
echo.
exit /b 0

:run
echo.
echo Provider: %PROVIDER%
echo Category: %CATEGORY%
echo.
echo Starting generation...
echo.

python generate_tts.py --provider %PROVIDER% --category %CATEGORY%

echo.
echo ========================================
echo  Generation Complete!
echo ========================================
echo.

pause
