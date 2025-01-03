#!/bin/bash

choice=$(echo -e "Shutdown\nReboot\nExit" | dmenu -p "Action: ")

[ "$choice" = "Shutdown" ] && doas poweroff
[ "$choice" = "Reboot" ] && doas reboot
[ "$choice" = "Exit" ] && pkill dwm &
