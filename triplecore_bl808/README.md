# Triple core demo for BL808

This demo show how to use tripple core of BL808, you need connect 3 USB2TTL UART
adatpers to BL808 to receive hello world msg from M0, D0, LP core.

## Apply patch to bl_mcu_sdk

Up to now, bl_mcu_sdk did not support enable LP core of BL808.

You need apply 'bl_mcu_sdk-enable-bl808-lp-core-and-example.patch' to enable it.

```
$ git clone https://github.com/bouffalolab/bl_mcu_sdk
$ cd bl_mcu_sdk
$ git checkout ff125a583cd20b189b7a384bf12fb7340f499ea1
$ cat bl_mcu_sdk-enable-bl808-lp-core-and-example.patch | patch -p1
```

The patch should work with latest bl_mcu_sdk git, but I diff the patch with `ff125a583cd20b189b7a384bf12fb7340f499ea1`, it's safe to git checkout to ensure the patch always can be applied.

If you use latest git, you may need to tune the patch.

## Build this triplecore demo

I put `bl_mcu_sdk` at home dir, if not, change this line in Makefile to your sdk path:
```
make -C $@ BL_SDK_BASE=$(HOME)/bl_mcu_sdk
```

And type `make` directly.

After build successfully, these bin files will be generated:

- ./helloworld_m0/build/build_out/helloworld_bl808_m0.bin : firmware for m0
- ./helloworld_lp/build/build_out/helloworld_bl808_lp.bin : firmware for lp
- ./helloworld_d0/build/build_out/helloworld_bl808_d0.bin : firmware for d0

## Program to bl808

Since BLDevCube GUI programming tool not support Group2 in BL808 MCU page, you can not 
program these firmwares one time.

I suggest to program it one by one by `BLFlashCommand`, you may need to activate UART programming mode every time.

Here use Sipeed M1S Dock as example.

- Connect 'UART' TypeC port of M1S Dock to PC USB port.
- Hold 'BOOT' down and press 'RESET' button.
- Release 'RESET' button, then release 'BOOT' button.

M1S Dock will enter UART programming mode.

Then:
```
cd helloworld_m0
make flash BL_SDK_BASE=$(HOME)/bl_mcu_sdk
```

After programmed, you need re-power M1S Dock and program firmwares for d0 and lp as above.


## Wire up 

After all three firmware programmed, Wire 3 USB2TTL adapter as:

- UART0 for D0 core
  + GPIO 14 (TX) -> USB2TTL RX
  + GPIO 15 (RX) -> USB2TTL TX

- UART1 for M0 core
  + GPIO 16 (TX) -> USB2TTL RX
  + GPIO 17 (RX) -> USB2TTL TX

- UART2 for LP core
  + GPIO 18 (TX) -> USB2TTL RX
  + GPIO 19 (RX) -> USB2TTL TX

For M1S Dock, since it already have 2 UARTs connect to D0 and M0, you only need wire 
another USB2TTL adapter to GPIO 18 and GPIO 19 for LP core.

For my env, the 3 serial devices are : 
- '/dev/ttyUSB0' for D0
- '/dev/ttyUSB1' for M0
- '/dev/ttyACM0' for LP

Check it according to your env.

## Receive hello world from 3 cores

Use any serial terminal such as `tio` / `minicom` / `picocom` / `cutecom`, etc.
Set baudrate to 2000000, 8N1, and open 3 serial devices.

You will receive "hello world" from 3 cores.

<img src="https://raw.githubusercontent.com/cjacker/opensource-toolchain-bouffalo-lab/main/triplecore_bl808/screenshot.png" width="60%" />

## More

- GPIO 18 (TX) and GPIO 19 (RX) for LP core UART is defined in bsp/board/bl808dk/board.c
- LP core is boot by M0 core, and boot from 0x58020000, FW addr set to 0x20000 in `helloworld_lp/flash_prog_cfg.ini` for `BLFlashCommand`

