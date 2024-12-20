#!/bin/bash

choice=$(echo -e "Shutdown\nReboot\nExit" | dmenu  -fn "MesloLGS NF:size=10")

[ $choice = "Shutdown" ] && doas poweroff
[ $choice = "Reboot" ] && doas reboot
[ $choice = "Exit" ] && pkill dwm
