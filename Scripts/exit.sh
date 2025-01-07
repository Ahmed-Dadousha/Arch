#!/bin/bash

choice=$(echo -e "⏻ Shutdown\n Reboot\n󰿅 Exit" | dmenu -p " Action: ")

[ "$choice" = "⏻ Shutdown" ] && doas poweroff
[ "$choice" = " Reboot" ] && doas reboot
[ "$choice" = "󰿅 Exit" ] && pkill dwm &
