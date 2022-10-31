# modified from:
# https://forum.keyboardmaestro.com/t/wallpaper-does-not-change-on-every-desktops/17613/5

property ptyScriptName : "Change Background on 7 Spaces of Mission Control"
property ptyScriptVer : "1.0"
property ptyScriptAuthor : "Tobias Zittlau"

set thePic to system attribute "WALLPAPER_PATH_TO_CHANGE"

# TODO: customize/automate this so there should be no need to specify number of spaces
set windowCount to 4  -- Just an example Number of Spaces, set your Number of Spaces here

# PLEASE MAKE SURE OF SWITCHING TO DESKTOP 1 BEFORE CALLING THIS SCIPT, BECAUSE IT IS THE STARTING POINT FOR THIS SCRIPT-ROUTINE - OTHERWISE IT WILL NOT WORK PROPERLY !!

tell application "System Events"
	set deskGroup to (a reference to every desktop)

	repeat with theDesk in deskGroup
		set picture of theDesk to thePic
	end repeat
end tell

delay 1

# Performing the Routine in Finder (Trying!! Otherwise it won´t work!!).
try
	repeat with X from 1 to windowCount
		tell application "Finder"
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
			
		end tell
	end repeat
end try
