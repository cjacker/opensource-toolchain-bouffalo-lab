# Linux firmware for M1S Dock
This is default Linux firmware for Sipeed M1S Dock.

And I didn't find a way to program two "low_load" firmwares from command line, `bflb-mcu-tool` always erase and re-write bootinfo when programming second firmware. I keep 2 correct log files 'log.mcu' and 'log.iot' here, these log files it copy from BLDevCube.

From the log:

- `bootinfo_group0.bin` programmed to 0x0000
- `bootinfo_group1.bin` programmed to 0x1000
- 'low_load_bl808_m0@0x58000000.bin' programmed to 0x2000
- 'low_load_bl808_d0@0x58000000.bin' programmed to 0x52000

Currently, `bflb-mcu-tool` did not support group setting and can not generate 'bootinfo_group0.bin' and 'bootinfo_group1.bin'.


For `whole_img_linux@0xD2000.bin`, it can be programmbed from command line by:
```
bflb-mcu-tool --chipname bl808 --interface uart --port /dev/ttyUSB1 --baudrate 2000000 --firmware whole_img_linux@0xD2000.bin --addr 0xD2000
```

This is a good news. actually it is not necessary to program 2 low_load firmwares every time if you not erase them.

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


## To run Linux

1. Use any serial terminal such as `tio`, set baudrate to 2000000, and open "/dev/ttyUSB0".
```
tio -b 2000000 /dev/ttyUSB0
```

2. Reset M1S Dock by pressing RST key, you will receive boot msgs.

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
