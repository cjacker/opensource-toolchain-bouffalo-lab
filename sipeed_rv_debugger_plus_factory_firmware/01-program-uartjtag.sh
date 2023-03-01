#!/bin/bash

FIRMWARE=usb2uartjtag_bl702.bin

# check 'bflb-mcu-tool' command exists or not.
if ! command -v bflb-mcu-tool &> /dev/null
then
    echo "'bflb-mcu-tool' command not found !"
    echo "Please install it by 'pip install bflb-mcu-tool'."
    exit
fi

help()
{
	echo "01-program-uartjtag.sh:"
	echo "Program uartjtag firmware for BL702 Sipeed RV Debugger Plus."
	echo "2, Hold 'BOOT' button down and Plug it in PC USB port."
    echo "3, Run this script to program cklink-lite firmware."
}

DEVICE=$(lsusb|grep "ffff:ffff BLIOT CDC Virtual ComPort")

# device not found
if [ "$DEVICE""x" = "x" ]; then
	help
	exit
fi

read -r -p "Do you intend to program uartjtag firmware to Sipeed RV Debugger Plus ? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	bflb-mcu-tool \
		--chipname=bl702 \
		--interface=uart \
		--port=/dev/ttyACM0 \
		--baudrate=2000000 \
		--firmware=$FIRMWARE
else
    echo "You choose no, exit."
fi
