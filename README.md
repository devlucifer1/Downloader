⚡ Downloader

«A lightweight C++ terminal downloader powered by yt-dlp and FFmpeg.»

Downloader is a simple, fast, and terminal-friendly application written in C++ for downloading online videos and audio directly from Linux.

It provides a clean interactive interface while using the power of yt-dlp for media downloading and FFmpeg for audio extraction and conversion.

---

✨ Features

- 🎥 Video Downloader
  
  - Download videos directly from supported platforms.
  - Automatically uses the media title as the filename.

- 🎵 Audio Downloader
  
  - Extract audio from supported videos.
  - Convert downloaded audio to MP3 using FFmpeg.

- 🖥️ Terminal Interface
  
  - Simple interactive menu.
  - No complicated commands required.

- ⚙️ Automatic Setup
  
  - "setup.sh" checks the required dependencies.
  - Installs missing packages when possible.
  - Compiles the C++ source automatically.

- 📁 Automatic File Organization
  
  - Downloads are stored in the user's "Downloads" directory.

- 🚀 Lightweight
  
  - Written in C++.
  - Uses external tools only where necessary.

---

🛠️ Requirements

Downloader is designed for Linux.

Required

- Linux
- "g++"
- Python 3
- FFmpeg
- yt-dlp
- Git

The included "setup.sh" script handles the required environment setup.

---

📥 Installation

Clone the repository:

git clone https://github.com/devlucifer1/Downloader.git

Enter the project directory:

cd Downloader

Make the setup script executable:

chmod +x setup.sh

Run the setup:

./setup.sh

The setup script will prepare the required dependencies, compile the application, and launch Downloader.

---

🚀 Usage

After launching Downloader, the main menu will appear:

Select an option:

1. Download Video
2. Download Audio
3. Exit

Enter your choice:

🎥 Download Video

Select:

1

Then enter the URL of the video you want to download.

🎵 Download Audio

Select:

2

Then enter the URL of the video/audio source.

The audio will be extracted and converted to MP3.

❌ Exit

Select:

3

to close the application.

---

📂 Download Location

Downloaded media is stored automatically inside:

~/Downloads/

The filename is generated automatically using the media title.

Example:

~/Downloads/Video Title.mp4
~/Downloads/Song Title.mp3

---

📁 Project Structure

Downloader/
│
├── downloader.cpp
├── setup.sh
├── yt-dlp
└── README.md

Files

File| Description
"downloader.cpp"| Main C++ source code
"setup.sh"| Setup, dependency check, compilation and launcher script
"yt-dlp"| yt-dlp used by the application
"README.md"| Project documentation

---

🔧 How It Works

Downloader uses a simple C++ interface to execute "yt-dlp" commands.

The general workflow is:

User
  │
  ▼
Downloader
  │
  ├── Download Video ──► yt-dlp
  │
  └── Download Audio ──► yt-dlp ──► FFmpeg
                              │
                              ▼
                         MP3 Output

The C++ program handles the user interface and command execution, while "yt-dlp" handles media downloading and FFmpeg handles audio processing.

---

🧪 Example

Run:

./setup.sh

Then:

==============================
          Downloader
==============================

Select an option:

1. Download Video
2. Download Audio
3. Exit

Enter your choice: 1

Enter the media URL and Downloader will begin the download.

---

🐛 Troubleshooting

"Permission denied"

Make sure the setup script is executable:

chmod +x setup.sh

Then run:

./setup.sh

"g++: command not found"

Install the GNU C++ compiler:

sudo apt update
sudo apt install g++ -y

"ffmpeg: command not found"

Install FFmpeg:

sudo apt install ffmpeg -y

"python3: command not found"

Install Python 3:

sudo apt install python3 -y

---

🔄 Updating

To update the project from GitHub:

git pull

Then run:

./setup.sh

to rebuild and launch the latest version.

---

⚠️ Disclaimer

Downloader is intended for educational and personal use.

Users are responsible for complying with the terms of service, copyright laws, and applicable laws of the websites and content they access.

---

👨‍💻 Author

Lucifer

Built with:
C++ • Bash • yt-dlp • FFmpeg

«Downloader — Simple. Fast. Terminal.»
