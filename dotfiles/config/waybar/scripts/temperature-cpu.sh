#!/usr/bin/env bash

TEMPRATURE=$(temperature-cpu.sh)

function temperature_to_text() {
  local TEMPRATURE=$1

  if [[ $TEMPRATURE -lt 35 ]]; then
    echo -n "idle"
  elif [[ $TEMPRATURE -lt 45 ]]; then
    echo -n "light"
  elif [[ $TEMPRATURE -lt 55 ]]; then
    echo -n "medium"
  elif [[ $TEMPRATURE -lt 75 ]]; then
    echo -n "high"
  else
    echo -n "max"
  fi
}

CLASS=$(temperature_to_text "$TEMPRATURE")

echo -n "{\"text\": \"$TEMPRATURE\", \"class\": \"$CLASS\"}"
