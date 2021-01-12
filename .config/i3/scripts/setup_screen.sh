#!/bin/bash
xrandr  --output $MON_DVI  --mode 1920x1080 --pos 3200x0 --rotate normal --primary \
        --output $MON_HDMI --mode 1920x1080 --pos 1280x0 --rotate normal \
        --output $MON_DP   --mode 1280x1024 --pos 0x0    --rotate normal
