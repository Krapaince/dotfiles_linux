#!/usr/bin/env bash
# {{@@ header() @@}}

WALLPAPER=$({{@@ wallpaper_script @@}} get)
FORK="-n"

while [[ "$1" =~ ^- ]]; do
    case $1 in
        --suspend | -s )
            FORK=""
    esac;
    shift;
done

# Reset the main keyboard layout
setxkbmap us

dunstctl set-paused true
{{@@ wallpaper_script @@}} toggle

i3lock \
    -i $WALLPAPER \
    $FORK \
    -S {{@@ i3lock_screen_number @@}} \
    --clock \
    --time-str="%H:%M" \
    --time-color="AAAAAA" \
    --date-str="%a %d %Y" \
    --date-color="fefedf" \
    --time-color="fefedf" \
    --radius 65 \
    --ind-pos='x+910:y+400' \
    --ring-width 4 \
    --ringver-color="00000000" \
    --ringwrong-color="00000000" \
    --ring-color="00000000" \
    --verif-color="71b84e" \
    --wrong-color="ae5043" \
    --keyhl-color="fefedf" \
    --bshl-color="fc7e7e" \
    --line-color="00000000" \
    --insidewrong-color="00000000" \
    --insidever-color="00000000" \
    --inside-color="00000000" \
    --noinput-text=""

{{@@ wallpaper_script @@}} toggle
dunstctl set-paused false
