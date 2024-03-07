#!/bin/sh

# Check if rofi is provided as an argument
if [[ "$1" == "rofi" ]]; then
  # Use rofi to select a game folder
  game=$(find . -type d -mindepth 1 -maxdepth 1 ! -name '.' ! -name '..' | rofi -dmenu -p "Select a Video Game:")
else
  # Use gum for interactive selection (if no argument)
  games=( $(ls -d */ | grep -Ev '^\\.') )

  # Check if there are any games found
  if [[ ${#games[@]} -eq 0 ]]; then
    echo "No video game folders found!"
    exit 1
  fi

  # Use gum's `choose` subcommand to present the game selection
  game=$(gum choose --header="Select a Video Game:" "${games[@]}")
fi

# Check if folder is empty
if [[ ! $(ls -A "$game") ]]; then  # Check for presence of any files (-A)
  echo "Selected folder is empty!"
  exit 1
fi

# Find the .nds file in the selected folder
nds_file=$(find "$game" -name "*.nds" -maxdepth 1)  # Search only current dir

# Check if .nds file exists
if [[ -z "$nds_file" ]]; then
  echo "No .nds file found in $game!"
  exit 1
fi

# Clear the screen before message
clear

# Define color scheme for the message box
color1="#00FF00"  # Green
color2="#FFFF00"  # Yellow

# Use gum's `multiline` and `color` to create the message box
message=$(gum style --bold --border=rounded --align=center --border-foreground="#a7bed3" --foreground="#470ff4" "Enjoy Playing" "$game\!")

# Print the message box
echo "$message"

sleep 5

# Run melonDS with the .nds file using flatpak
exec flatpak run net.kuribo64.melonDS "$nds_file"
