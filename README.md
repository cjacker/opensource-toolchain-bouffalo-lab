# Opensource toolchain for series RISC-V based MCU from Bouffalo Lab

Bouffalo Lab Intelligent Technology (Nanjing) Co., Ltd. was established in Nanjing in 2016. It is a company focusing on the research and development of world-leading ultra-low power consumption, intelligent Internet of Things and edge computing SoCs, as well as providing overall solutions for intelligent cloud platforms. enterprise. At the same time, the company has complete multi-mode wireless connection technology, audio and video processing and artificial intelligence algorithm technology, which can fully realize the chip research and development of single-chip integration.

In short, this company produce a series RISC-V based MCU which focused on WIFI, BT, BLE, ZIGBEE, includes:

- BL602 series, Wi-Fi/BLE
- BL702 series, BLE/Zigbee
- BL606 series, Wi-Fi/BT/BLE/Zigbee/Ethernet/USB2.0 six-in-one 
- BL616 series, Wi-FI/BT5
- BL808 series, 3 cores + 1 npu, RV64GCV 480MHz / RV32GCP 320MHz / RV32EMC 160MHz and  BLAI-100

This tutorial will try best to cover these chips.

# Hardware prerequist:

- A dev board with BL chips from Bouffalo Lab
  + Sipeed rv debugger plus : BL702, this so called "debugger" is a mini BL702 board actually.
  + Sipeed M0Sense series : BL616
  + Sipeed M1s or Pine64 ox64 : BL808
  + various other boards

# Toolchain overview:
- Compiler : riscv 32/64 gcc toolchain
- SDK : bl_mcu_sdk
- Programming tool : bflb-mcu-tool
- Debugger : OpenOCD / gdb


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
There is a lot of programming utilies, such as [blisp](https://github.com/pine64/blisp). here we use official programming utility : '[bflb-mcu-tool](https://pypi.org/project/bflb-mcu-tool/)'.

## Installation

bflb-mcu-tool is written in python:

```
pip install bflb-mcu-tool
```

And you should add `$HOME/.local/bin` to PATH env to find `bflb-mcu-tool` command.

