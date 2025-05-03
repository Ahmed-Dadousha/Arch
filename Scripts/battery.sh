#!/bin/bash
battery_capacity=$(command cat /sys/class/power_supply/BAT0/capacity)
battery_status=$(command cat /sys/class/power_supply/ADP0/online)

[ "$battery_status" -eq 1 ] && [ "$battery_capacity" -eq 100 ] && echo "󰂅 $battery_capacity%" # Full
[ "$battery_status" -eq 1 ] && [ "$battery_capacity" -lt 100 ] && echo "󰢝 $battery_capacity%" # Charging
[ "$battery_status" -eq 0 ] && echo "󱟥 $battery_capacity%"                                    # Discharging
