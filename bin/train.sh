#!/bin/bash
destfname="vectors.bin"
if [[ $# -ge 2  ]] ; then
  srcfname=$1
  destfname=$2
elif  [[ $# -eq 1  ]] ; then 
  srcfname=$1
else
  echo "./train.sh srcfname destfname"
  exit
fi

./word2vec -train $srcfname  -output vectors.bin -cbow 0 -size 200 -window 5 -negative 5 -hs 0 -sample 1e-4 -threads 24 -binary 1 -iter 20 -min-count 1
