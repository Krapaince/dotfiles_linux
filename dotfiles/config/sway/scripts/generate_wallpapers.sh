#!/usr/bin/env bash
# {{@@ header() @@}}

# Utility script to generate all wallpapers from the color set.

set -eu

source ~/.local/bin/wallpaper/common.sh


for (( i = 0; i < ${#MONITORS[*]}; ++i )); do
    WALLPAPERS_DIR="$WALLPAPERS_DIR/${MONITORS[$i]}"
    echo "Monitor: ${MONITORS[$i]}"
    if [[ ! -d $WALLPAPERS_DIR ]]; then
        mkdir -p $WALLPAPERS_DIR
        echo "  folder created"
    fi

    INDEX=0
    echo "  generating wallpapers:"
    for (( i_cs = 0; i_cs < $COLOR_SET_LENGTH; ++i_cs )); do
        echo -n "    $i_cs..."
        ~/.local/bin/wallpaper/generate_wallpaper.sh "${WALLPAPERS[$i]}" $i_cs "${MONITORS[$i]}"
        echo " done."
    done
done
