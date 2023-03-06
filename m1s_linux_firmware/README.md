# Linux firmware for Sipeed M1S Dock

This is default Linux firmware for Sipeed M1S Dock.

## To program Linux firmwares with bf-mcu-tool and / or bf-iot-tool

At first, I didn't find a way to program two "low_load" firmwares from command line, `bflb-mcu-tool` always erase and re-write bootinfo when programming second firmware. I keep 2 correct log files 'log.mcu' and 'log.iot' here, these log files is copied from BLDevCube.

From the log:

- `bootinfo_group0.bin` generated for 'low_load_bl808_m0@0x58000000.bin' and programmed to 0x0000
- `bootinfo_group1.bin` generated for 'low_load_bl808_d0@0x58000000.bin' and programmed to 0x1000
- `low_load_bl808_m0@0x58000000.bin` programmed to 0x2000
- `low_load_bl808_d0@0x58000000.bin` programmed to 0x52000

The root cause we can not use `bflb-mcu-tool` is `bflb-mcu-tool` did not export group1 related args.

After reading the codes of `bflb-mcu-tool`, I found it's very easy to enable group1 support with a few changes.

The patch `bflb_mcu_tool-1.8.3-enable-group1.patch` is for bflb_mcu_tool v1.8.3, since `bflb_mcu_tool` can be installed by pip, you should install it as:

```
pip install 'bflb-mcu-tool==1.8.3' --force-reinstall
```

Then patch it:

```
cd $HOME/.local/lib/python?.?/site-packages/bflb_mcu_tool/core/
cat <path>/bflb_mcu_tool-1.8.3-enable-group1.patch |patch -p0
```
Then `bflb-mcu-tool` will support 2 new args: `--group1-firmware GROUP1_FIRMWARE [--group1-addr GROUP1_ADDR`

Program 2 low_load firmwares as:

```
bflb-mcu-tool --chipname bl808 --interface uart --port /dev/ttyUSB1 --baudrate 2000000 --firmware low_load_bl808_m0@0x58000000.bin --addr 0x58000000 --group1-firmware low_load_bl808_d0@0x58000000.bin --group1-addr 0x58000000
```

For `whole_img_linux@0xD2000.bin`, it can be programmed from command line by:

```
bflb-iot-tool --chipname bl808 --interface uart --port /dev/ttyUSB1 --baudrate 2000000 --firmware whole_img_linux@0xD2000.bin --addr 0xD2000 --single
```
Or
```
bflb-mcu-tool --chipname bl808 --interface uart --port /dev/ttyUSB1 --baudrate 2000000 --firmware whole_img_linux@0xD2000.bin --addr 0xD0000
```

Note `--addr 0xD0000` for `bflb-mcu-tool` and `--addr 0xD2000 --single` for `bflb-iot-tool`.

When using `bflb-mcu-tool` to program the 'whole_img_linux@0xD2000.bin', 'bootinfo_group0.bin' will generated again and program to 0x0000, it will erase and replace the 'bootinfo_group0' of 'low_load_bl808_m0@0x58000000.bin', you need program 2 low_load firmwares again:

```
bflb-mcu-tool --chipname bl808 --interface uart --port /dev/ttyUSB1 --baudrate 2000000 --firmware low_load_bl808_m0@0x58000000.bin --addr 0x58000000 --group1-firmware low_load_bl808_d0@0x58000000.bin --group1-addr 0x58000000
```

## To program Linux firmwares with BLDevCube

1. Connect M1S Dock 'UART' typec port with PC by USB cable
2. Set BL808 board to programming mode:
   - Press BOOT button
   - Press RESET button
   - Release RESET button
   - Release BOOT button
3. Run DevCube, select [BL808], and switch to [MCU] page
4. Select the uart port and set baudrate with 2000000
5. M0 Group[Group0] Image Addr [0x58000000] [PATH to low_load_bl808_m0.bin]
6. D0 Group[Group1] Image Addr [0x58000000] [PATH to low_load_bl808_d0.bin]
7. Click 'Create & Download' and wait until it's done
   <img src="./mcu.png" width=60% />
8. Switch to [IOT] page
9. Enable 'Single Download', set Address with 0xD2000, choose [PATH to whole_image_linux.bin]
10. Click 'Create & Download' again and wait until it's done
   <img src="./iot.png" width=50% />

You may wonder why the ADDR of M0 / D0 low_load firmwares is same, they all are 0x58000000.

I think it's a trick of BLDevCube, actually ADDR for M0 is 0x2000 and ADDR for D0 is 0x52000.

To understand mem layout and bootrom better, please refer to : https://btashton.github.io/bl808-notes/

## To run Linux

1. Use any serial terminal such as `tio`, set baudrate to 2000000, and open "/dev/ttyUSB0".
```
tio -b 2000000 /dev/ttyUSB0
```

2. Reset M1S Dock by pressing RST button, you will receive boot msgs.

3. Login as `root`.

```bash
dynamic memory init success,heap size = 26 Kbyte
C906 start...
mtimer clk:1000000
linux load start...
len:0x00376c53
vm linux load done!
dtb load done!
opensbi load done!

load time: 426313 us

OpenSBI v0.6
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name          : T-HEAD Xuantie c910
Platform HART Features : RV64ACDFIMSUVX
Platform Max HARTs     : 1
Current Hart           : 0
Firmware Base          : 0x3eff0000
Firmware Size          : 56 KB
Runtime SBI Version    : 0.2
```

```bash

--------Start Local Services--------
********************************

Linux login: root
login[40]: root login on 'ttyS0'
Processing /etc/profile ...
Set search library path in /etc/profile
Set user path in /etc/profile
id: unknown ID 0
Welcome to Linux
[@Linux root]#
```
