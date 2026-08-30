# I took this from Adam and modified them.
# https://github.com/Adam13531/AdamsApple/blob/0f7fcccd422e14f3b616381b66dd03f747cf31b8/shell/zsh/.zshrc

# Wed 07/30/2014 - 11:48 AM
# This changes the tab title of iTerm.
# Usage: title any number of args for the title
# E.g. title Code Tab
#
# If you don't provide an argument then it will attempt to pull the name
# of your directory name. Failing that, it'll revert to "(bash)", which
# is as close to the default "bash" as I can get.
function title() {
	local finalTitle=$@

	if [ -z "$1" ]; then
		finalTitle=$(basename ${PWD})
	fi

	tabColorBasedOnString $finalTitle

	echo -n -e "\033]0;$finalTitle\007"
}

# Thu 10/02/2014 - 06:26 PM
# This is an iTerm-specific feature that will color the tab title based on
# a string that you pass in.
#
# Results are deterministic; the same input to this function will always give
# the same output.
function tabColorBasedOnString() {
	# Put the string through an md5 hash.
	local hash=$(md5 <<<$1)
	hash=$(md5 <<<$hash)
	hash=$(md5 <<<$hash)
	hash=$(md5 <<<$hash)
	hash=$(md5 <<<$hash)

	# Take four characters for each color component.
	local r=${hash:0:4}
	local g=${hash:4:4}
	local b=${hash:6:4}

	# Capitalize the characters since 'bc' requires capitalized hex numberes.
	r=$(tr '[a-z]' '[A-Z]' <<<"$r")

	# 'bc' is a base conversion program; we go from hex to decimal here.
	r=$(bc <<<"ibase=16; $r")

	# Do the same process for green and blue.
	g=$(tr '[a-z]' '[A-Z]' <<<"$g")
	g=$(bc <<<"ibase=16; $g")
	b=$(tr '[a-z]' '[A-Z]' <<<"$b")
	b=$(bc <<<"ibase=16; $b")

	((r = (r % 32)))
	((g = (g % 32)))
	((b = (b % 32)))

	# Make sure the rgb values sum to at least a certain number
	local threshold=300
	local sum=
	((sum = $r + $g + $b))
	((numCycles = 0))
	while [[ $sum -lt $threshold ]]; do
		# I want the numbers to grow in such a way that the biggest number stays
		# proportionally larger to the others, that way you get more vibrant
		# colors.
		((r = $r * 14 / 10))
		((g = $g * 14 / 10))
		((b = $b * 14 / 10))

		# Some strings will hash to RGB values like [0,7,0] (e.g. "Hi"), which
		# means the colors will never exceed the threshold. When this happens,
		# we artificially increase the numbers.
		((numCycles = $numCycles + 1))
		if [[ $numCycles -gt 16 ]]; then
			((r = $r + 1))
			((g = $g + 1))
			((b = $b + 1))
		fi

		if [[ $r -gt 255 ]]; then r=255; fi
		if [[ $g -gt 255 ]]; then g=255; fi
		if [[ $b -gt 255 ]]; then b=255; fi

		((sum = $r + $g + $b))
	done

	tabColor $r $g $b
}

# Thu 10/02/2014 - 03:42 PM
# In iTerm, you can change the color of tabs. This function lets you do that
# with either an RGB value or with a word (e.g. "red").
function tabColor() {
	if [[ "$1" == "" ]]; then
		echo "^rUsage: tabColor r g b"
		echo "Alternatively, you can do tabColor [red|blue|green|...|default]"
		echo "This is an iTerm-specific command to set the tab color."
		return
	fi

	local r=$1
	local g=$2
	local b=$3

	if [[ "$2" == "" ]]; then
		local colorToLower=$(tr '[A-Z]' '[a-z]' <<<"$r")
		# Should really just use an associative array here...
		if [[ "$colorToLower" == "red" ]]; then
			r=255
			g=0
			b=0
		elif [[ "$colorToLower" == "blue" ]]; then
			r=0
			g=0
			b=255
		elif [[ "$colorToLower" == "green" ]]; then
			r=0
			g=255
			b=0
		elif [[ "$colorToLower" == "pink" ]]; then
			r=255
			g=0
			b=255
		elif [[ "$colorToLower" == "purple" ]]; then
			r=128
			g=64
			b=128
		elif [[ "$colorToLower" == "yellow" ]]; then
			r=255
			g=255
			b=0
		elif [[ "$colorToLower" == "orange" ]]; then
			r=255
			g=128
			b=0
		elif [[ "$colorToLower" == "cyan" ]]; then
			r=0
			g=255
			b=255
		elif [[ "$colorToLower" == "white" ]]; then
			r=255
			g=255
			b=255
		elif [[ "$colorToLower" == "black" ]]; then
			r=0
			g=0
			b=0
		elif [[ "$colorToLower" == "default" ]]; then
			# Reset to default
			echo -e -n "\033]6;1;bg;*;default\a"
			return
		else
			echo "^rColor not recognized: ^w$colorToLower"
			return
		fi
	fi

	echo -e -n "\033]6;1;bg;red;brightness;${r}\a"
	echo -e -n "\033]6;1;bg;green;brightness;${g}\a"
	echo -e -n "\033]6;1;bg;blue;brightness;${b}\a"

	echo "Changing tab color to (^r${r}^w,^g${g}^w,^c${b}^w) (this only works in iTerm)."
}
