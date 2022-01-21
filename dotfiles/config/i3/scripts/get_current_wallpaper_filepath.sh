#!/usr/bin/env bash
# {{@@ header() @@}}

source ~/.local/bin/wallpaper/common.sh

if [[ $(jq ".enable" $CURRENT_SETTING_PATH) == "true" ]]; then
    INDEX=$(jq '.index' $CURRENT_SETTING_PATH)

    echo make_img_filename_from_index $INDEX "{{@@ wallpaper_destination @@}}/{{@@ wallpaper_filename @@}}"
else
    echo "{{@@ wallpaper_destination @@}}/{{@@ wallpaper_filename @@}}"
fi
