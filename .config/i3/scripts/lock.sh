#!/bin/bash

# Reset the main keyboard layout
setxkbmap us

killall -SIGUSR1 dunst
i3lock -ti ~/Picture/avatar.png -n
killall -SIGUSR2 dunst
