#!/usr/bin/env bash
# {{@@ header() @@}}

# Reset the main keyboard layout
setxkbmap us

systemctl suspend && ~/.config/i3/scripts/lock.sh
