#!/bin/bash

fullpath=$1
content=$2

if [ ! $# -eq 2 ]
then
	echo "Arguments are not set correctly!"
	exit 1
fi

if [ ! -e $fullpath ]
then
	#remove everything after / (including /) in string fullpath
	# % is used for omitting at the end of string
	# # is used for omitting at the beginning of string
	# example
	# a='hello:world:of:tomorrow'
	# echo "${a%:*}"
	# hello:world:of
	#$ echo "${a%%:*}"
	#hello
	#$ echo "${a#*:}"
	#world:of:tomorrow
	dirpath=${fullpath%/*}
	#The dirpath is in quotes because if the directory path consists of spaces, then variable substitution will consider it as multiple argument and more directories will be made.
	mkdir -p "$dirpath" && touch "$fullpath"
	
	if [ $? -eq 1 ]
	then
		echo "It is not possible to create the file!"
		exit 1
	fi
fi

echo "$content" > "$fullpath"
