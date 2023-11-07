#!/bin/bash

if [ $# -ne 2 ];
then
 echo "Need two arguments './changeshell.sh file newshell'"
 exit 1
fi
if [ -f ./ns.out ];
then
 echo "Refusing to clobber ./ns.out"
 exit 2
fi
newname="$1.ns"
if [ -f ./$newname ];
then
 echo "Refusing to clobber ./$newname.ns"
 exit 3
fi

sed "1 s:\#\!.*:\#\!/bin/sh:g" $1 > ns.out
mv ns.out $newname
chmod 700 $newname
