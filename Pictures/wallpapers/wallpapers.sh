#!/bin/bash

displaySize=$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')

# Split monitor in two if on ultrawide
if [ "$displaySize" = "5120x1440" ]; then
    xrandr --setmonitor DP-1-1 2560/600x1440/337+0+0 DP-1 && xrandr --setmonitor DP-1-2 2560/600x1440/337+2560+0 none
elif [[ $(xrandr --listmonitors | grep DP-1-1) ]]; then
    xrandr --delmonitor DP-1-1 && xrandr --delmonitor DP-1-2
fi

image=$(find $HOME/Pictures/wallpapers -name "$displaySize*" | sort -R | tail -1)
if [[ $image ]]; then
    feh --bg-fill --no-xinerama $image
else
    image=$(find $HOME/Pictures/wallpapers -name "default*" | sort -R | tail -1)
    feh --bg-fill $image
fi
wal -n -i $image

