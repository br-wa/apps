#!/usr/bin/bash

# 1 = do main.tex
# 2 = do template.tex
# 3 = clean 

USAGE="""Usage:
	1. nmk.sh str -> compiles main.tex to str.pdf, and then cleans
	2. nmk.sh str MN -> compiles with -pvc template.tex (with 'dayXY' replaced by 'dayMN') to str.pdf 
	3. nmk.sh -c str MN -> cleans up 2
"""

CLEANING=0

while getopts "ch" option; do 
	case $option in
		c) 
			CLEANING=1
			;;
		h) 
			printf "$USAGE"
			exit 0
			;;
		?)
			printf "Invalid option -${OPTARG}.\n"
			printf "$USAGE"
			exit 1
			;;
	esac
done

shift $((OPTIND-1))

ALL=1

if [ $# -eq 2 ]; then
	ALL=2
	DAY="$2"
	if [ $CLEANING -eq 1 ]; then
		ALL=3
	fi
fi

case $ALL in 
	1)
		cat main.tex | pipemk.sh $1 0
		cat main.tex | pipemk.sh $1 2
		;;
	2)
		sed "s/AB/$DAY/g" template.tex | pipemk.sh $1 1
		;;
	3)
		sed "s/AB/$DAY/g" template.tex | pipemk.sh $1 2
		;;
	*)
		exit 1
		;;
esac 	

exit 0
