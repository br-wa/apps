#!/usr/bin/bash

# Usage: zps [class #]
# goes to that class's direction and pset subdirectory
# NOTE: To use, add 'alias zps=". zps.sh" to your bash_profile and add this script to PATH

NEXTDIR="psets"
source /home/brandon/apps/other/z/z.sh

if [ $# -eq 0 ]; then
	echo "Supply a class"
else
	_z $1
	if [ -d "$NEXTDIR" ]; then
		cd $NEXTDIR
	else
		cd $OLDPWD
		printf "Class $1 does not have a $NEXTDIR subdirectory\n"
	fi
fi
