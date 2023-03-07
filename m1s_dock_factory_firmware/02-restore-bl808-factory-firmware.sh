#!/bin/bash

BOOT2_FILE=boot2_isp_debug.bin
PARTITION_FILE=partition_cfg_16M_m1sdock.toml

# e907 firmware
E907_FIRMWARE_FILE=firmware_20230227.bin

# preprocessed c906 firmware d0fw_20221212.bin 
# can be programed from command line.
C906_FIRMWARE_FILE=whole_img_d0fw_20221212.bin

echo "02-restore-bl808-factory-firmware.sh:"
echo "A script to restore bl808 factory firmware."
echo ""

# check 'bflb-iot-tool' command exists or not.
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

# program E907 core by UART programming mode.

# show help msg first
# I did not find a way to detect whether it in programming mode
echo "To program BL808, please enter UART programming mode by:"
echo "1, Hold the 'BOOT' button down."
echo "2, Press 'RESET' button and release."
echo "3, Release 'BOOT' button."
echo ""

# confirm entering UART programimng mode.
read -r -p "Do you activate UART programming mode ? [y/N] " response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	echo "Start programming..."
else
    echo "Exit"
	exit
fi

# confirm again to start.
read -r -p "Input 'yes' or 'y' to start : " response_start
if [[ "$response_start" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	# program e907 firmware
	bflb-iot-tool \
		--chipname=bl808 \
		--port=/dev/ttyUSB1 \
		--baudrate=2000000 \
		--firmware=$E907_FIRMWARE_FILE \
		--pt=$PARTITION_FILE \
		--boot2=$BOOT2_FILE
    # program c906 firmware
	bflb-iot-tool \
		--chipname bl808 \
		--interface uart \
		--port /dev/ttyUSB1 \
		--baudrate 2000000 \
        --firmware=$C906_FIRMWARE_FILE \
		--addr 0x100000 \
		--single
else
	echo "Exit"
	exit
fi

echo "Done, press 'RESET' button of M1S Dock."
