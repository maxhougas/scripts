#!/bin/bash

if [ $# -ne 2 ];
then
 echo "Need two arguments './untemplate.sh file untemplate'"
 exit 1
fi
if [ -z $(echo "$1" | grep -o "TEMPLATE") ];
then
 echo "file appears not to be a template"
 exit 2
fi
if [ -f ut.out ];
then
 echo "Refusing to clobber ./ut.out"
 exit 3
fi
outfile=$(echo $1 | sed "s:TEMPLATE:$2:")
if [ -f ./$outfile ]
then
 echo "Refusing to clobber ./$outfile"
 exit 4
fi

sed "s:TEMPLATE:$2:g" $1 > ut.out
mv ut.out $outfile
chmod 700 $outfile
