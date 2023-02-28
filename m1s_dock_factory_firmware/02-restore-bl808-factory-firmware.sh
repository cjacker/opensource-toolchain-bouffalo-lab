#!/bin/bash

BOOT2_FILE=boot2_isp_debug.bin
PARTITION_FILE=partition_cfg_16M_m1sdock.toml

# e907 firmware
E907_FIRMWARE_FILE=firmware_20230227.bin

# c906 firmware
C906_FIRMWARE_FILE=d0fw_20221212.bin

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
echo "To program E907 core (M0) of BL808, enter UART programming mode by:"
echo "1, Hold the 'BOOT' button down."
echo "2, Press 'RESET' button and release."
echo "3, Release 'BOOT' button."
echo ""

# confirm entering UART programimng mode.
read -r -p "Do you activate UART programming mode ? [y/N] " response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	echo "Start programming E907 core (M0)."
else
    echo "Exit"
	exit
fi

# confirm again to start.
read -r -p "Input 'yes' or 'y' to start : " response_e907
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	bflb-iot-tool \
		--chipname=bl808 \
		--port=/dev/ttyUSB1 \
		--baudrate=2000000 \
		--firmware=$E907_FIRMWARE_FILE \
		--pt=$PARTITION_FILE \
		--boot2=$BOOT2_FILE
else
	echo "Exit"
	exit
fi

# program C906 core by U-Disk programming mode.
echo ""
read -r -p "Do you want to continue program C906 core (D0) ? [y/N] " response_c
if [[ "$response_c" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	echo "Start programming C906 core (D0)."
else
	echo "Exit"
	exit
fi

echo ""
echo "To program the C906 core of BL808,"
echo "Please enter U-Disk programming mode by:"
echo "1. Disconnect M1S Dock and re-connect the 'OTP' typeC port to PC USB port."
echo "2. Hold 'S1' and 'S2' button down at the same time."
echo "3, Press 'RESET' button and release."
echo "4, Release 'S1' and 'S2' button."
echo "5, Find the device and mount the device to /tmp/m1s"
echo "   For example, 'mount /dev/sda1 /tmp/m1s'"
echo ""

read -r -p "Do you enter U-Disk mode and mount device to '/tmp/m1s' ? [y/N] " response_c906
if [[ "$response_c906" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	sudo cp $C906_FIRMWARE_FILE /tmp/m1s/
	sudo umount /tmp/m1s
else
    echo "Exit"
    exit
fi
