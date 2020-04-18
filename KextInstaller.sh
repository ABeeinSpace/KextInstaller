#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "I need root permissions to do my thing! Please run me with sudo"
   exit 1

else
    echo "fixing permissions on /System/Library/Extensions..."
    command sudo chmod -R 755 /System/Library/Extensions
    command sudo chown -R 0:0 /System/Library/Extensions
    echo "Fixing permissions on /Library/Extensions... "
    command sudo chmod -R 755 /Library/Extensions
    command sudo chown -R 0:0 /Library/Extensions
    echo "Done fixing permissions! Rebuilding kextcache.. "
    command sudo kextcache -i /
    echo "I'm all done! Have a nice rest of your day and good luck on all of your fruit shaped endeavors!"
    echo "Script made by ABeeinSpace. Props to StackExchange for a lot of this script and sudo detection"
    exit 0
fi