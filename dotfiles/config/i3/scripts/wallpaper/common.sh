#!/usr/bin/env bash
# {{@@ header() @@}}

COLOR_SET_PATH=~/.config/i3/scripts/wallpaper/color_set.json
COLOR_SET_LENGTH=$(jq '.colors | length' $COLOR_SET_PATH)

CURRENT_SETTING_PATH=~/.config/i3/scripts/wallpaper/settings.json

WALLPAPERS_DIR=~/.config/i3/scripts/wallpaper/cache
SOURCE_FILE={{@@ wallpaper_destination @@}}/{{@@ wallpaper_filename @@}}

LOG_FILE=~/.config/i3/scripts/wallpaper/log

########################
# Make image filename from parameters
# Globals:
#   None
# Arguments:
#   lowthresh
#   highthresh
#   red
#   yellow
#   green
#   cyan
#   blue
#   magenta
########################
make_img_filename_from_parameters() {
    if [[ $# -ne 8 ]]; then
        echo "Expected 8 arguments for make_img_filename_from_parameters, got $#."
        exit 1
    fi

    local lowthresh=$1; shift
    local highthresh=$1; shift
    local red=$1; shift
    local yellow=$1; shift
    local green=$1; shift
    local cyan=$1; shift
    local blue=$1; shift
    local magenta=$1

    echo $(printf 'l%03d-h%03d-r%03d-y%03d-g%03d-c%03d-b%03d-m%03d.png' $lowthresh $highthresh $red $yellow $green $cyan $blue $magenta)
}
