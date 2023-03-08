#!/bin/bash
# if no arg
if [ $# -ne 1 ]; then
  echo "Check bouffalo firmware has bootheader or not"
  echo "Usage: ./check-bootheader <bouffalo firmware>"
  exit
fi

# use 'tr' to avoid : warning: command substitution: ignored null byte in input
MN=$(head -c 4 $1|tr -d "\0")
if [ $MN"x" == "BFNP""x" ]; then
	echo "yes"
else
	echo "no"
fi

