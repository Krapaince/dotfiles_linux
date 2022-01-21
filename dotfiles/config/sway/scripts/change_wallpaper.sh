#!/usr/bin/env bash
# {{@@ header() @@}}
set -eu

source ~/.local/bin/wallpaper/common.sh

INDEX=$(jq '.index' $CURRENT_SETTING_PATH)
if [[ $INDEX -ge $((COLOR_SET_LENGTH + 1)) ]]; then
    INDEX=0
fi

if [[ $(jq ".enable" $CURRENT_SETTING_PATH) == "true" ]]; then
    for monitor in "${MONITORS[@]}"; do
      if [[ ! -d "$WALLPAPERS_DIR/$monitor" ]]; then
          mkdir -p "$WALLPAPERS_DIR/$monitor"
      fi
    done
fi

while true
do
    if [[ $(jq ".enable" $CURRENT_SETTING_PATH) == "false" ]]; then
        killall swaybg
        for (( i = 0; i < ${#MONITORS[*]}; ++i )); do
            swaybg -o "${MONITORS[$i]}" -i "${WALLPAPERS[$i]}" -m fill
        done
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

    for (( i = 0; i < ${#MONITORS[*]}; ++i )); do
        if [[ $(echo $LOWTHRESH+$HIGHTHRESH+$RED+$YELLOW+$GREEN+$CYAN+$BLUE+$MAGENTA | bc) = 0 ]]; then
            WALLPAPER_FILEPATH="${WALLPAPERS[$i]}"
        else
            FILENAME=$(make_img_filename_from_parameters $LOWTHRESH $HIGHTHRESH $RED $YELLOW $GREEN $CYAN $BLUE $MAGENTA)
            WALLPAPER_FILEPATH="$WALLPAPERS_DIR/${MONITORS[$i]}/$FILENAME"

          if [[ ! -f $WALLPAPER_FILEPATH ]]; then
              ~/.local/bin/wallpaper/generate_wallpaper.sh "${WALLPAPERS[$i]}" $INDEX "${MONITORS[$i]}"
          fi

        fi

        # https://github.com/swaywm/swaybg/issues/17
        PID=$(pgrep -f "swaybg -o ${MONITORS[$i]}")
        swaybg  -o "${MONITORS[$i]}" -i "$WALLPAPER_FILEPATH" -m fill &
        sleep 1
        kill $PID
    done
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
