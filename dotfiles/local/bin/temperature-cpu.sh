#!/usr/bin/env bash
# {{@@ header() @@}}

{%@@ if cpu_manufacturer == "AMD" @@%}
temp=$(sensors | grep "Tctl" | cut -d ' ' -f 10 | cut -d '+' -f 2)
echo ${temp::-2}
{%@@ else @@%}
sensors | grep "Package id" | cut -d ' ' -f 5 | cut -d '+' -f 2 | cut -d '.' -f 1
{%@@ endif @@%}
