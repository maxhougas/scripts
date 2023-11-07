#!/bin/bash

for url in $(cat urls)
do
 echo $(curl -s $scrapeurls) | grep -o "$(head -1 scrapepattern)"
done
