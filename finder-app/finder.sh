#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "Wrong number of arguments, 2 expected"
	exit 1
fi

if [ ! -d "$1" ]; then 
	echo "First argument must be a directory"
	exit 1
fi

echo "The number of files are $(grep -lr $2 $1 | wc -l) and the number of matching lines are $(grep -r $2 $1 | wc -l)"
