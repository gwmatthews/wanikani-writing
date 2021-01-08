#!/bin/bash

for i in *.csv
do
  ./writing.sh $i
  ./writing.sh -p a4 $i
  ./writing.sh -s small $i
  ./writing.sh -s small -p a4 $i
#  ./writing.sh -s large $i
#  ./writing.sh -s large -p a4 $i
done
