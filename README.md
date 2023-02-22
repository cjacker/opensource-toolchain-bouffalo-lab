# Opensource toolchain for series RISC-V based MCU from Bouffalo Lab

Bouffalo Lab Intelligent Technology (Nanjing) Co., Ltd. was established in Nanjing in 2016. It is a company focusing on the research and development of world-leading ultra-low power consumption, intelligent Internet of Things and edge computing SoCs, as well as providing overall solutions for intelligent cloud platforms. enterprise. At the same time, the company has complete multi-mode wireless connection technology, audio and video processing and artificial intelligence algorithm technology, which can fully realize the chip research and development of single-chip integration.

In short, this company produce a series RISC-V based MCU which focused on Wi-Fi, BT, BLE, Zigbee, includes:

- BL602 series, Wi-Fi/BLE
- BL702 series, BLE/Zigbee
- BL606 series, Wi-Fi/BT/BLE/Zigbee/Ethernet/USB2.0 six-in-one 
- BL616 series, Wi-FI/BT5
- BL808 series, 3 cores + 1 npu, RV64GCV 480MHz / RV32GCP 320MHz / RV32EMC 160MHz and  BLAI-100

This tutorial will try best to cover these chips.

# Hardware prerequist:

A dev board with BL chips from Bouffalo Lab
  - [Sipeed rv debugger plus](https://github.com/sipeed/RV-Debugger-BL702) : BL702, this so called "debugger" is a mini BL702 board actually.
  - [Sipeed M0](https://wiki.sipeed.com/hardware/en/maixzero/sense/maix_zero_sense.html) : BL702
  - [Sipeed M0S](https://wiki.sipeed.com/hardware/en/maixzero/m0s/m0s.html) : BL616
  - [Sipeed M1s](https://wiki.sipeed.com/hardware/en/maix/m1s/m1s_module.html) or [Pine64 Ox64](https://wiki.pine64.org/wiki/Ox64) : BL808
  - various other boards

# Toolchain overview:
- Compiler : riscv 32/64 gcc toolchain
- SDK : [bl mcu sdk](https://github.com/bouffalolab/bl_mcu_sdk)
- Programming tool : bflb-mcu-tool / blisp
- Debugger : OpenOCD / gdb

# Compiler

Not like usual RISC-V based MCU (such as CH32V / GD32V, etc), The toolchain setup for BL chips from Bouffalo Lab is a little bit complex. For BL60x/61x/70x, it's as simple as usual RISC-V based MCU, just require a 32bit 'riscv-none-embed' toolchain.

But for BL808, since its 3 cores include a RV64GCV 480MHz core based on T-Head C906. It's 64bit general purpose CPU and have MMU, that means, it can run as baremetal and also able to run ordinary RISC-V Linux OS. Thus, For BL808, it may need setup 3 toolchains.

## RISC-V 32bit embeded gcc
[xpack-dev-tools](https://github.com/xpack-dev-tools/riscv-none-embed-gcc-xpack) provde a prebuilt toolchain for riscv. you can download it from [here](https://github.com/xpack-dev-tools/riscv-none-embed-gcc-xpack). although the riscv-none-embed-gcc-xpack had been marked as deprecated, but you'd better stay with riscv gcc v10.2 due to the riscv '-march' changes happened in gcc v12.0 and above.

After download:

```
sudo mkdir -p /opt/xpack-riscv-toolchain
sudo tar xf xpack-riscv-none-embed-gcc-10.2.0-1.2-linux-x64.tar.gz -C /opt/xpack-riscv-toolchain --strip-components=1
```

and add `/opt/xpack-riscv-toolchain/bin` to PATH env according to your shell.

**NOTE**, the triplet of xpack prebuilt toolchain is **`riscv-none-embed`**.

## RISC-V 64bit embeded gcc

## RISC-V 64bit linux gcc


# SDK

[bl mcu sdk](https://github.com/bouffalolab/bl_mcu_sdk) is an MCU software development kit provided by the Bouffalo Lab Team, supports all the series of Bouffalo chips. it supports all BL chips include but not limited to:

- BL602/BL604
- BL702/BL704/BL706
- BL616/BL618
- BL808

## SDK installation

The installation process of bl_mcu_sdk is very simple, just fetch it and put it somewhere, for example:
```
# fetch it
git clone https://github.com/bouffalolab/bl_mcu_sdk.git
# move it to /opt
sudo mv bl_mcu_sdk /opt
```
And, set env as:
```
export BL_SDK_BASE=/opt/bl_mcu_sdk
```

If you put the bl_mcu_sdk to other dir, please change above `export` to point to your sdk dir. 

If you did not export the `BL_SDK_BASE` env, you need supply it when issue 'make'.

## Demo project

The bl_mcu_sdk mainly use cmake and make to manage the project, and have it's own project management style, take [sipeed_rv_debugger_plus_blink] demo as example, the dir structure looks like:

```
sipeed_rv_debugger_plus_blink
├── CMakeLists.txt : manage sources, build flags and target name.
├── flash_prog_cfg.ini : not used now, maybe it is used with bouffalo devcube?
├── main.c : source file(s), to blink a LED connect to GPIO9.
├── Makefile : define CHIP/BOARD name, toolchain prefix, SDK PATH. used to start the building process.
├── proj.conf : project specific CMAKE flags
└── readme.md
```

To build it:
```
cd sipeed_rv_debugger_plus_blink
# use sipeed rv debugger plus as example, it's BL702
make CHIP=bl702 BOARD=bl702dk CROSS_COMPILE=riscv-none-embed- BL_SDK_PATH=/opt/bl_mcu_sdk
```

If built successfully, the target file 'sipeed_debugger_plus_blink_bl702.bin' and 'sipeed_debugger_plus_blink_bl702.elf' should be generated in `build/build_out` dir. you can modify the 'CMakeLists.txt' to change the 'target file name'.


# Programming

The official programming utility is '[bflb-mcu-tool](https://pypi.org/project/bflb-mcu-tool/)'. There are also a lot of third-party tools such as [blisp](https://github.com/pine64/blisp). 

## Installation

bflb-mcu-tool is written in python, install it as: 

```
pip install bflb-mcu-tool
```

And you should add `$HOME/.local/bin` to PATH env to find `bflb-mcu-tool` command.

[blisp](https://github.com/pine64/blisp) is written by Pine64 community, currently it can support BL60x and BL70x, and without support for BL616 and BL808, but still worth a try. to build and install it:

```
git clone --recursive https://github.com/pine64/blisp.git
cd blisp
git submodule update --init --recursive
mkdir build && cd build
cmake -DBLISP_BUILD_CLI=ON ..
cmake --build .
```


## Programming

Use above 'sipeed_rv_debugger_plus_blink' as example, the target file if 'build/build_out/sipeed_debugger_plus_blink_bl702.bin'.

**Hold the Boot button down and plug sipeed rv debugger plus to PC Host USB port**

And run `lsusb`, you will find:

```
Bus 001 Device 067: ID ffff:ffff BLIOT CDC Virtual ComPort
```
At the same time, there is a serial device `/dev/ttyACM0` created.

Then you can download the firmware with `bflb-mcu-tool` :
```
~/.local/bin/bflb-mcu-tool --chipname=bl702 --interface=uart --port=/dev/ttyACM0 --baudrate=2000000 --firmware=build/build_out/sipeed_debugger_plus_blink_bl702.bin
```

Or with `blisp`
```
blisp write -c bl70x -p /dev/ttyACM0 --reset build/build_out/sipeed_debugger_plus_blink_bl702.bin
```


## Debugging

Default JTAG pin:

|   CHIP/Pin    |  BL602/BL604  |  BL702/BL704/BL706 | BL616/BL618 |   BL808  |
|:-------------:|:-------------:|:------------------:|:-----------:|:--------:|
|TMS            |     GPIO12    |      GPIO0         |    GPIO0    |   GPIO6  |
|TCK            |     GPIO14    |      GPIO2         |    GPIO1    |   GPIO12 |
|TDO            |     GPIO11    |      GPIO9         |    GPIO2    |   GPIO7  |
|TDI            |     GPIO17    |      GPIO1         |    GPIO3    |   GPIO13 |

**To be written**
