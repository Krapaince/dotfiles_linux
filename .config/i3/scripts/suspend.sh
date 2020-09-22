#!/bin/bash

~/.config/i3/scripts/lock.sh

# Prevent the screen flash when exiting the suspend mode
/usr/bin/sleep 1

systemctl suspend
