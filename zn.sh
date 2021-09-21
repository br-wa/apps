#!/usr/bin/bash

# Usage: zn [class #]
# goes to that class's direction and notes subdirectory
# NOTE: To use, add 'alias zn=". zn.sh"' to your bash_profile and add this script to PATH

NEXTDIR="notes"
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
