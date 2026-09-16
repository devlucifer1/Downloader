#include <iostream>
#include <string>
#include <cstdlib>
using namespace std;
void downloadVideo() {
    // Implementation for downloading video
    string url;
    string path = "~/Downloads/%(title)s.%(ext)s";
    cout << "Enter the URL of the video to download: ";
    cin >> url;
    string command = "./yt-dlp --impersonate chrome -o \"" + path + "\" \"" + url + "\"";
    int result = system(command.c_str());
    if (result == 0) {
        cout << "Download completed successfully!" << endl;
        cout << "Video downloaded to: " << path << endl;
    } else {
        cout << "Error downloading video!" << endl;
    }
}
void downloadAudio() {
    // Implementation for downloading audio
    string url;
    cout << "Enter the URL of the audio to download: ";
    cin >> url;
    string path = "~/Downloads/%(title)s.%(ext)s";
    string command = "./yt-dlp --impersonate chrome -x --audio-format mp3 -o \"" + path + "\" \"" + url + "\"";
    int result = system(command.c_str());
    if (result == 0) {
        cout << "Download completed successfully!" << endl;
        cout << "Audio downloaded to: " << path << endl;
    } else {
        cout << "Error downloading audio!" << endl;
    }
}
int main() {
    cout << R"(██████╗  ██████╗ ██╗    ██╗███╗   ██╗██╗      ██████╗  █████╗  ██████╗ 
██╔══██╗██╔══██╗██║    ██║████╗  ██║██║     ██╔══██╗██╔══██╗██╔══██╗
██║  ██║██║  ██║██║ █╗ ██║██╔██╗ ██║██║     ██║  ██║███████║██║  ██║
██║  ██║██║  ██║██║███╗██║██║╚██╗██║██║     ██║  ██║██╔══██║██║  ██║
██████╔╝██████╔╝╚███╔███╔╝██║ ╚████║███████╗██████╔╝██║  ██║██████╔╝
╚═════╝ ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═══╝╚══════╝╚═════╝ ╚═╝  ╚═╝╚═════╝
                         powered by lucifer)" << endl;
    int choice;
    cout << "Select an option:\n";
    cout << "1. Download Video\n";
    cout << "2. Download Audio\n";
    cout << "3. Exit\n";
    cout << "Enter your choice: ";
    cin >> choice;

    switch (choice) {
        case 1:
            downloadVideo();
            break;
        case 2:
            downloadAudio();
            break;
            case 3:
            cout << "Exiting the program." << endl;
            break;
        default:
            cout << "Invalid choice!" << endl;
            break;
    }

    return 0;
}