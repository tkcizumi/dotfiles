#! /bin/bash

FILELIST=$(find ./files | cut -f 3 -d"/");

for FILE in $FILELIST
do
  ln -sf $(pwd)/files/$FILE $HOME/$FILE
done
