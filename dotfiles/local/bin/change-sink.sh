#!/usr/bin/env bash
# {{@@ header() @@}}
# https://gist.github.com/jkcdarunday/617a0f6662726bd85a71e72969c54128

# Author: Jan Keith Darunday <github@jkcdarunday.mozmail.com>
# Description: A shell script that switches to the next available Pulseaudio output device/sink
# Note: This uses pactl instead of pacmd since pacmd is not available in pipewire

function get_current_sink() {
  pactl info | sed -En 's/Default Sink: (.*)/\1/p'
}

SINKS=$(pactl list short sinks | grep -v easyeffects)
SINK_COUNT=$(echo "$SINKS" | wc -l)

CURRENT_SINK=$(get_current_sink)
CURRENT_SINK_INDEX=$(echo "$SINKS" | grep -n "$CURRENT_SINK" | grep -Eo '^[0-9]+')

MAX_RETRIES=6
RETRIES=0

while true; do
  [ "$RETRIES" -ge "$MAX_RETRIES" ] && echo "Reached retry limit of $MAX_SINK_SKIPS, giving up." && break

  NEW_SINK_INDEX=$(((CURRENT_SINK_INDEX + $RETRIES) % $SINK_COUNT + 1))
  NEW_SINK=$(echo "$SINKS" | sed "${NEW_SINK_INDEX}q;d" | awk '{ print $2 }')

  echo "Switching to sink: $NEW_SINK"
  pactl set-default-sink "$NEW_SINK"

  [ "$(get_current_sink)" = "$NEW_SINK" ] && break

  # Note: switching could fail if, for example, the new sink does not have any available output port
  echo "Failed to switch to sink: $NEW_SINK, skipping to next sink..."
  RETRIES=$((RETRIES + 1))
done

# Forward all playing audio (sink inputs) to the new sink (Uncomment if your system does not automatically do this)
SINK_INPUTS=($(pactl list short sink-inputs | grep -Eo '^[0-9]+'))
for SINK_INPUT in ${SINK_INPUTS[*]}; do pactl move-sink-input $SINK_INPUT $NEW_SINK; done
