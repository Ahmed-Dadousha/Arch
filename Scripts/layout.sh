#!/bin/bash

current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')

[ "$current_layout" = "ara" ] && setxkbmap -layout us
[ "$current_layout" = "us" ] && setxkbmap -layout ara -variant digits

setxkbmap -option caps:escape

pkill -RTMIN+10 dwmblocks
