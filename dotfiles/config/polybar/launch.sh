#!/usr/bin/env bash
# {{@@ header() @@}}

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

{%@@ if profile == "Krapaince-MASTER-arch" @@%}
MONITOR=$MON_DVI polybar tertiary_top -c ~/.config/polybar/config.ini &

MONITOR=$MON_HDMI polybar main_top -c ~/.config/polybar/config.ini &
MONITOR=$MON_HDMI polybar main_bot -l info -c ~/.config/polybar/config.ini &

MONITOR=$MON_DP polybar secondary_top -c ~/.config/polybar/config.ini &

{%@@ elif profile == "Krapaince-ubuntu" @@%}

MONITOR=$MON_DP polybar main_top -c ~/.config/polybar/config.ini &
MONITOR=$MON_DP polybar main_bot -l info -c ~/.config/polybar/config.ini &

MONITOR=$MON_HDMI polybar secondary_top -c ~/.config/polybar/config.ini &

{%@@ elif profile == "Krapaince-arch" @@%}
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  if [[ ${m:0:3} == "eDP" ]]; then
    MONITOR=$m polybar main_top -c ~/.config/polybar/config.ini &
    MONITOR=$m polybar main_bot -c ~/.config/polybar/config.ini &
  else
    MONITOR=$m polybar secondary_top -c ~/.config/polybar/config.ini &
  fi
done
{%@@ endif @@%}
