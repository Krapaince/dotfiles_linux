#!/usr/bin/env bash
# {{@@ header() @@}}

SCREENS=( $(xrandr -q | grep " connected" | cut -d ' ' -f 1 | tr '\n' ' ' | rev | cut -c 1- | rev) )

{%@@ if profile == "Krapaince-MASTER-arch" @@%}
NAMES=('MON_DVI' 'MON_HDMI' 'MON_DP')
NB_SCREENS=3
{%@@ endif @@%}
FILE=~/.config/i3/env/monitors.sh

rm -rf $FILE

for ((i = 0 ; i < $NB_SCREENS ; i++)); do
    echo "export ${NAMES[$i]}=${SCREENS[$i]}" >> $FILE
done
