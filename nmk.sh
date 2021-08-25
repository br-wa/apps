#!/usr/bin/bash

# 1 = do main.tex
# 2 = do template.tex
# 3 = clean 

ALL=1

if [ $# -eq 2 ]; then
   	if [ ${#2} -eq 2 ]; then
		ALL=2
		DAY="$2"
	else
		ALL=3
	fi
fi

case $ALL in 
	1)
		cat main.tex | pipemk.sh $1 0
		cat main.tex | pipemk.sh $1 2
		;;
	2)
		sed "s/AB/$DAY/" template.tex | pipemk.sh $1 1
		;;
	3)
		sed "s/AB/$DAY/" template.tex | pipemk.sh $1 2
		;;
	*)
		exit 1
		;;
esac 	

exit 0
