function pnpm-init 
	set -l argc (count $argv)

	if test $argc = 2 -a "$argv[2]" != "--lib" -a "$argv[2]" != "--no-tests"
		echo -e "\x1b[1;38;2;231;43;23merror:\x1b[0m received unrecognized argument $argv[2], aborting"
		return
	end

	# echo package creation message 
	if contains $argv "--lib"
		echo -e "   \x1b[1;38;2;159;221;168mCreating\x1b[0m library package \x1b[1;38;2;255;120;192m'$argv[1]'"
	else 
		echo -e "   \x1b[1;38;2;159;221;168mCreating\x1b[0m binary (application) package \x1b[1;38;2;255;120;192m'$argv[1]'"
	end

	# package dir
	mkdir $argv[1]/src -p
	pushd $argv[1]

	# echo dir/files setup message 
	echo -e "\x1b[1;38;2;159;151;248mInitializing\x1b[0m npm package files"

	# src files 
	touch src/main.ts
	if not contains $argv "--lib"
		touch src/styles.css
		bat $JS_DEFAULTS/index.html > src/index.html
	end

	# package.json
	if test $argc > 2
		bat $JS_DEFAULTS/package-lib.json | sed -e "s/@package_name/$argv[1]/" >  package.json
	else
		bat $JS_DEFAULTS/package-bin.json | sed -e "s/@package_name/$argv[1]/">  package.json
	end

	# echo adding dependencies message 
	if test $argc = 2
		echo -e "\x1b[1;38;2;159;151;248mImporting\x1b[0m library package dev dependencies"
	else
		echo -e "\x1b[1;38;2;159;151;248mImporting\x1b[0m binary package dev dependencies"
	end

	# add ts and typedoc dev deps
	# parallel pnpm install --lockfile-only --save-dev --silent ::: typescript typedoc
	# pnpm install --lockfile-only --save-dev --silent typescript 
	# pnpm install --lockfile-only --save-dev --silent typedoc

	# binary package import; postcss and rollup 
	if not test $argc = 2	
		# define deps
		# NOTE pnpm install takes forever; will replace with hard coded dependencies
		# set -l imports autoprefixer cssnano \
		   # postcss postcss-cli \
		   # postcss-preset-env rollup \
		   # rollup-plugin-css-bundle \
		   # rollup-plugin-typescript2

		# add deps
		# parallel pnpm install --lockfile-only --save-dev --silent ::: $imports
		# for imp in $imports 
		# 	pnpm install --lockfile-only --save-dev $imp --silent
		# end

		# get a copy of rollup configs
		bat $JS_DEFAULTS/rollup.config.js > rollup.config.js
	end

	# echo git initialization
	echo -e "\x1b[1;38;2;159;151;248mInitializing\x1b[0m git repository"

	# git 
	git init --quiet
	echo "node_modules" > .gitignore
	
	# echo package creation success message
	echo -e "\x1b[1;38;2;159;221;168mCreated\x1b[0m package at \x1b[1;38;2;255;120;192m'$argv[1]/'\x1b[0m"
	
	# echo note about package entry / main file
	if not test $argc = 2
		echo -e "\x1b[1;38;2;245;214;173mnote:\x1b[0m package main file is at \x1b[1;38;2;255;120;192m'$argv[1]/src/main.ts'\x1b[0m"
	else 
		echo -e "\x1b[1;38;2;245;214;173mnote:\x1b[0m package entry file is at \x1b[1;38;2;255;120;192m'$argv[1]/src/main.ts'\x1b[0m"
	end

	# get back to parent dir 
	popd
end
