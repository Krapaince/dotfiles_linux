#!/usr/bin/env bash
# {{@@ header() @@}}

if [[ $# -ne 1 ]]; then
    echo "Expected 1 argument, got $#."
    exit 1
fi

source ~/.local/bin/wallpaper/common.sh

MONITOR=$1; shift
INDEX=$(find_array_index_by_value "$MONITOR" "${MONITORS[@]}")
WALLPAPER="${WALLPAPERS[$INDEX]}"

ENABLE=$(jq ".enable" $CURRENT_SETTING_PATH)
INDEX=$(jq '.index' $CURRENT_SETTING_PATH)

if [[ $ENABLE == "true" ]]; then
    echo $(make_img_filename_from_index $INDEX "$WALLPAPER" "$MONITOR")
else
    echo "$WALLPAPER"
fi
