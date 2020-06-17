#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "I need root permissions to do my thing! Please run me with sudo"
   exit 1

else
PS3='Please enter your choice: '
options=("Mount EFI" "Install to EFI" "Fix Permissions for /S/L/E" "Fix Permissions for /L/E" "Rebuild Kextcache" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Mount EFI")
            command sudo diskutil mount disk0s1
            ;;
        
        "Fix Permissions for /S/L/E")
            echo "fixing permissions on /System/Library/Extensions..."
            command sudo chmod -R 755 /System/Library/Extensions
            command sudo chown -R 0:0 /System/Library/Extensions
            echo "Done fixing permissions!"
            ;;
        "Fix Permissions for /L/E")
            echo "Fixing permissions on /Library/Extensions... "
            command sudo chmod -R 755 /Library/Extensions
            command sudo chown -R 0:0 /Library/Extensions
            echo "Done fixing permissions!"
            ;;
        "Rebuild Kextcache")
            echo "Rebuilding kextcache..."
            command sudo kextcache -i /
            ;;
        "Quit")
            echo "Script made by ABeeinSpace. Props to StackExchange for a lot of this script and sudo detection"
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

fi