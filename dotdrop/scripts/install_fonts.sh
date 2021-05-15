#!/usr/bin/env bash
# {{@@ header() @@}}

FONT_PATH = fonts

sudo cp $FONT_PATH/* /usr/local/share/fonts

fc-cache -f -v
