#!/usr/bin/env bash
# {{@@ header() @@}}

COLOR_SET_PATH=~/.config/wallpaper/color_set.json
COLOR_SET_LENGTH=$(jq '.colors | length' $COLOR_SET_PATH)

CURRENT_SETTING_PATH=~/.config/wallpaper/settings.json

WALLPAPERS_DIR=~/.cache/wallpaper

{%@@ if is_wayland is defined and is_wayland @@%}
MONITORS=( $(jq -r '.[].name' ~/.config/wallpaper/monitors.json) )
WALLPAPERS=( $(jq -r '.[].path' ~/.config/wallpaper/monitors.json) )
{%@@ endif @@%}

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

########################
# Make image filename from index
# Globals:
#   COLOR_SET_PATH
# Arguments:
#   index: An index of the colors array in the color_set.json.
#   path: A fallback path (if every parameters are zero).
#   (optional) subfolder: For wayland monitors.
########################
make_img_filename_from_index() {
    if [[ $# -ne 2 ]] && [[ $# -ne 3 ]]; then
        echo "Expected 2/3 arguments for make_img_filename_from_index, got $#."
        exit 1
    fi

    local index=$1; shift
    local path=$1; shift
    if [[ $# -eq 1 ]]; then
      WALLPAPERS_DIR="$WALLPAPERS_DIR/$1"; shift
    fi

    local json_setting=$(jq ".colors[$index]" $COLOR_SET_PATH)

    lowthresh=$(    echo $json_setting | jq '.l')
    highthresh=$(   echo $json_setting | jq '.h')
    red=$(          echo $json_setting | jq '.r')
    yellow=$(       echo $json_setting | jq '.y')
    green=$(        echo $json_setting | jq '.g')
    cyan=$(         echo $json_setting | jq '.c')
    blue=$(         echo $json_setting | jq '.b')
    magenta=$(      echo $json_setting | jq '.m')

    if [[ $(echo $lowthresh+$highthresh+$red+$yellow+$green+$cyan+$blue+$magenta | bc) = 0 ]]; then
        echo $path
    else
        filename=$(make_img_filename_from_parameters $lowthresh $highthresh $red $yellow $green $cyan $blue $magenta)
        echo "$WALLPAPERS_DIR/$filename"
    fi
}

########################
# Find an index from an array value
# Globals:
#   None
# Arguments:
#   value
#   array
########################
find_array_index_by_value() {
     if [[ $# -ne 2 ]]; then
        echo "Expected 2 arguments for find_array_index_by_value, got $#."
        exit 1
    fi

    local value=$1; shift
    local array=("$@")

    for i in "${array[@]}"; do
       if [[ "${array[$i]}" = "$value" ]]; then
           echo "$i";
       fi
    done

    exit 1
}
