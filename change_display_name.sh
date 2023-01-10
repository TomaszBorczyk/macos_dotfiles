#!/usr/bin/env bash

sudo scutil --set ComputerName "Witkacy"
sudo scutil --set HostName "Witkacy"
sudo scutil --set LocalHostName "Witkacy"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "Witkacy"
