# KextInstaller
A small script to automate fixing permissions on /System/Library/Extensions and /Library/Extensions and rebuilding kextcache
# How to use
First set the executable bit with `chmod +x ./kextinstaller.sh`
Next run the script with `sudo ./kextinstaller.sh`. You'll be prompted for your password in order to elevate to root. 
Let the script run and reboot!

# NOTE:

Catalina users will have a alrge amount of errors spit out at first when the script tries to fix permissions on /S/L/E. This is due to the system volume being read-only. I currently have no checks built in. I plan to add an option to remount as read/write once I get menu options implemented as I dont really want to clutter the code.
