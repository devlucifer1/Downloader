📥 Downloader

A lightweight and simple Terminal-based Downloader written in C++.

Downloader uses yt-dlp as the download engine and FFmpeg for audio extraction, providing a simple menu for downloading videos or audio directly from the terminal.

---

✨ Features

- 🎬 Download videos
- 🎵 Download audio as MP3
- 🖥️ Terminal-based interface
- ⚡ Lightweight and fast
- 🐧 Linux support
- 📱 Termux support
- 🔧 Automatic setup and dependency checking
- 📂 Saves downloaded files to the Downloads directory
- 🛠️ Uses "yt-dlp" as the download engine
- 🎞️ Uses "FFmpeg" for audio conversion

---

🖥️ Supported Systems

System| Support
🐧 Linux| ✅
📱 Termux| ✅

---

📦 Requirements

The project requires:

- C++ compiler
- "yt-dlp"
- "FFmpeg"

The included setup script is designed to check the required tools and install missing dependencies when possible.

Linux

The project uses:

g++

Termux

The project uses:

clang++

---

🚀 Installation & Usage

Clone the repository:

git clone https://github.com/devlucifer1/Downloader.git

Enter the project directory:

cd Downloader

Make the setup script executable:

chmod +x setup.sh

Run it:

./setup.sh

The setup script will detect the environment, check the required dependencies, compile the program, and start the Downloader.

---

🎮 How to Use

After launching the program, you will see a menu similar to:

Select an option:

1. Download Video
2. Download Audio
3. Exit

Enter your choice:

🎬 Download Video

Choose:

1

Then enter the URL of the video.

The downloaded file will be saved in the Downloads directory.

🎵 Download Audio

Choose:

2

Then enter the URL.

The Downloader will extract the audio and convert it to:

MP3

🚪 Exit

Choose:

3

to close the program.

---

📂 Output Location

Downloaded files are saved using the following filename pattern:

%(title)s.%(ext)s

The intended destination is the user's:

Downloads

directory.

---

🧩 Project Structure

Downloader/
│
├── manage.cpp
├── setup.sh
├── yt-dlp
├── ffmpeg
└── README.md

«File names may differ depending on the current project version.»

---

🔧 How It Works

Downloader is built around a simple C++ interface.

The program:

User
  │
  ▼
Downloader
  │
  ├── Video ──► yt-dlp ──► Download
  │
  └── Audio ──► yt-dlp ──► FFmpeg ──► MP3

The C++ program executes the required command-line tools and reports whether the operation completed successfully.

---

🛠️ Technologies

- C++
- yt-dlp
- FFmpeg
- Bash
- Linux / Termux

---

⚠️ Notes

Downloader relies on external tools such as "yt-dlp" and FFmpeg. Their behavior and supported websites can change independently of this project.

Make sure you have the right to download and use the content you request.

---

👨‍💻 Author

DevLucifer

GitHub:

https://github.com/devlucifer1

---

📜 License

This project is provided for educational and personal use.

Check the licenses and terms of the third-party tools used by the project, including "yt-dlp" and FFmpeg.
