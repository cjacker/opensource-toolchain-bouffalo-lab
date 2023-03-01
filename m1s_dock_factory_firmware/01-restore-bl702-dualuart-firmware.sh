#!/bin/bash

DUALUART_FIRMWARE=usb2dualuart_bl702_221118.bin

# check 'bflb-iot-tool' command exists or not.
if ! command -v bflb-iot-tool &> /dev/null
then
    echo "'bflb-iot-tool' not found !"
    echo "Please install it by 'pip install bflb-iot-tool'"
    exit
fi

help()
{
	echo "01-restore-bl702-dualuart-firmware.sh:"
	echo "Restore the default dualuart firmware for BL702 of M1S Dock."
	echo "1, Use UART Type-C interface of M1S Dock."
	echo "2, Hold the 'BOOT' button down and Plug M1S Dock in PC USB port."
    echo "3, Run this script to restore default firmware of BL702."
}

DEVICE=$(lsusb|grep "ffff:ffff BLIOT CDC Virtual ComPort")

# device not found
if [ "$DEVICE""x" = "x" ]; then
	help
	exit
fi

read -r -p "Are you intend to restore BL702 firmware of M1S Dock ? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	bflb-iot-tool \
        --chipname=bl702 \
        --port=/dev/ttyACM0 \
        --baudrate=2000000 \
        --firmware=$DUALUART_FIRMWARE \
		--addr 0x2000
	#blisp iot -c bl70x --reset -s usb2dualuart_bl702_221118.bin -l 0x2000	
else
    echo "You choose no, exit."
fi
