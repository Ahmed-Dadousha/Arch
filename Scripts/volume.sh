#!/bin/bash

arg=$1
[ "$arg" = "up" ] && amixer sset Master 1%+
[ "$arg" = "down" ] && amixer sset Master 1%-
[ "$arg" = "toggle" ] && amixer sset Master toggle

vol=$(amixer get Master | grep -o '[0-9]*%' | head -n 1)
mute=$(amixer get Master | rg off)

if [ -z "$mute" ]; then
    icon="󰕾"
else
    icon="󰝟"
fi

echo -e "$icon $vol" | doas tee "/opt/vol"

pkill -RTMIN+10 dwmblocks
