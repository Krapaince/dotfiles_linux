#!/usr/bin/env bash
# {{@@ header() @@}}

# Reset the main keyboard layout
setxkbmap us

killall -SIGUSR1 dunst
i3lock -ti {{@@ wallpaper @@}} -n
killall -SIGUSR2 dunst
