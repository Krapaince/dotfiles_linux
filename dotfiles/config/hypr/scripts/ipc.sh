#!/usr/bin/env bash

socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | python ~/.config/hypr/scripts/ipc.py
