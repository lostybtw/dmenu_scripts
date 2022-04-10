#!/usr/bin/env bash

chosen=$(echo -e "[Cancel]\nLock\nShutdown\nReboot\nSuspend\nLogout" | dmenu -i -l 20 -p 'leave: ')

if [[ $chosen = "Logout" ]]; then
        killall xinit
elif [[ $chosen = "Shutdown" ]]; then
        systemctl poweroff
elif [[ $chosen = "Reboot" ]]; then
        systemctl reboot
elif [[ $chosen = "Suspend" ]]; then
        systemctl suspend
elif [[ $chosen = "Lock" ]];then
        betterlockscreen --blur 0.3 -l 
fi
