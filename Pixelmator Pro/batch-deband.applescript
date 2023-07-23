tell application "Pixelmator Pro"
	-- Open a prompt that lets you pick multiple Pixelmator Pro files to process 
	-- and save references to all those images in the originalImages variable
	set originalImages to choose file with prompt Â
		"Please select the images to process:" with multiple selections allowed
	-- Start a repeat loop that loops over each image
	repeat with a from 1 to number of originalImages
		-- Open the current image in the loop
		set currentImage to open item a of originalImages
		-- Apply the deband adjustments
		deband currentImage
		-- Close and save the image
		close currentImage with saving
	end repeat
	display notification (number of originalImages as text) & Â
		" images have been successfully edited." with title "Batch Deband"
end tell