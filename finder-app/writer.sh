#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "Wrong number of arguments, 2 expected"
	exit 1
fi

if [ ! -f "$1" ]; then
	if [ -d "$1" ]; then
		echo "First argument can't be an existing directory"
		exit 1
	fi
	dir=$(dirname $1)
	file=$(basename $1)
	mkdir -p $dir
	cd $dir
	touch $file
	if [ ! -f "$1" ]; then
		echo "Failed to create file"
		exit 1
	fi
fi
echo $2 > $1
