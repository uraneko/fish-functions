complete -f -c acs -a "$(ls $XDG_CONFIG_HOME/alacritty/alacritty-theme/themes | string replace '.toml' '' | xargs)"
