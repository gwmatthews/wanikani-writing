#!/bin/bash

FILENAME=$1
SET="${FILENAME%.[^.]*}" 
PAPER=${2:-letter}

cp ./assets/writing.tex .
## set paper size

if [ $PAPER = a4 ]; then
 sed -i -e 's/letterpaper/a4paper/' writing.tex
 sed -i -e 's/-writing\%/-writing-a4\%/' writing.tex
else
 sed -i -e 's/a4paper/letterpaper/' writing.tex
 sed -i -e 's/-writing-a4\%/-writing\%/' writing.tex
fi


COMPLETE=$(cat $FILENAME | sed -e 's_,_\t_g'  -e 's_;_\t_g' -e 's_"__g' | awk -F"\t" '{ print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 }' | sed -f assets/kana.sed | awk -F"\t" '{ print "\\kana{" $1 "}\\kanji{ " $2 " }\\boxes\\moreboxes" }')

if [ $PAPER = a4 ]; then
 echo "$COMPLETE" > $SET-writing-a4-content.tex
 cp writing.tex $SET-writing-a4.tex
 xelatex $SET-writing-a4.tex
else 
 echo "$COMPLETE" > $SET-writing-content.tex
 cp writing.tex $SET-writing.tex
 xelatex $SET-writing.tex
fi

# clean up the mess

rm ./*.aux
rm ./*.log
rm ./*.tex
