#!/bin/bash

docker run -dp EXPORT:INPORT/PROT -v EXFILE:INFILE --name CONTAINER IMAGE tail -f /dev/null
