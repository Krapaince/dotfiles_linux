#!/usr/bin/env bash

SCREENSHOT_FILEPATH="$HOME/Pictures/screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png"

mkdir -p "$(dirname "$SCREENSHOT_FILEPATH")"

slurp | grim -g - - | satty --filename - --output-filename "$SCREENSHOT_FILEPATH" --early-exit
wl-copy < "$SCREENSHOT_FILEPATH"
