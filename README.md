# scripts
Lunix shell scripts--mostly for Docker

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

## jsonaoo.sh
- ./jsonaoo FILE SMALLDELIM LARGEDELIM
- FILE should be of format KEYSMALLDELIMVALUE\nLARGEDELIM\nKEYSMALLDELIMVALUE
- Use single characters for your delimiters--you will have a bad time
- Some characters are easier than others. Asterisk seems to work.
- Escapes double quotes
- Ends each line with '",'
- Starts each line with '  "'
- Replaces SMALLDELIM with '":"'
- Replaces ',\n  "LARGEDELIM",' with ' },\n'
- Replaces final ',' with '\n }\n]'
- Inserts '[\n {\n' into first line
- Dumps to stdout

## jsonarrayize.sh
- ./jsonarrayize.sh FILE
- Escapes double quotes
- Wraps each line in ' "LINE",'
- Adds '[\n' at the beginning of file
- Removes ',' from last line and adds '\n]'
- Result should be a valid JSON array
- Dumps to stdout

## jsonobjectize.sh
- ./jsonobjectize FILE DELIMITER
- Use on files of format KEYDELIMITERVALUE
- Escapes double quotes--files with double quotes in keys will fail
- Ends each line with '",'
- Starts each line with ' "'
- Replaces DELIMITER with '":"'
- Adds '{\n' to first line
- Replaces final ',' with '\n}'
- Dumps to stdout

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

## run.CONTAINER.sh
- Do not use untemplate.sh--edit manually.
- Runs a docker container CONTAINER using IMAGE

## scrapelist.sh
- ./scrapelist.sh
- Pulls HTML from URLs in scrapeurls
- Regex matches for the first line in scrapepattern via grep -o
- Dumps to stdout

## scrapepattern
- First line will be used as the regex pattern for scrapelist.sh and scrapeurl.sh

## scrapeurls
- List of URLs for scrapelist.sh

## scrapeurl.sh
- ./scrapeurl.sh URL
- Pulls HTML via curl
- Regex matches for the first line in scrapepattern via grep -o
- Dumps to stdout

## sedtest
- Test input for sed lines

## untemplate.sh
- ./untemplate.sh FILE UNTEMPLATE
- FILE is of the form PREFIX.TEMPLATE.sh
- Refuses to operate when input file name does not contain TEMPLATE
- Replaces instances of TEMPLATE with UNTEMPLATE
- Refuses to clobber ut.out and PREFIX.UNTEMPLATE.sh
- outputs to PREFIX.UNTEMPLATE.sh
