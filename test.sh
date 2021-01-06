#!/bin/bash

FILENAME=$1

parse() {
 sed -e 's_,_\t_g'  -e 's_;_\t_g' -e 's_"__g'  -e 's_&_\n\n_' -e 's_い_X_'
}

getfields() {
awk -F"\t" '{ print "{" $1 "}\t{" $2 "}" }'
}

findkanji() {

awk -F"\t" '(length($2) == 2) && ( $2 != ぁ-ん)' 

}

printkanji() {

awk -F"\t" 'length($2) == 2 '

}

removekana(){
sed  -e 's_[ぁ-ん]__g'
}

COMPLETE=$(cat $FILENAME | printkanji | getfields)

echo $COMPLETE
