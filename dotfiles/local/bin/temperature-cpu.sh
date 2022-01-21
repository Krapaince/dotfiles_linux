#!/usr/bin/env bash
# {{@@ header() @@}}
# This dotfile is managed using dotdrop

sensors | grep "Package id" | cut -d ' ' -f 5 | cut -d '+' -f 2 | cut -d '.' -f 1
