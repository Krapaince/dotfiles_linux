#!/bin/bash
# {{@@ header() @@}}

VAR='e'

cd $SOUNDBOARD_LOCATION

while [ $VAR ]; do

VAR=$(find . -iname "*$1*.*" | rofi -dmenu -matching fuzzy -i -theme /home/krapaince/.config/rofi/soundboard.rasi)
    play "$VAR"
done
