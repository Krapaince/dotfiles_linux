#!/usr/bin/env bash

slurp | grim -g - - | satty --filename - --copy-command wl-copy --early-exit
