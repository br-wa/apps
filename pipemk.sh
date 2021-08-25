#!/usr/bin/bash

set -eu

# 0 = default = no flags
# 1 = continuous
# 2 = clean
TYPE=0

if [ $# -eq 2 ]; then
	TYPE=$2
fi

tmp=$(mktemp --suffix=.tex --tmpdir=.)
trap "rm -f $tmp" 0 2 3 15

cat <&0 > $tmp

case $TYPE in 
	0)
		latexmk -pdf -pdflatex="lualatex" -jobname=$1 $tmp
		;;
	1)
		latexmk -pdf -pvc -pdflatex="lualatex" -jobname=$1 $tmp
		;;
	2)
		latexmk -pdf -c -pdflatex="lualatex" -jobname=$1 $tmp
		;;
	*)
		exit 1
		;;
esac 

exit 0
