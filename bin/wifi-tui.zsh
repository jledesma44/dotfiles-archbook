#!/usr/bin/zsh

# Script to open impala in a floating kitty window on Hyprland

# Check if kitty is installed
if ! command -v kitty &>/dev/null; then
  echo "kitty is not installed!"
  exit 1
fi

# Check if bluetui is installed
if ! command -v gazelle &>/dev/null; then
  echo "gazelle is not installed!"
  echo "Install it with: yay -S gazelle-tui"
  exit 1
fi

# Launch Wifi manager in floating kitty window
kitty --class wifi-tui \
  --title "Wifi Manager" \
  -o initial_window_width=800 \
  -o initial_window_height=600 \
  bluetui
