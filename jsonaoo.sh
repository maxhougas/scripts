#!/bin/bash

if [ $# -ne 3 ];
then
 echo "Need exactly three arguments './jsonaoo.sh FILE SMALLDELIM LARGEDELIM"
 exit 1
fi

sed "s:\\\\:\\\\\\\\:g" $1 |\
sed "s:\":\\\\\":g" |\
sed "s:^:  \":g" |\
sed "s:\\$2:\"\\:\":g" |\
sed "s:$:\",:g" |\
sed -z "s:,\n  \"\\$3\",:\n },\n {:g" |\
sed "1 s:^:[\n {\n:" |\
sed "$ s:,$:\n }\n]:"
