#!/bin/bash

# m0/d0 combined lowload firmware
LOWLOAD_FIRMWARE_FILE=m0d0_lowload-combined.bin

# can be programed from command line.
D0_FIRMWARE_FILE=bl808-firmware.bin

echo "01-program-openboufflo-linux.sh:"
echo "A script to program essential firmwares to run Linux on BL808"
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

# show help msg first
# I did not find a way to detect whether it in programming mode
echo "Enter BL808 UART programming mode by:"
echo "1, Hold the 'BOOT' button down."
echo "2, Press 'RESET' button and release."
echo "3, Release 'BOOT' button."
echo ""

# confirm entering UART programimng mode.
read -r -p "Do you activate UART programming mode ? [y/N] " response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	echo "Start programming ? "
else
    echo "Exit"
	exit
fi

# confirm again to start.
read -r -p "Input 'yes' or 'y' to start : " response_start
if [[ "$response_start" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	bflb-iot-tool \
		--chipname bl808 \
		--interface uart \
		--port /dev/ttyUSB1 \
		--baudrate 2000000 \
		--firmware bootinfo_group0.bin \
		--addr 0x0 --single
    bflb-iot-tool \
        --chipname bl808 \
        --interface uart \
        --port /dev/ttyUSB1 \
        --baudrate 2000000 \
        --firmware $LOWLOAD_FIRMWARE_FILE \
        --addr 0x1000 --single
	bflb-iot-tool \
		--chipname bl808 \
		--interface uart \
		--port /dev/ttyUSB1 \
		--baudrate 2000000 \
		--firmware $D0_FIRMWARE_FILE \
		--addr 0x800000 --single
else
	echo "Exit"
	exit
fi

echo "Done."
echo "Please flash sdcard-pine64_[full_]ox64_defconfig.img to microSD card."
echo "For example, 'sudo dd if=sdcard.img of=/dev/sdN bs=1M."

