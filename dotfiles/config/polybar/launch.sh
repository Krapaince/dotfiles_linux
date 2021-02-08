#!/usr/bin/bash
# {{@@ header() @@}}

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

{%@@ if profile == "Krapaince-MASTER-arch" @@%}
MONITOR=$MON_DP polybar left_top -c ~/.config/polybar/config.ini &

MONITOR=$MON_HDMI polybar mid_top -c ~/.config/polybar/config.ini &
MONITOR=$MON_HDMI polybar mid_bot -l info -c ~/.config/polybar/config.ini &

MONITOR=$MON_DVI polybar right_top -c ~/.config/polybar/config.ini &

{%@@ elif profile == "Krapaince-arch" @@%}
{%@@ endif @@%}

## Launch bar1 and bar2
#if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=$m polybar top -c ~/.config/polybar/config.ini &
#    MONITOR=$m polybar bottom -c ~/.config/polybar/config.ini &
#  done
#else
#  polybar top -c ~/.config/polybar/config.ini &
#  polybar bottom -c ~/.config/polybar/config.ini &
#fi
#
