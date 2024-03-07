# MelonDS CLI Game Launcher

This simple CLI tool helps you launch your favorite Nintendo DS games using the MelonDS emulator.

### Features:

    Lists available game folders in the current directory.
    Provides interactive selection using gum (default) or rofi (if specified as an argument).
    Finds the .nds file within the chosen folder and launches it with MelonDS using flatpak.
    Displays a colorful message box upon successful launch (using gum).

---

### How to Use:

    Save the script as a file (e.g., play_game.sh).
    Make the script executable: chmod +x play_game.sh
    Interactive Selection (no argument):

    ./play_game.sh

    rofi Selection:

    ./play_game.sh rofi

---

### Requirements:

    MelonDS emulator installed using flatpak install net.kuribo64.melonDS

---

Enjoy playing your favorite DS games!
