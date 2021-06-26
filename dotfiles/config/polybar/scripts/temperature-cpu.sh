#!/usr/bin/env bash
# {{@@ header() @@}}

sensors | grep "Package id" | cut -d ' ' -f 5 | cut -d '+' -f 2 | cut -d '.' -f 1
