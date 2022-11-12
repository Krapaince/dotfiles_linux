#!/usr/bin/env bash
# {{@@ header() @@}}

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MONITOR=$MON_DVI polybar tertiary_top -c ~/.config/polybar/config.ini &

MONITOR=$MON_HDMI polybar main_top -c ~/.config/polybar/config.ini &
MONITOR=$MON_HDMI polybar main_bot -l info -c ~/.config/polybar/config.ini &

MONITOR=$MON_DP polybar secondary_top -c ~/.config/polybar/config.ini &
