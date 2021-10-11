#!/usr/bin/env bash
# {{@@ header() @@}}
set -eu

source ~/.config/i3/scripts/wallpaper/common.sh

INDEX=$(jq '.index' $CURRENT_SETTING_PATH)
if [[ $INDEX -ge $((COLOR_SET_PATH + 1)) ]]; then
    INDEX=0
fi

if [[ $(jq ".enable" $CURRENT_SETTING_PATH) == "false" ]]; then
    if [[ ! -d $WALLPAPERS_DIR ]]; then
        mkdir -p $WALLPAPERS_DIR
    fi
fi

while true
do
    if [[ $(jq ".enable" $CURRENT_SETTING_PATH) == "false" ]]; then
        feh --bg-fill {{@@ wallpaper_destination @@}}/{{@@ wallpaper_filename @@}} --no-xinerama
        exit 0
    fi

    SLEEP_TIME=$(jq '.sleep' $CURRENT_SETTING_PATH)

    LOWTHRESH=$(    jq ".colors[$INDEX].l" $COLOR_SET_PATH)
    HIGHTHRESH=$(   jq ".colors[$INDEX].h" $COLOR_SET_PATH)
    RED=$(          jq ".colors[$INDEX].r" $COLOR_SET_PATH)
    YELLOW=$(       jq ".colors[$INDEX].y" $COLOR_SET_PATH)
    GREEN=$(        jq ".colors[$INDEX].g" $COLOR_SET_PATH)
    CYAN=$(         jq ".colors[$INDEX].c" $COLOR_SET_PATH)
    BLUE=$(         jq ".colors[$INDEX].b" $COLOR_SET_PATH)
    MAGENTA=$(      jq ".colors[$INDEX].m" $COLOR_SET_PATH)

    if [[ $(echo $LOWTHRESH+$HIGHTHRESH+$RED+$YELLOW+$GREEN+$CYAN+$BLUE+$MAGENTA | bc) = 0 ]]; then
        WALLPAPER_FILEPATH={{@@ wallpaper_destination @@}}/{{@@ wallpaper_filename @@}}
    else
      FILENAME=$(make_img_filename_from_parameters $LOWTHRESH $HIGHTHRESH $RED $YELLOW $GREEN $CYAN $BLUE $MAGENTA)
      WALLPAPER_FILEPATH="$WALLPAPERS_DIR/$FILENAME"

      if [[ ! -f $WALLPAPER_FILEPATH ]]; then
          ~/.config/i3/scripts/wallpaper/generate_wallpaper.sh $INDEX
      fi

    fi

    feh --bg-fill --no-xinerama $WALLPAPER_FILEPATH
    sleep $SLEEP_TIME

    while $(jq ".paused" $CURRENT_SETTING_PATH) == "true"
    do
        sleep $SLEEP_TIME
    done

    if [[ $INDEX -lt $((COLOR_SET_LENGTH - 1)) ]]; then
        INDEX=$((INDEX + 1))
    else
        INDEX=0
    fi

    CONTENT=$(jq ".index = $INDEX" $CURRENT_SETTING_PATH)
    echo -n $CONTENT > $CURRENT_SETTING_PATH
done
