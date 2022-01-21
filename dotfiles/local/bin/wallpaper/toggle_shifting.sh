#!/usr/bin/env bash
# {{@@ header() @@}}

source ~/.local/bin/wallpaper/common.sh

CONTENT=$(jq ".paused = $(jq '.paused | not' $CURRENT_SETTING_PATH)" $CURRENT_SETTING_PATH)
echo -n $CONTENT > $CURRENT_SETTING_PATH
