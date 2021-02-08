#!/bin/bash
# {{@@ header() @@}}

pkill dunst
dunst -config ~/.config/dunst/dunstrc &

notify-send -u critical -a "System" "Status: The engine are overheating!"
notify-send -u normal -a "Discord" "Someone: some message..."
notify-send -u low -a "Adibou 2" "Message: Rejoint moi dans mon monde merveilleux"
