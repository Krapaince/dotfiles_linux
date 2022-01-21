#!/usr/bin/env bash
# {{@@ header() @@}}
# https://gist.github.com/jkcdarunday/617a0f6662726bd85a71e72969c54128

SINKS=$(pactl list short sinks)
SINK_COUNT=$(echo "$SINKS" | wc -l)

DEFAULT_SINK=$(pactl info | sed -En 's/Default Sink: (.*)/\1/p')
DEFAULT_SINK_INDEX=$(echo "$SINKS" | grep -n "$DEFAULT_SINK" | egrep -o '^[0-9]+')

NEW_SINK_INDEX=$((DEFAULT_SINK_INDEX % $SINK_COUNT + 1))
NEW_SINK=$(echo "$SINKS" | sed "${NEW_SINK_INDEX}q;d" | awk '{ print $2 }')

# Set next sink as the default sink
pactl set-default-sink "$NEW_SINK"

# Forward all playing audio (sink inputs) to the new sink
SINK_INPUTS=($(pactl list short sink-inputs | egrep -o '^[0-9]+'))
for SINK_INPUT in ${SINK_INPUTS[*]}; do
  pactl move-sink-input $SINK_INPUT $NEW_SINK
done
