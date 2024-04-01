#!/usr/bin/env bash

DIR="$HOME/Videos/screenrecords"
FILEPATH="$DIR/$(date '+%Y-%m-%d-%T-%Z').mp4"

mkdir -p "$DIR"

wl-screenrec -g "$(slurp)" --filename "$FILEPATH"
