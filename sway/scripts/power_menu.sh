#!/bin/bash

SELECTION="$(printf "󰌾 Lock\n󰤄 Suspend\n󰍃 Log out\n Reboot\n Reboot to UEFI\n󰐥 Shutdown" | fuzzel --dmenu -a top-right -l 6 -w 18 -p "Select an option: ")"

case $SELECTION in
    *"󰌾 Lock"*)
        gtklock;;
    *"󰤄 Suspend"*)
        systemctl suspend;;
    *"󰍃 Log out"*)
        swaymsg exit;;
    *" Reboot"*)
        systemctl reboot;;
    *" Reboot to UEFI"*)
        systemctl reboot --firmware-setup;;
    *"󰐥 Shutdown"*)
        systemctl poweroff;;
esac
