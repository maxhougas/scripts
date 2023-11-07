#!/bin/sh

echo $(curl -s $1) | grep -o "$(head -1 scrapepattern)"
