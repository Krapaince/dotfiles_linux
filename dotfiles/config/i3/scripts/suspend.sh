#!/bin/bash
# {{@@ header() @@}}

# Reset the main keyboard layout
setxkbmap us

i3lock -ti {{@@ wallpaper @@}} -n &

# Prevent the screen flash when exiting the suspend mode
/usr/bin/sleep 1

systemctl suspend
