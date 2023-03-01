#!/bin/bash

FIRMWARE=bl616-cklink-lite-2023-02-27.bin

# check 'bflb-mcu-tool' command exists or not.
if ! command -v bflb-mcu-tool &> /dev/null
then
    echo "'bflb-mcu-tool' command not found !"
    echo "Please install it first by 'pip install bflb-mcu-tool'."
    exit
fi

help()
{
	echo "01-program-cklink-lite.sh:"
	echo "Program cklink-lite firmware for BL616 Sipeed M0S Dock."
	echo "2, Hold 'BOOT' button down and Plug it in PC USB port."
    echo "3, Run this script to program cklink-lite firmware."
}

DEVICE=$(lsusb|grep "349b:6160 Bouffalo Bouffalo CDC DEMO")

# device not found
if [ "$DEVICE""x" = "x" ]; then
	help
	exit
fi

read -r -p "Do you intend to program cklink-lite firmware to Sipeed M0S Dock ? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	bflb-mcu-tool \
		--chipname=bl616 \
		--interface=uart \
		--port=/dev/ttyACM0 \
		--baudrate=2000000 \
		--firmware=$FIRMWARE
else
    echo "You choose no, exit."
fi
