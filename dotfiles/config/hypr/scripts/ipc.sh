#!/usr/bin/env bash

socat -U - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | python ~/.config/hypr/scripts/ipc.py
