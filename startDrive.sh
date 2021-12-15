#!/bin/bash -i

diskutil corestorage unlockVolume A861CAF6-E49D-4793-9E0C-A306DDC2A72F -passphrase $1
echo "1/3 System unlocked"

launchctl load -w /System/Library/LaunchDaemons/com.apple.AppleFileServer.plist
echo "2/3 Share folder reboot"

launchctl load -w /System/Library/LaunchDaemons/com.apple.smbd.plist
echo "2/3 Share folder reboot"

echo "...Completed"