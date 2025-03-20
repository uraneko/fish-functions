function acs
	if test "$argv[1]" = "-P"
		bat /home/brownbread/.config/alacritty/cs
		return 
	else if test "$argv[1]" = "-L"
		ls /home/brownbread/.config/alacritty/alacritty-theme/themes | string replace '.toml' '' | xargs
		return 
	else 
		set -l alac "/home/brownbread/.config/alacritty/"
		set -l curr (bat $alac/cs)
		sed -i -e "s/$curr.toml/$argv[1].toml/" $alac/alacritty.toml
		echo $argv[1] > $alac/cs
	end
end
