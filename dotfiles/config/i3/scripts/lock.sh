#!/usr/bin/env bash
# {{@@ header() @@}}

# Reset the main keyboard layout
setxkbmap us

killall -SIGUSR1 dunst
i3lock \
    -ti {{@@ wallpaper @@}} \
    -n \
    -S {{@@ i3lock_screen_number @@}} \
    --clock \
    --time-str="%H:%M" \
    --time-color="AAAAAA" \
    --date-str="%a %d %Y" \
    --date-color="fefedf" \
    --time-color="fefedf" \
    --radius 75 \
    --ind-pos='x+942:y+425' \
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

killall -SIGUSR2 dunst
