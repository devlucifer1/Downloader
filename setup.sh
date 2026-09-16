#!/usr/bin/env bash

echo "=============================="
echo "        Downloader"
echo "=============================="

# Detect operating system
if [ -n "$PREFIX" ]; then
    SYSTEM="Termux"
    COMPILER="clang++"
else
    SYSTEM="Linux"
    COMPILER="g++"
fi

echo "[+] System: $SYSTEM"
echo "[+] Compiler: $COMPILER"
echo

# Check source file
if [ ! -f "downloader.cpp" ]; then
    echo "[!] downloader.cpp not found!"
    exit 1
fi

# ==============================
# Termux
# ==============================
if [ "$SYSTEM" = "Termux" ]; then

    echo "[*] Checking Termux dependencies..."

    pkg update -y

    # Compiler
    if ! command -v clang++ >/dev/null 2>&1; then
        echo "[*] Installing clang..."
        pkg install clang -y
    fi

    # Python
    if ! command -v python3 >/dev/null 2>&1 && ! command -v python >/dev/null 2>&1; then
        echo "[*] Installing Python..."
        pkg install python -y
    fi

    # FFmpeg
    if ! command -v ffmpeg >/dev/null 2>&1; then
        echo "[*] Installing FFmpeg..."
        pkg install ffmpeg -y
    fi

# ==============================
# Linux
# ==============================
else

    echo "[*] Checking Linux dependencies..."

    # Compiler
    if ! command -v g++ >/dev/null 2>&1; then
        echo "[*] Installing g++..."
        sudo apt update
        sudo apt install g++ -y
    fi

    # Python
    if ! command -v python3 >/dev/null 2>&1; then
        echo "[*] Installing Python..."
        sudo apt update
        sudo apt install python3 -y
    fi

    # FFmpeg
    if ! command -v ffmpeg >/dev/null 2>&1; then
        echo "[*] Installing FFmpeg..."
        sudo apt update
        sudo apt install ffmpeg -y
    fi

fi

# ==============================
# Verify dependencies
# ==============================

echo
echo "[*] Verifying dependencies..."

if ! command -v "$COMPILER" >/dev/null 2>&1; then
    echo "[!] Compiler installation failed!"
    exit 1
fi

if ! command -v ffmpeg >/dev/null 2>&1; then
    echo "[!] FFmpeg installation failed!"
    exit 1
fi

if ! command -v python3 >/dev/null 2>&1 && ! command -v python >/dev/null 2>&1; then
    echo "[!] Python installation failed!"
    exit 1
fi

echo "[+] All dependencies are ready!"
echo

# ==============================
# Make yt-dlp executable
# ==============================

if [ -f "yt-dlp" ]; then
    chmod +x yt-dlp
    echo "[+] yt-dlp is ready."
else
    echo "[!] yt-dlp not found!"
    exit 1
fi

echo

# ==============================
# Compile
# ==============================

echo "[*] Compiling..."

"$COMPILER" downloader.cpp -o downloader

if [ $? -ne 0 ]; then
    echo "[!] Compilation failed!"
    exit 1
fi

echo "[+] Compilation successful!"
echo

# ==============================
# Run
# ==============================

echo "[*] Running Downloader..."
echo

./downloader
