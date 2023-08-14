-- template script containing an action handler for manipulating files of a certain extension added to the attached folder
-- applescript 2.8
-- last updated 08-14-2023

on adding folder items to theFolder after receiving newItems
	
	set filesAdded to {}
	tell application "Finder" to set folderName to name of folder theFolder
	
	repeat with i from 1 to count of newItems
		
		set thisItem to item i of newItems
		
		tell application "Finder"

		-- specify file extension
			if name extension of thisItem is "txt" then
				set fileName to name of thisItem
				
				set justName to text 1 thru ((fileName's length) - (offset of "." in ¬
					(the reverse of every character of fileName) as text)) of fileName
				
				set end of filesAdded to (fileName & linefeed)
				
				-- add actions here!
				
			end if
			
		end tell
		
	end repeat
	
	activate
	display alert "Processed these files:" message (filesAdded as string)
	
end adding folder items to
