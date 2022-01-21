#!/usr/bin/env bash
# {{@@ header() @@}}

# Utility script to generate all wallpapers from the color set.

set -eu

source ~/.local/bin/wallpaper/common.sh

if [[ ! -d $WALLPAPERS_DIR ]]; then
    mkdir -p $WALLPAPERS_DIR
fi

for (( i = 0; i < $COLOR_SET_LENGTH; ++i )); do
    ~/.local/bin/wallpaper/generate_wallpaper.sh \
        "{{@@ wallpaper_destination @@}}/{{@@ wallpaper_filename @@}}" $INDEX
done
