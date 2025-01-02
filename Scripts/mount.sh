#!/bin/bash
usbs=$(ls -lahF /sys/block | rg usb | cut -d '/' -f 12 | xargs -I {} lsblk --output NAME,SIZE,LABEL,MOUNTPOINT /dev/{} | rg 'sd[a-z]+[0-9]+' | sed 's/^..//')

usb=$(echo "$usbs" | dmenu)
usb_name=$(echo "$usb" | awk '{print $1}')
usb_label=$(echo "$usb" | awk '{print $3}')

[ -z "$usb" ] && exit
[ ! -d "/mnt/USB/$usb_label" ] && doas mkdir "/mnt/USB/$usb_label" && doas chown adosha:adosha "/mnt/USB/$usb_label" -R && doas mount "/dev/$usb_name" "/mnt/USB/$usb_label" && exit
[ -d "/mnt/USB/$usb_label" ] && doas umount "/dev/$usb_name" && doas rm -rf "/mnt/USB/$usb_label" && exit
