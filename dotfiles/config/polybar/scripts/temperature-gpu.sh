#!/usr/bin/env bash
# {{@@ header() @@}}

nvidia-smi --query -i 0 --display=TEMPERATURE | grep "GPU Current Temp" | tr -dc '0-9'
