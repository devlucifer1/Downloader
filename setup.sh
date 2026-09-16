#!/usr/bin/env bash

echo "=============================="
echo "       Downloader"
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

# Check compiler
if ! command -v "$COMPILER" >/dev/null 2>&1; then
    echo "[!] Compiler not found."
    echo "[*] Installing..."

    if [ "$SYSTEM" = "Termux" ]; then
        pkg update -y
        pkg install clang -y
    else
        sudo apt update
        sudo apt install g++ -y
    fi
fi

# Verify compiler
if ! command -v "$COMPILER" >/dev/null 2>&1; then
    echo "[!] Failed to install compiler."
    exit 1
fi

echo "[+] Dependencies OK"
echo

# Compile
echo "[*] Compiling..."

"$COMPILER" downloader.cpp -o download

if [ $? -ne 0 ]; then
    echo "[!] Compilation failed!"
    exit 1
fi

echo "[+] Compilation successful!"
echo

# Run
echo "[*] Running Downloader..."
echo

./download
