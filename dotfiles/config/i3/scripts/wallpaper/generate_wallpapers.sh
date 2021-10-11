#!/usr/bin/env bash
# {{@@ header() @@}}

# Utility script to generate all wallpapers from the color set.

set -eu

source ~/.config/i3/scripts/wallpaper/common.sh

INDEX=0

if [[ ! -d $WALLPAPERS_DIR ]]; then
    mkdir -p $WALLPAPERS_DIR
fi

while [[ $INDEX -lt $COLOR_SET_LENGTH ]]
do
    ~/.config/i3/scripts/wallpaper/generate_wallpaper.sh $INDEX
    INDEX=$((INDEX + 1))
done
