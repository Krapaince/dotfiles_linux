#!/bin/bash
# {{@@ header() @@}}

layout=`setxkbmap -query | grep 'layout' | tr -s [:space:] | cut -d" " -f 2`

if  [[ $layout == "us" ]];then
    echo "Layout set to fr"
    setxkbmap fr
else
    setxkbmap us
    echo "Layout set to us"
fi
