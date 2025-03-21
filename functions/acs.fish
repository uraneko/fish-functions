function acs
	if test "$argv[1]" = "-P"
		bat $XDG_CONFIG_HOME/alacritty/cs
		return 
	else if test "$argv[1]" = "-L"
		ls $XDG_CONFIG_HOME/alacritty/alacritty-theme/themes | string replace '.toml' '' | xargs
		return 
	else 
		set -l curr (bat $XDG_CONFIG_HOME/alacritty/cs)
		sed -i -e "s/$curr.toml/$argv[1].toml/" $XDG_CONFIG_HOME/alacritty/alacritty.toml
		echo $argv[1] > $XDG_CONFIG_HOME/alacritty/cs
	end
end
