#!/usr/bin/env bash

wallpaper_name=$1

if [ -z $wallpaper_name ]; then
	echo "Missing wallpaper path"
	exit 1
fi

if [ ! -f $wallpaper_name ]; then
	echo "File ${wallpaper_name} does not exist!"
	exit 1
fi

export WALLPAPER_PATH_TO_CHANGE=$wallpaper_name
abspath=$( dirname -- "$( readlink -f -- "$0"; )"; )
apple_script_path="${abspath}/ChangeWallpaper.scpt"

osascript $apple_script_path
