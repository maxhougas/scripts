# scripts
Lunix shell scripts--mostly Bash

## echoize.sh
- Escapes double quotes before other operations i.e. 'Foo"bar' becomes 'Foo\"bar'
- Wraps each line of a file in ' echo "[LINE]" >> outfile &&\'
- First line is altered to 'echo "[LINE]" > outfile &&\'
- Final line is altered to be ' echo "[LINE]" >> outfile'
