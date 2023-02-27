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
- Compiler : RISC-V 32/64 embed and linux toolchain
- SDK : [bl mcu sdk](https://github.com/bouffalolab/bl_mcu_sdk)
- Programming tool : bflb-mcu-tool / blisp
- Debugger : OpenOCD / gdb

# Compiler

Not like usual RISC-V based MCU (such as CH32V / GD32V, etc), The toolchain setup for BL chips from Bouffalo Lab is a little bit complex. For BL60x/61x/70x, it's as simple as usual RISC-V based MCU, just require a 32bit 'riscv-none-embed' toolchain.

**For BL808**, since it has 3 cores include a RV64GCV 480MHz core based on T-Head C906. It's 64bit general purpose CPU and have MMU, that means, it can run as baremetal and also able to run ordinary RISC-V Linux OS. Thus, For BL808, it need setup 3 toolchains:

- riscv 32bit embed toolchain
- riscv 64bit embed toolchain
- riscv 64bit linux toolchain

I prefer to use Xpack prebuilt toolchains, but Xpack only provide rv32 embed toolchain up to now. For rv64 embed and rv64 linux toolchain, we have to use prebuilt T-Head Xuantie toolchains. By the way, T-Head doesn't provide rv32 toolchain.

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
T-Head provide RISC-V 64bit embed toolchain (gcc v10.2.0), it can be download from [here](https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1663142243961/Xuantie-900-gcc-elf-newlib-x86_64-V2.6.1-20220906.tar.gz).

After download:

```
sudo mkdir -p /opt/xuantie-riscv64-embed-toolchain
sudo tar xf Xuantie-900-gcc-elf-newlib-x86_64-V2.6.1-20220906.tar.gz -C /opt/xuantie-riscv64-embed-toolchain --strip-components=1
```

and add `/opt/xuantie-riscv64-embed-toolchain/bin` to PATH env according to your shell.

**NOTE**, the triplet of prebuilt Xuantie rv64 embed toolchain is **`riscv64-unknown-elf`**.

## RISC-V 64bit linux gcc
T-Head provide RISC-V 64bit linux toolchain (gcc v10.2.0), it can be download from [here](https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1663142514282/Xuantie-900-gcc-linux-5.10.4-glibc-x86_64-V2.6.1-20220906.tar.gz).

After download:

```
sudo mkdir -p /opt/xuantie-riscv64-linux-toolchain
sudo tar xf Xuantie-900-gcc-linux-5.10.4-glibc-x86_64-V2.6.1-20220906.tar.gz -C /opt/xuantie-riscv64-linux-toolchain --strip-components=1
```

and add `/opt/xuantie-riscv64-linux-toolchain/bin` to PATH env according to your shell.

**NOTE 1**, the triplet of prebuilt Xuantie rv64 linux toolchain is **`riscv64-unknown-linux-gnu`**.
**NOTE 2**, the sysroot is at '/opt/xuantie-riscv64-linux-toolchain/sysroot'.


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
cd bl_mcu_sdk
git checkout 18408f971e3f8c2f82e79ec5fddd38c22f288c0d
# move it to home dir if not, you should have write permission to sdk dir.
sudo mv bl_mcu_sdk <where your home dir>
```



And, set env as:
```
export BL_SDK_BASE=<path to>/bl_mcu_sdk
```

If you put the bl_mcu_sdk to other dir, please change above `export` to point to your sdk dir. 

If you did not export the `BL_SDK_BASE` env, you need supply it when issue 'make'.

## Demo project

The bl_mcu_sdk mainly use cmake and make to manage the project, and have it's own project management style, take [blink_demo](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/tree/main/blink_demo) as example, the dir structure looks like:

```
blink_demo
├── CMakeLists.txt : manage sources, build flags and target name.
├── flash_prog_cfg.ini : used by BLFlashCommand and invoke with 'make flash'
├── main.c : source file(s), to blink a LED connect to GPIO9.
├── Makefile : define CHIP/BOARD name, toolchain prefix, SDK PATH. used to start the building process.
├── proj.conf : project specific CMAKE flags
└── readme.md
```

To build it:
```
cd blink_demo
# use sipeed rv debugger plus as example, it's BL702
make CHIP=bl702 BOARD=bl702dk CROSS_COMPILE=riscv-none-embed- BL_SDK_BASE=<path to bl_mcu_sdk>
```
You can also set CHIP / BOARD / CROSS_COMPILE / BL_SDK_BASE options in 'Makefile'.

If built successfully, the target file 'sipeed_debugger_plus_blink_bl702.bin' and 'sipeed_debugger_plus_blink_bl702.elf' should be generated in `build/build_out/` dir. you can modify the 'CMakeLists.txt' to change the 'target file name'.


# Programming

The official programming utility shipped in 'bl_mcu_sdk' is 'BLFlashCommand', it is commited into the 'bl_mcu_sdk' repo recently.

There is also '[bflb-mcu-tool](https://pypi.org/project/bflb-mcu-tool/)' with official support and third party from Pine64 [blisp](https://github.com/pine64/blisp) can be used.

**NOTE:**

After BLFlashCommand commited in and with the commit [[update][board] enable fw header for new flash tool ](https://github.com/bouffalolab/bl_mcu_sdk/commit/e70e482d2129411f34208d1184b4710074c67777).

- **Good news:** it has a program tool integrated, 'make flash' works.
- **Bad news:** it alter the firmware format, and not compatible with other opensource tools.

Compare with old firmware before this commit, the final ELF has a section '.fw_header' added. you can use 'readelf -S build/build_out/xxx.elf' to verify whether it has a '.fw_header' section or not.

- you can use 'BLFlashCommand' / 'blisp' / 'bflb-mcu-tool' to program new firmware (firmware with .fw_header section).
- you can only use 'blisp' / 'bflb-mcu-tool' to program old firmware (firmware without .fw_header section). or use `git checkout 18408f971e3f8c2f82e79ec5fddd38c22f288c0d` to roll back the 'fw_header' commit and rebuild your project.


## Tools installation

'BLFlashCommand' is integreated into 'bl_mcu_ask', there is no additional installation required.

'bflb-mcu-tool' is written in python, install it as: 

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

Use above 'blink_demo' as example, the target file if 'build/build_out/sipeed_debugger_plus_blink_bl702.bin'.

**Hold the Boot button down and plug sipeed rv debugger plus to PC Host USB port**

And run `lsusb`, you will find:

```
Bus 001 Device 067: ID ffff:ffff BLIOT CDC Virtual ComPort
```
At the same time, there should be a serial device `/dev/ttyACM0` created.

Then you can download the firmware:

### with BLFlashCommand
BLFlashCommand read the 'flash_prog_cfg.ini' as config file, please verify it is correct or not.
And just type:
```
make flash
```

### with `bflb-mcu-tool` :

For new firmware (with .fw_header). If you rebuild your project with updated 'bl_mcu_sdk', it should be always new firmware.

```
~/.local/bin/bflb-mcu-tool --chipname=bl702 --interface=uart --port=/dev/ttyACM0 --baudrate=2000000 --firmware=build/build_out/sipeed_debugger_plus_blink_bl702.bin --addr 0x1000
```

For old firmware (without .fw_header). Usually, old firmware is some pre-built and released bin file. please remove `--addr 0x1000` options from above command:

```
~/.local/bin/bflb-mcu-tool --chipname=bl702 --interface=uart --port=/dev/ttyACM0 --baudrate=2000000 --firmware=build/build_out/sipeed_debugger_plus_blink_bl702.bin
```

### with `blisp`
For new firmware (with .fw_header). If you rebuild your project with updated 'bl_mcu_sdk', it should be always new firmware.

```
blisp iot -c bl70x -p /dev/ttyACM0 --reset -s build/build_out/sipeed_debugger_plus_blink_bl702.bin -l 0x1000
```

For old firmware (without .fw_header).
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
