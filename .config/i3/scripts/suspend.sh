#!/bin/bash

# Reset the main keyboard layout
setxkbmap us

killall -SIGUSR1 dunst
i3lock -ti ~/Picture/avatar.png -n &

# Prevent the screen flash when exiting the suspend mode
/usr/bin/sleep 1

systemctl suspend
