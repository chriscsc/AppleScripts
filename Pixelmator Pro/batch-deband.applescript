tell application "Pixelmator Pro"
	-- Open a prompt that lets you pick multiple Pixelmator Pro files to process 
	-- and save references to all those images in the originalImages variable
	set originalImages to choose file with prompt �
		"Please select the images to process:" with multiple selections allowed
	set exportLocation to choose folder with prompt �
		"Please select where you'd like export the images:"
	-- Start a repeat loop that loops over each image
	repeat with a from 1 to number of originalImages
		-- Open the current image in the loop
		set currentImage to open item a of originalImages
		-- Apply the deband adjustments
		deband currentImage
		-- Close and save the image
		export currentImage to ((exportLocation as text) & name of currentImage & ".jpg") as JPEG with properties {compression factor:100}
		close currentImage without saving
	end repeat
	display notification (number of originalImages as text) & �
		" images have been successfully edited." with title "Batch Deband"
end tell