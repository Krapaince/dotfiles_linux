#!/usr/bin/env bash
# {{@@ header() @@}}

source ~/.config/i3/scripts/wallpaper/common.sh

if [[ $(jq ".enable" $CURRENT_SETTING_PATH) == "true" ]]; then
    INDEX=$(jq '.index' $CURRENT_SETTING_PATH)
    JSON_SETTING=$(jq ".colors[$INDEX]" $COLOR_SET_PATH)

    LOWTHRESH=$(    echo $JSON_SETTING | jq '.l')
    HIGHTHRESH=$(   echo $JSON_SETTING | jq '.h')
    RED=$(          echo $JSON_SETTING | jq '.r')
    YELLOW=$(       echo $JSON_SETTING | jq '.y')
    GREEN=$(        echo $JSON_SETTING | jq '.g')
    CYAN=$(         echo $JSON_SETTING | jq '.c')
    BLUE=$(         echo $JSON_SETTING | jq '.b')
    MAGENTA=$(      echo $JSON_SETTING | jq '.m')

    FILENAME=$(make_img_filename_from_parameters $LOWTHRESH $HIGHTHRESH $RED $YELLOW $GREEN $CYAN $BLUE $MAGENTA)
    echo $WALLPAPERS_DIR/$FILENAME
else
    echo {{@@ wallpaper_destination @@}}/{{@@ wallpaper_filename @@}}
fi
