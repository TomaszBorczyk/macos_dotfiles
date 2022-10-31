## https://forum.keyboardmaestro.com/t/wallpaper-does-not-change-on-every-desktops/17613/5

# use AppleScript version "2.7" -- High Sierra (10.13) or later

property ptyScriptName : "Change Background on 7 Spaces of Mission Control"
property ptyScriptVer : "1.0"
property ptyScriptAuthor : "Tobias Zittlau"

(*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	## CUSTOMIZABLE SECTION (Variables to set by ENDUSER) ##
*)

-- The Variable "thePic" should be set to the File-Path of the Picture to set as Desktop Background.

# set thePic to "~/PATH/TO/YOUR/PICTURE/INSERTED/HERE"
# set thePic to "/Users/tomaszborczyk/home/wallpapers/wallpaper_1.png"
set thePic to system attribute "WALLPAPER_PATH_TO_CHANGE"
# set thePic to "dupa"
# do shell script "echo " & quoted form of thePic
log thePic


-- The Variable "windowCount" for "Spaces" of Mission Control with defined number of Spaces.

set windowCount to 4  -- Just an example Number of Spaces, set your Number of Spaces here

(*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### BEGINNING OF SCRIPT ###

PLEASE MAKE SURE OF SWITCHING TO DESKTOP 1 BEFORE CALLING THIS SCIPT, BECAUSE IT IS THE STARTING POINT FOR THIS SCRIPT-ROUTINE - OTHERWISE IT WILL NOT WORK 
PROPERLY !!

## Applications: System Events, Finder
## Variables set & used: deskGroup, theDesk

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*)

-- Telling "System Events" what to do
tell application "System Events"
	
	-- Define the Variable "deskGroup" & set it as reference to existing Spaces
	set deskGroup to (a reference to every desktop)
	
	repeat with theDesk in deskGroup
		
		-- Change the Desktop Background Picture to the User´s selection
		set picture of theDesk to thePic
		
	end repeat
end tell

delay 1 -- 1 Second pause (giving time to get the Information)

-- Performing the Routine in Finder (Trying!! Otherwise it won´t work!!).
try
	repeat with X from 1 to windowCount
		tell application "Finder"
			tell application "System Events"
				if X > 1 then
					
					-- move to next Desktop with the Global Hot Key for Mission 					Control
					key code 124 using {control down, command down}
					
					-- 1 Second pause - otherwise the Script will cause an error
					delay 1
					
				end if
				-- set every Desktop to the selected Picture
				set deskGroup to (a reference to every desktop)
				repeat with theDesk in deskGroup
					set picture of theDesk to thePic
				end repeat
			end tell
			
			delay 1
			
		end tell
	end repeat
end try
(*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### END OF SCRIPT ###
*)

