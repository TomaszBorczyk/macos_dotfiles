#!/usr/bin/env bash

cd /Library/LaunchDaemons
sudo ln -s /Users/tomaszborczyk/home/Projects/macos_dotfiles/launchd_services/com.witkacy.make_coffe.plist . 
sudo ln -s /Users/tomaszborczyk/home/Projects/macos_dotfiles/launchd_services/com.witkacy.change_name.plist . 

sudo launchctl load /Library/LaunchDaemons/com.witkacy.make_coffe.plist 
sudo launchctl load /Library/LaunchDaemons/com.witkacy.change_name.plist 
