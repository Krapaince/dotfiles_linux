#!/bin/bash
VAR='e'

cd /home/krapaince/Music/Soundboard/

while [ $VAR ]; do

VAR=$(find . -iname "*$1*.*" | rofi -dmenu -matching fuzzy -i -theme /home/krapaince/.config/rofi/soundboard.rasi)
    play "$VAR"
done
