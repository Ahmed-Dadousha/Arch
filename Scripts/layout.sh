#!/bin/bash

current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')

setxkbmap -option caps:escape

[ "$current_layout" = "ara" ] && setxkbmap -layout us
[ "$current_layout" = "us" ] && setxkbmap -layout ara

pkill -RTMIN+10 dwmblocks
