function g2f
	set -l s $(bat $GH2FAS)
	echo -n $(oathtool -b --totp $s) | wl-copy
end
