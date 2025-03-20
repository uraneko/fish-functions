function note 
	if test (count $argv) = 2 
		if test $argv[2] = "-c"
			bat $EXT_SSD/notes/$argv[1]
		end
	else
		# TODO add '-d' option for removing a note
		if test $argv[1] = "-l"
			eza -ahl $EXT_SSD/notes 
		else
			nvim $EXT_SSD/notes/$argv[1]
		end
	end
end
