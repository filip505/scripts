#!/bin/bash -i

launchctl unload -w /System/Library/LaunchDaemons/com.apple.AppleFileServer.plist

launchctl unload -w /System/Library/LaunchDaemons/com.apple.smbd.plist

# shutdown -r now