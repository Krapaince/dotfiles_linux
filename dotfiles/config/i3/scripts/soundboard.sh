#!/usr/bin/env bash
# {{@@ header() @@}}

VAR='e'

cd $SOUNDBOARD_LOCATION

while [ $VAR ]; do

VAR=$(find . -iname "*$1*.*" | rofi -dmenu -matching fuzzy -i -theme ~/.config/rofi/soundboard.rasi)
    play "$VAR"
done
