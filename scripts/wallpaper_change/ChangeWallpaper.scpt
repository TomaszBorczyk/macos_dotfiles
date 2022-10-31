# simplified, modified and extended script from:
# https://forum.keyboardmaestro.com/t/wallpaper-does-not-change-on-every-desktops/17613/5

property ptyScriptName : "Change background on all spaces and desktops"
property ptyScriptVer : "1.0"
property ptyScriptAuthor : "Tobias Zittlau & Tomasz Borczyk"

set thePic to system attribute "WALLPAPER_PATH_TO_CHANGE"

# Get information about number of spaces - subtraction of 2 is required, since uuid also exists for 
# current space and collapsed space
set windowCount to do shell script "expr $(defaults read com.apple.spaces | grep uuid | wc -l) - 2"

# Performing the routine in Finder (otherwise it won´t work!!).
try
	repeat with X from 1 to windowCount
		tell application "System Events"
			if X > 1 then
				key code 124 using {control down, command down}
				delay 1
			end if

			set deskGroup to (a reference to every desktop)
			
            repeat with theDesk in deskGroup
				set picture of theDesk to thePic
			end repeat
		end tell
		
		delay 1			
	end repeat
end try
