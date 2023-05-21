#!/usr/bin/env bash

killall waybar
waybar --config ~/.config/waybar/config.json --style ~/.config/waybar/style.css &

killall swaybg
pkill -f '{{@@ wallpaper_script @@}}'
{{@@ wallpaper_script @@}} change &
