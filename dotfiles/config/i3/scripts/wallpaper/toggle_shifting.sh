#!/usr/bin/env bash
# {{@@ header() @@}}

source ~/.config/i3/scripts/wallpaper/common.sh

CONTENT=$(jq ".paused = $(jq '.paused | not' $CURRENT_SETTING_PATH)" $CURRENT_SETTING_PATH)
echo -n $CONTENT > $CURRENT_SETTING_PATH
