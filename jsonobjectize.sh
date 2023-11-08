#!/bin/bash

if [ $# -ne 2 ];
then
 echo "Need extactly two arguments './jsonobjectize.sh FILE DELIMITER'"
 exit 1
fi

sed "s:\":\\\\\":g" $1 |\
sed "s:^: \":g" |\
sed "s:\\$2:\"\\:\":g" |\
sed "s:$:\",:g" |\
sed "1 s:^:{\n:" |\
sed "$ s:,$:\n}:"
