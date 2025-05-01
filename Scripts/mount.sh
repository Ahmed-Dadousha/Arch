#!/bin/bash
# Get usb avilable block devices
usbs=$(ls -lahF /sys/block | rg usb | cut -d '/' -f 12 | xargs -I {} lsblk --output NAME,SIZE,LABEL,MOUNTPOINT /dev/{} | rg 'sd[a-z]+[0-9]+' | sed 's/^../󰕓 /')

# If There is usb devices
if [ -n "$usbs" ]; then
    #Choose a usb device
    usb=$(echo "$usbs" | dmenu -p "󱇰 USB Devices: ")
    # Get selected device name
    usb_name=$(echo "$usb" | awk '{print $2}')
    # Get Selected device label
    usb_label=$(echo "$usb" | awk '{print $4}')

    # Assign a name to selected device if it is empty
    [ -z "$usb_label" ] || [ "$usb_label" == "/mnt/USB/New_Volume" ] && usb_label="New_Volume"
    # If no devices selected exit
    [ -z "$usb" ] && exit
    # Create a directory with selected device label and mount it to the directory
    [ ! -d "/mnt/USB/$usb_label" ] && doas mkdir "/mnt/USB/$usb_label" && doas chown adosha:adosha "/mnt/USB/$usb_label" -R && doas mount "/dev/$usb_name" "/mnt/USB/$usb_label" && exit
    # Unmount the selected device and remove the its directory
    [ -d "/mnt/USB/$usb_label" ] && doas umount "/dev/$usb_name" && doas rm -rf "/mnt/USB/$usb_label" && exit

else
    # If There is no usb devices
    dmenu -p "󱇰 No USB Devices."
fi
