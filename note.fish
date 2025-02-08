function note 
	if test (count $argv) = 2 
		if test $argv[2] = "-c"
			bat $EXT_SSD/notes/$argv[1]
		end
	else
		if test $argv[1] = "-l"
			eza -ahl $EXT_SSD/notes 
		else
			nvim $EXT_SSD/notes/$argv[1]
		end
	end
end
