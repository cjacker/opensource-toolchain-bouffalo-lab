#!/bin/bash

# create a empty image of size 0x800000 and fill it with "0xFF". 
# 0x800000 is the start addr of "bl808-firmware.bin".
dd if=/dev/zero bs=8388608 count=1| tr "\000" "\377" >openbouffalo-bl808.bin

# copy "m0_lowload_bl808_m0.bin" to the start of openbouffalo-bl808.bin
dd conv=notrunc if=m0_lowload_bl808_m0.bin of=openbouffalo-bl808.bin

# copy "d0_lowload_bl808_d0.bin" to 0x100000
dd conv=notrunc if=d0_lowload_bl808_d0.bin of=openbouffalo-bl808.bin seek=1048576 bs=1

# append "bl808-firmware.bin" to the end
cat bl808-firmware.bin >> openbouffalo-bl808.bin
 
# the whole "openbouffalo-bl808.bin" can be programmed as:
# bflb-iot-tool --chipname bl808 --interface uart --port /dev/ttyUSB1 --baudrate 2000000 --firmware openbouffalo-bl808.bin --addr 0x0 --single

