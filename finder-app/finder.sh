#!/bin/bash

if [ ! $# -eq 2 ]
then 
	echo "Arguments are not specified correctly!"
fi

if [ ! -d $1 ]
then
	echo "First argument is not path to a directory!"
fi

filesnum=$( grep -rl $2 $1 | wc -l )
matchesnum=$( grep -r $2 $1 | wc -l )

echo "The number of files are $filesnum and the number of matching lines are $matchesnum!"
