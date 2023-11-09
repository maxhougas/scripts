#!/bin/bash

if [ $# -ne 1 ];
then
 echo "Need exactly 1 argument './jsonarrayize.sh FILE'"
 exit 1
fi

sed "s:\\\\:\\\\\\\\:g" $1 |\
sed "s:\":\\\\\":g" |\
sed "s:^: \":g" |\
sed "s:$:\",:g" |\
sed "1 s:^:[\n:" |\
sed "$ s:,$:\n]:"
