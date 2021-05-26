#!/bin/bash

if [ -z $2 ]; then
  echo "ussage: $0 <source> <targetBaseName>"
  exit 1
fi

MAIN_FILE=$1

SEPARATOR="###==="

function grabBlock {
  cat $MAIN_FILE | sed -n "/$SEPARATOR $1/,/$SEPARATOR/p"
}

DEFAULT=`grabBlock default`

for file in `cat $MAIN_FILE | grep -e "$SEPARATOR" | grep -v end`; do
  if [[ $file =~ ^[a-z].*$ ]] && [ "$file" != "default" ] ; then

    OUTPUT_FILE="${file}/env/${2}"
    echo $OUTPUT_FILE;

    echo "$DEFAULT" > $OUTPUT_FILE
    grabBlock $file >> $OUTPUT_FILE
  fi
done