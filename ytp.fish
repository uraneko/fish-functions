function ytp
	if test (count $argv) = "0"
		echo need a yt video url to play 
	else
		yt-dlp -S "+height:360" -f "b"  $argv[1]  -o - | ffplay - -autoexit -loglevel quiet
	end
end

