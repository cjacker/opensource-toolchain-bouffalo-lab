#!/bin/bash

# if no arg,
if [ $# -ne 1 ]; then
  echo "Usage: ./03-program-other-d0-firmware.sh <firmware>"

  echo "Please specify a M1s D0 firmware to program."
  exit
fi

FIRMWARE_FILE=$1

if ! command -v bflb-iot-tool &> /dev/null
then
    echo "'bflb-iot-tool' not found !"
	echo "Please install it by 'pip install bflb-iot-tool'"
    exit
fi

# check device connected or not
DEVICE=$(lsusb|grep "ID 0403:6010 Future Technology Devices International, Ltd FT2232C/D/H Dual UART/FIFO IC")
if [ "$DEVICE""x" = "x" ]; then
	echo "M1S Dock not found."
	echo "Please connect M1S Dock by its 'UART' TypeC port to PC USB port."
    exit
fi

# program C906 core by UART programming mode.

# show help msg first
# I did not find a way to detect whether it in programming mode
echo "To program C906 core (D0) of BL808, you need activate UART programming mode by :"
echo "1, Hold the 'BOOT' button down."
echo "2, Press 'RESET' button and release."
echo "3, Release 'BOOT' button."
echo ""

# confirm entering UART programimng mode.
read -r -p "Do you activate UART programming mode ? [y/N] " response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	echo "Start programming C906 core (D0)."
else
    echo "Exit"
	exit
fi

# confirm again to start.
read -r -p "Input 'yes' or 'y' to start : " response_c906
if [[ "$response_c906" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	bflb-iot-tool \
		--chipname=bl808 \
		--port=/dev/ttyUSB1 \
		--baudrate=2000000 \
		--firmware=$FIRMWARE_FILE \
        --addr 0x101000 \
        --single
else
	echo "Exit"
	exit
fi

