#!/usr/bin/env bash

set -eu

# https://www.reddit.com/r/youtubedl/wiki/howdoidownloadpartsofavideo/

URL="$1"
FROM="$2"
TO="$3"
NAME="$4"

yt-dlp \
  -f "(bestvideo+bestaudio/best)[protocol!*=dash]" \
  --force-keyframes-at-cut \
  --download-sections "*$FROM-$TO" \
  "$URL" \
  -o "$NAME.webm"
