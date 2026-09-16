#!/bin/bash

# ==========================================
#           Downloader Setup
#           Powered by Lucifer
# ==========================================

set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_DIR"

clear

echo "=========================================="
echo "              DOWNLOADER"
echo "=========================================="
echo "          Powered by Lucifer"
echo "=========================================="
echo

# ------------------------------------------
# Check Operating System
# ------------------------------------------

if [ ! -f /etc/os-release ]; then
    echo "[!] Unsupported operating system."
    exit 1
fi

source /etc/os-release

echo "[+] Operating System: $PRETTY_NAME"
echo

# ------------------------------------------
# Check Package Manager
# ------------------------------------------

if ! command -v apt >/dev/null 2>&1; then
    echo "[!] This setup currently requires APT."
    echo "[!] Supported systems include Debian/Ubuntu/Linux Mint."
    exit 1
fi

# ------------------------------------------
# Update Package List
# ------------------------------------------

echo "[*] Updating package list..."

sudo apt update

echo "[+] Package list updated."
echo

# ------------------------------------------
# Install Dependencies
# ------------------------------------------

echo "[*] Checking dependencies..."

PACKAGES=()

if ! command -v g++ >/dev/null 2>&1; then
    PACKAGES+=("g++")
fi

if ! command -v python3 >/dev/null 2>&1; then
    PACKAGES+=("python3")
fi

if ! command -v ffmpeg >/dev/null 2>&1; then
    PACKAGES+=("ffmpeg")
fi

if [ ${#PACKAGES[@]} -gt 0 ]; then

    echo "[*] Installing missing dependencies..."

    sudo apt install -y "${PACKAGES[@]}"

    echo "[+] Dependencies installed."

else

    echo "[+] All system dependencies are already installed."

fi

echo

# ------------------------------------------
# Check yt-dlp
# ------------------------------------------

echo "[*] Checking yt-dlp..."

if [ -f "$PROJECT_DIR/yt-dlp" ]; then

    chmod +x "$PROJECT_DIR/yt-dlp"

    echo "[+] Local yt-dlp found."

else

    echo "[!] Local yt-dlp was not found."

    if command -v yt-dlp >/dev/null 2>&1; then

        echo "[+] Using system yt-dlp."

    else

        echo "[*] Installing yt-dlp..."

        python3 -m pip install -U "yt-dlp[default]" --break-system-packages

        echo "[+] yt-dlp installed."

    fi
fi

echo

# ------------------------------------------
# Check C++ Source
# ------------------------------------------

SOURCE_FILE="downloader.cpp"

if [ ! -f "$SOURCE_FILE" ]; then

    echo "[!] Source file not found:"
    echo "    $SOURCE_FILE"
    echo

    echo "[!] Make sure the C++ source file is named:"
    echo "    downloader.cpp"

    exit 1
fi

# ------------------------------------------
# Compile
# ------------------------------------------

echo "=========================================="
echo "              COMPILATION"
echo "=========================================="
echo

echo "[*] Compiling Downloader..."

g++ "$SOURCE_FILE" -o downloader

echo
echo "[+] Compilation successful."
echo

# ------------------------------------------
# Run
# ------------------------------------------

echo "=========================================="
echo "              STARTING"
echo "=========================================="
echo

chmod +x downloader

./downloader
