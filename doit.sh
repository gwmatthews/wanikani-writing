#!/bin/bash

for i in *.csv
do
  ./newwriting.sh $i
  ./newwriting.sh -p a4 $i
  ./newwriting.sh -s small $i
  ./newwriting.sh -s small -p a4 $i
  ./newwriting.sh -s large $i
  ./newwriting.sh -s large -p a4 $i
done
