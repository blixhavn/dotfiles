#!/bin/bash

displaySize=$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')
image=$(find $HOME/Pictures/wallpapers -name "$displaySize*" | sort -R | tail -1)
if [[ $image ]]; then
    feh --bg-fill --no-xinerama $image
else
    image="$HOME/Pictures/wallpapers/default.jpg"
    feh --bg-fill $image
fi
wal -n -i $image
