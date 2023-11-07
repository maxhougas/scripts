# scripts
Lunix shell scripts--mostly Bash

## changeshell.sh
- ./changeshell.sh FILE SHELL
- Attempts to alter shebang line '#!/bin/bash' becomes '#!SHELL'
- Will ONLY alter line 1
- Will refuse to clobber ns.out and FILE.ns
- Outputs to ./FILE.ns

## dexec.TEMPLATE.sh
- Use untemplate.sh
- ./dexec.TEMPLATE.sh COMMAND
- Attempts to run COMMAND on container TEMPLATE in interactive tty mode

## echoize.sh
- ./echoize.sh FILE PSUEDOOUT
- Escapes double quotes before other operations i.e. 'Foo"bar' becomes 'Foo\"bar'
- Wraps each line of a file in ' echo "LINE" >> PSEUDOOUT &&\'
- First line is altered to 'echo "LINE" > PSEUDOOUT &&\'
- Final line is altered to be ' echo "LINE" >> PSEUDOOUT'
- Dumps to stdout; will not clobber files.

## kill.TEMPLATE.sh
- Use untemplate.sh
- ./kill.TEMPLATE.sh
- Runs a force remove on TEMPLATE i.e. docker rm -f TEMPLATE

## restart.TEMPLATE.sh
- Use untemplate.sh
- ./restart.TEMPLATE.sh
- Runs docker stop TEMPLATE and docker start TEMPLATE

## rmi.TEMPLATE.sh
- Use untemplate.sh
- ./rmi.sh.TEMPLATE.sh
- Removes docker image TEMPLATE , does not force i.e. Containers running image TEMPLATE must be removed first.

## run.TEMPLATE.sh
- Do not use untemplate.sh--edit manually.
- Runs a docker container CONTAINER using IMAGE

## untemplate.sh
- ./untemplate.sh FILE UNTEMPLATE
- FILE is of the form PREFIX.TEMPLATE.sh
- Refuses to operate when input file name does not contain TEMPLATE
- Replaces instances of TEMPLATE with UNTEMPLATE
- Refuses to clobber ut.out and PREFIX.UNTEMPLATE.sh
- outputs to PREFIX.UNTEMPLATE.sh
