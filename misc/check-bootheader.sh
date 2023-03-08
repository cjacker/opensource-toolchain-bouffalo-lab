#!/bin/bash
# if no arg
if [ $# -ne 1 ]; then
  echo "Check bouffalo firmware has bootheader or not"
  echo "Usage: ./check-bootheader <bouffalo firmware>"
  exit
fi

MN=$(head -c 4 $1)
if [ $MN"x" == "BFNP""x" ]; then
	echo "yes"
else
	echo "no"
fi

