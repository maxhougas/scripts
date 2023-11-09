#!/bin/bash

if [ $# -ne 2 ];
then
 echo "Need two arguments './echoize.sh input pseudoout'"
 exit 1
fi

sed "s:\\\\:\\\\\\\\:g" $1 |\
sed "s:\":\\\\\":g" |\
sed "s:^: echo \":g" |\
sed "s:$:\" >> $2 \&\&\\\:g" |\
sed "1 s:>> $2 &&\\\\\$:> $2 \&\&\\\:" |\
sed "1 s:^ ::" |\
sed "$ s:>> $2 &&\\\\\$:>> $2:"
