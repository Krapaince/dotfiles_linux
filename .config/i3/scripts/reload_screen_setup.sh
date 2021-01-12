#!/bin/bash
xrandr  --output $MON_DVI --off \
        --output $MON_HDMI --mode 1920x1080 --pos 1280x0 --rotate normal \
        --output $MON_DP --mode 1280x1024 --pos 0x0 --rotate normal
/home/krapaince/.config/i3/scripts/setup_screen.sh setup_screen.sh
/home/krapaince/.config/i3/scripts/set_wallpaper.sh
i3-msg restart
