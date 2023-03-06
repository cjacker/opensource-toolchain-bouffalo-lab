# Opensource toolchain for series RISC-V based MCU from Bouffalo Lab

Bouffalo Lab Intelligent Technology (Nanjing) Co., Ltd. was established in Nanjing in 2016. It is a company focusing on the research and development of world-leading ultra-low power consumption, intelligent Internet of Things and edge computing SoCs, as well as providing overall solutions for intelligent cloud platforms. enterprise. At the same time, the company has complete multi-mode wireless connection technology, audio and video processing and artificial intelligence algorithm technology, which can fully realize the chip research and development of single-chip integration.

In short, this company produce a series RISC-V based MCU which focused on Wi-Fi, BT, BLE, Zigbee, includes:

- BL602 series, Wi-Fi/BLE
- BL702 series, BLE/Zigbee
- BL606 series, Wi-Fi/BT/BLE/Zigbee/Ethernet/USB2.0 six-in-one 
- BL616 series, Wi-FI/BT5
- BL808 series, 3 cores + 1 npu
  + T-HEAD C906 RV64GCV 480MHz (D0)
  + T-HEAD E907 RV32GCP 320MHz (M0)
  + T-HEAD E902 RV32EMC 160MHz (LP) , my work to enable LP core already upstreamed.
  + BLAI-100

All datasheets and user manuals can be found in [bl_docs](https://github.com/bouffalolab/bl_docs) repo.

This tutorial will try best to cover all these chips.

# Table of contents
- [Hardware prerequist](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#hardware-prerequist)
- [Toolchain overview](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#toolchain-overview)
- [Compiler](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#compiler)
  + [For bl_mcu_sdk](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#for-bl_mcu_sdk)
    - [T-Head RISC-V embeded gnu toolchain](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#t-head-xuantie-risc-v-embeded-gcc)
    - [T-Head RISC-V Linux toolchain](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#t-head-xuantie-risc-v-linux-gcc-optional)
  + [For bl_iot_sdk](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#for-bl_iot_sdk)
- [SDK](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#sdk)
  + [bl_mcu_sdk](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#bl_mcu_sdk)
    - [sdk installation](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#sdk-installation)
    - [demo projects](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#demo-project)
  + [bl_iot_sdk](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#bl_iot_sdk)
- [Programming](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#programming)
  + [programming tools installation](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#programming-tools-installation)
  + [programming](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#programming-1)
    - [for bl_mcu_sdk](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#for-bl_mcu_sdk-1)
      + [with BLFlashCommand](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#with-blflashcommand-recommended)
      + [with bflb-mcu-tool](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#option-1--with-bflb-mcu-tool-)
      + [with blisp](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#option-2--with-blisp)
    - [for bl_iot_sdk](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#for-bl_iot_sdk-1)
- [Debugging](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#debugging)
  + [With OpenOCD and JTAG debugger](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#with-openocd-and-jtag-debugger)
  + [With C-Sky debug server and CK-Link Lite](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#with-c-sky-debug-server-and-ck-link-lite)
    - [Install C-Sky Debug Server](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#install-c-sky-debug-server)
    - [Option 1 : Use T-Head / HLK CK-Link Lite Debugger](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#option-1--use-t-head-or-hlk-ck-link-debugger)
    - [Option 2 : Use Sipeed RV Debugger Plus or M0S Dock with cklink-lite firmware](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#option-2--use-sipeed-rv-debugger-plus-or-m0s-dock-with-cklink-lite-firmware)
    - [Option 3 : Make your own CK-Link Lite debugger with STM32F103](https://github.com/cjacker/opensource-toolchain-w80x#option-3--make-your-own-ck-link-lite-debugger-with-stm32f103)
    - [Launch C-Sky debug server](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#launch-c-sky-debug-server)
    - [Debugging](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#debugging-1)
- [Build Linux kernel for BL808](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#build-linux-kernel-for-bl808)
  + [Building linux kernel](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#building-linux-kernel)
  + [Flash and run](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#flash-linux-kernel-and-run)
- [Misc](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#misc)
  + [Use Sipeed RV Debugger Plus as JTAG or CK-Link Lite debugger](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#how-to-build-and-program-uartjtag-and-dualuart-firmware-for-sipeed-rv-debugger-plus)
  + [Use M0S Dock as CK-Link Lite debugger](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#how-to-turn-m0s-dock-to-ck-link-lite)
  + [Sipeed M0sense programming notes](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#m0sense-board-bl702-programming-notes)
  + [Sipeed M1S Dock programming notes](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#m1s-dock-bl808-programming-notes)
  + [How to restore factory firmware of M1S Dock](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/README.md#how-to-restore-factory-firmwares-for-m1s-dock)
  

# Hardware prerequist:

- A devboard with BL chips
  + [Sipeed RV Debugger Plus](https://github.com/sipeed/RV-Debugger-BL702) : BL702, this so called "debugger" is a mini BL702 devboard actually.
  + [Sipeed M0sense](https://wiki.sipeed.com/hardware/en/maixzero/sense/maix_zero_sense.html) : BL702, M0sense is 'NOT' M0S, you can treat it as 'M0'.
  + [Sipeed M0S and M0S Dock](https://wiki.sipeed.com/hardware/en/maixzero/m0s/m0s.html) : BL616, this so called "dock" can also be a "debugger".
  + [Sipeed M1s Dock](https://wiki.sipeed.com/hardware/en/maix/m1s/m1s_module.html) or [Pine64 Ox64](https://wiki.pine64.org/wiki/Ox64) : BL808. M1s Dock is really a "dock".
  + various other devboards, for example XT-ZB1 (BL702) and XT-BL12 (BL602) devboards from Aliexpress.

- A JTAG or CK-Link Lite debugger
  + Option 1: T-Head or HLK CK-Link Lite debugger from Aliexpress (a little bit expensive)
  + Option 2: Sipeed RV Debugger Plus with [ck-link lite firmware for bl702](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/raw/main/sipeed_rv_debugger_plus_factory_firmware/bl702_cklink_whole_img_v2.2.bin)
  + Option 3: Sipeed M0S Dock with [ck-link lite firmware for bl616](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/raw/main/m0s_dock_cklink-lite_firmware/bl616-cklink-lite-2023-02-27.bin)
  + Option 4: A STM32F103 bluepill with [this modified cklink-lite official firmware](https://github.com/cjacker/cklink-lite-fw-convertor)
  + Any JTAG debugger, such as ftdi, jlink, etc, which can be supported by OpenOCD


# Toolchain overview:
- Compiler : 
  + RISC-V 32/64 bit embed toolchain 
  + RISC-V linux toolchain
- SDK : 
  + [bl mcu sdk](https://github.com/bouffalolab/bl_mcu_sdk)
  + [bl_iot_sdk](https://github.com/bouffalolab/bl_iot_sdk_tiny), it is stalled and will be abandoned.
- Programming tool : 
  + BLDevCube Linux Version. **close source**
  + BLFlashCommand (integrated in bl_mcu_sdk). **close source**
  + bflb-iot-tool
  + bflb-mcu-tool
  + blisp and various
- Debugger : 
  + OpenOCD and gdb
  + T-Head C-Sky Debug Server and gdb. **close source**

**NOTE 1:**

**About the difference between bl_iot_sdk & bl_mcu_sdk**, there is an answer [here](https://bbs.bouffalolab.com/d/124-difference-bl-iot-sdk-bl-mcu-sdk).

<img src="./misc/diff-iot-mcu.png" width="60%" />

The answer is not very clear. In short, bl_iot_sdk focused on IOT-related programming, such as Wi-Fi/BLE, etc, and bl_mcu_sdk didn't have these support before. 

From the comments from upstream : https://github.com/bouffalolab/bl_mcu_sdk/issues/115

> Iot sdk does not update at all, please use mcu sdk(it will be named bouffalosdk)

You should bf_mcu_sdk from now.

**NOTE 2:**

It seems upstream decide to close BLFlashCommand and BLFlashCube sources, if this is a issue for you, you should know that. 


# Compiler

Not like usual RISC-V based MCU (such as CH32V / GD32V, etc), the toolchain setup for BL chips is a little bit complex. Different cores and Different sdk may requires different toolchain...

## For bl_mcu_sdk

For BL60x/70x, it's 32bit RISC-V MCU, as usual RISC-V MCU, it require RISC-V toolchain to generate 32bit object code. 

For BL616, bl_mcu_sdk set `-mtune` to `e907`, it can not supported by general RISC-V toolchain, you had to use T-Head RISC-V toolchain. Or you can change the `-mtune=e907` to `-mtune=size` and will lost some optimizations when compiling.

For BL808, it has 3 different cores: two 32bit RISCV-V MCU (M0 / LP), one general purpose 64biy CPU (D0, based on T-Head C906). Since D0 core has MMU, that means it can run baremetal or run a RISC-V Linux OS. Thus, it need to setup 3 toolchains:

- riscv 32bit embed toolchain for M0 / LP core
- riscv 64bit embed toolchain for D0 core
- **optional** riscv 64bit linux toolchain for D0 core

You may already find some 'riscv64-unknown-elf' toolchains can work with 32bit RISC-V mcu. just like x86_64 toolchain, it can generate object codes for x86 and x86_64, so we can reduce toolchains to 2: 

- riscv64 embeded toolchain to generate 32bit and 64bit codes
- **optional** riscv64 linux toolchain if you want to work with linux on C906.

Usually I prefer to use [Xpack prebuilt RISC-V toolchains](https://github.com/xpack-dev-tools/riscv-none-elf-gcc-xpack/), but Xpack only provide rv32 embed toolchain up to now and not compatible with some Xuantie extentions. In this tutorial, we will and have to use prebuilt T-Head Xuantie toolchains.

## T-Head Xuantie RISC-V embeded gcc

T-Head provide RISC-V embed toolchain (gcc v10.2.0) to work with 32bit and 64bit RISC-V, it can be download from [here](https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1663142243961/Xuantie-900-gcc-elf-newlib-x86_64-V2.6.1-20220906.tar.gz).

After download:

```
sudo mkdir -p /opt/xuantie-riscv64-embed-toolchain
sudo tar xf Xuantie-900-gcc-elf-newlib-x86_64-V2.6.1-20220906.tar.gz -C /opt/xuantie-riscv64-embed-toolchain --strip-components=1
```

and add `/opt/xuantie-riscv64-embed-toolchain/bin` to PATH env according to your shell.

**NOTE**, the triplet of prebuilt Xuantie rv64 embed toolchain is **`riscv64-unknown-elf`**, make sure it is not conflict with other toolchains you already installed.

## T-Head XuanTie RISC-V linux gcc [Optional]

**You need this toolchain to work with Linux. if you have no need to run a Linux on C906 core of BL808, just ignore this section.**

T-Head provide pre-built RISC-V 64bit linux toolchain (gcc v10.2.0), it can be download from [here](https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1663142514282/Xuantie-900-gcc-linux-5.10.4-glibc-x86_64-V2.6.1-20220906.tar.gz).

After download:

```
sudo mkdir -p /opt/xuantie-riscv64-linux-toolchain
sudo tar xf Xuantie-900-gcc-linux-5.10.4-glibc-x86_64-V2.6.1-20220906.tar.gz -C /opt/xuantie-riscv64-linux-toolchain --strip-components=1
```

and add `/opt/xuantie-riscv64-linux-toolchain/bin` to PATH env according to your shell.

**NOTE 1 :** the triplet of prebuilt Xuantie linux toolchain is **`riscv64-unknown-linux-gnu`**.
**NOTE 2 :** the sysroot is at '/opt/xuantie-riscv64-linux-toolchain/sysroot'.


## For bl_iot_sdk

You can not use above toolchains with bl_iot_sdk, bl_iot_sdk only works with SiFive GCC Toolchain. you can either use the full '[bl_iot_sdk](https://github.com/bouffalolab/bl_iot_sdk)' repo, it contains pre-built Windows / MacOSX / Linux toolchains and occupies about **14G** disk space. or use '[bl_iot_sdk_tiny](https://github.com/bouffalolab/bl_iot_sdk_tiny) and setup toolchain as : 

```
cd bl_iot_sdk_tiny
sudo bash ./scripts/setup.sh
```

It will download the SiFive gcc toolchain from bouffalo lab's official website and setup it automatically.


# SDK

## bl_mcu_sdk

[bl mcu sdk](https://github.com/bouffalolab/bl_mcu_sdk) is an MCU software development kit provided by the Bouffalo Lab Team, supports all the series of Bouffalo chips, include but not limited to:

- BL602/BL604
- BL702/BL704/BL706
- BL616/BL618
- BL808

### SDK installation

The installation process of bl_mcu_sdk is very simple, just git clone it and put it somewhere, for example:
```
# clone it
git clone https://github.com/bouffalolab/bl_mcu_sdk.git
# move it to home dir if not, you should have write permission to sdk dir.
mv bl_mcu_sdk <where your home dir>
```

And, set env to export BL_SDK_BASE:
```
export BL_SDK_BASE=<path to>/bl_mcu_sdk
```

'Out of SDK' building will use this env var to find bl_mcu_sdk.

### Demo project

The bl_mcu_sdk use 'cmake' and 'make' to manage whole project, use blink demos in this repo as example, the dir structure looks like:

```
demo dir
├── CMakeLists.txt : manage sources list, build flags and target name.
├── flash_prog_cfg.ini : used by BLFlashCommand.
├── main.c : source file(s).
├── Makefile : define CHIP/BOARD name, toolchain prefix, SDK PATH, etc. used to invoke the building process.
├── proj.conf : project specific CMAKE flags
└── readme.md
```

### Blink Demo for BL702

Here use 'blink_bl702' demo with Sipeed RV Debugger Plus, 'blink_bl602' and 'blink_bl616' demo is almost same.

```
cd blink_bl702
make
```
If you did not export BL_SDK_BASE env var before, an error will happened here. 

Please look at the contents of 'Makefile' to figure out how to define 'CHIP', 'BOARD' etc.

### Triple Core Demo for BL808

Here use 'triplecore_bl808' example with Sipeed M1S Dock, This demo show how to use all 3 cores of BL808 and receive hello world msg from M0 / D0 and LP cores.

The patch I made for bl_mcu_sdk was [already upstreamed](https://github.com/bouffalolab/bl_mcu_sdk/commit/ab70ccc953269bb4a35279000beea9013da5ac1c).

I put `bl_mcu_sdk` at home dir, if not, change this line in `Makefile` to your sdk path:
```
make -C $@ BL_SDK_BASE=$(HOME)/bl_mcu_sdk
```

And type `make` directly.

After build successfully, these firmware files will be generated:

- ./helloworld_m0/build/build_out/helloworld_bl808_m0.bin : firmware for m0
- ./helloworld_lp/build/build_out/helloworld_bl808_lp.bin : firmware for lp
- ./helloworld_d0/build/build_out/helloworld_bl808_d0.bin : firmware for d0

For more infomation about how to use this tripplecore demo, please refer to : https://github.com/cjacker/opensource-toolchain-bouffalo-lab/tree/main/triplecore_bl808

Due to use 'out sdk build' and this is a tutorial, you may find the commond line is too long to input everytime. Acctually, some options can be omited, at least `BL_SDK_BASE` must be set for 'out sdk build'. If you copy all these demos to `bl_mcu_sdk/examples` dir, you could just type `make` to build them.

If built successfully, the target '.bin / .elf' files should be generated in `build/build_out/` dir. you can modify the 'project' name in 'CMakeLists.txt' to change the target file name.

If you want to start a new project, you can either copy these demos from this repo, or use various demos in `bl_mcu_sdk/examples` dir.

## bl_iot_sdk

Bouffalolab bl_iot_sdk support BL602 Wi-Fi/BLE Combo RISC-V based Chip and BL70X Zigbee/BLE RISC-V based Chip.

The full [bl_iot_sdk](https://github.com/bouffalolab/bl_iot_sdk) will occupies 9G disk space since it contains all prebuilt toolchains for Windows / MacOSX (ARM and X86) and Linux (ARM and X86). If the bandwidth and disk space is not a issue for you, you can `git clone https://github.com/bouffalolab/bl_iot_sdk` directly, since toolchains for all supported platform included in it, it will be easy to use.

I recommend use [bl_iot_sdk_tiny](https://github.com/bouffalolab/bl_iot_sdk_tiny).

```
git clone https://github.com/bouffalolab/bl_iot_sdk_tiny
cd bl_iot_sdk_tiny
git submodule update --init --recursive --progress
cd components && git checkout
cd tools && git checkout
cd docs && git checkout
cd customer_app && git checkout
```
As mentions above, bl_iot_sdk only works with SiFive GCC toolchain, you need install it as :

```
cd bl_iot_sdk_tiny
sudo bash ./scripts/setup.sh
```

After toolchain installed, let's build the blink demo for BL602 to blink a LED connect to GPIO 5:
```
cd customer_app/get-start/blink
./genromap
```

If all good, `build_out/blink.bin` will be generated.


# Programming

The official GUI programming tool is 'BLDevCube', it support Windows / MacOSX and Linux. 

The official command line programming tool shipped in 'bl_mcu_sdk' is 'BLFlashCommand', it is commited into the 'bl_mcu_sdk' repo recently.

There are also '[bflb-mcu-tool](https://pypi.org/project/bflb-mcu-tool/)' and '[bflb-iot-tool](https://pypi.org/project/bflb-iot-tool/) with official support and [blisp](https://github.com/pine64/blisp)  from Pine64 can be used.

**NOTE:**

After `BLFlashCommand` commited into official bl_mcu_sdk repo and with the commit [[update][board] enable fw header for new flash tool ](https://github.com/bouffalolab/bl_mcu_sdk/commit/e70e482d2129411f34208d1184b4710074c67777):

- **The good news:** It has a program tool integrated, 'make flash' works.
- **The bad news:** It alter the firmware format, and not compatible with other opensource tools.

Compare with old firmware before this commit, the final ELF has a section '.fw_header' added. you can use 'readelf -S build/build_out/xxx.elf' to verify it has a '.fw_header' section or not.

- use 'BLFlashCommand' / 'blisp' / 'bflb-mcu-tool' / 'bflb-iot-tool' to program new firmware (firmware with .fw_header section).
- use 'blisp' / 'bflb-mcu-tool' / 'bflb-iot-tool' to program old firmware (firmware without .fw_header section). or `git checkout 18408f971e3f8c2f82e79ec5fddd38c22f288c0d` to roll back the 'fw_header' commit and rebuild your project.


## Programming tools installation

'BLDevCube' can be downloaded from : https://dev.bouffalolab.com/download

```
mkdir bldevcube
wget https://dev.bouffalolab.com/media/upload/download/BouffaloLabDevCube-v1.8.3.zip -P devcube
cd bldevcube
unzip BouffaloLabDevCube-v1.8.3.zip
chmod +x BLDevCube-ubuntu
chmod +x bflb_iot_tool-ubuntu
```
Actually, these tools are written in Python and packaged by pyinstaller, you can depackage and decompile them...

'BLFlashCommand' is already integreated into 'bl_mcu_ask', there is no additional installation required, it's also written in Python and packaged by pyinstaller.

'bflb-mcu-tool' is written in python and open source, install it as: 
```
pip install bflb-mcu-tool
```

'bflb-iot-tool' is written in python and open source too, install is as:
```
pip install bflb-iot-tool
```

And you should add `$HOME/.local/bin` to PATH env to find `bflb-mcu-tool` / `bflb-iot-tool` command.

[blisp](https://github.com/pine64/blisp) is written by Pine64 community, currently it can support BL60x and BL70x, and lack support for BL616 and BL808, but still worth a try. to build and install it:

```
git clone --recursive https://github.com/pine64/blisp.git
cd blisp
git submodule update --init --recursive
mkdir build && cd build
cmake -DBLISP_BUILD_CLI=ON ..
cmake --build .
```

## Programming

### for bl_mcu_sdk

To program BL chips, you need enter UART programming mode first.

- For BL702 / BL616, such as Sipeed RV Debugger Plus / M0Sense (702) and Sipeed M0S Dock (616), **Hold the Boot button down and plug sipeed rv debugger plug to PC Host USB port**.
- For BL602, I have a 'XT-BL12' devboard, **Plug it in PC USB port, Hold the 'D8' (GPIO8) button down, press and release 'EN' button, then release 'D8' (GPIO8) button.**
- For BL808, such as Sipeed M1S Dock, **Use 'UART' typec port to plug in PC USB Port, Hold 'BOOT' button down, press and release 'RESET' button, then release 'BOOT' button.**

In short, if devboard has 'BOOT' button, "hold BOOT button down and power it" will enter UART programming mode. "hold BOOT button down and click RESET button" actually is equal to "hold BOOT button down and power it".

Then you can program it:

### with `BLFlashCommand` (recommended)

Since 'BLFlashCommand' already integrated in bl_mcu_sdk, we can treat it as the default and officially recommended tool to program BL chips.

`BLFlashCommand` read the 'flash_prog_cfg.ini' as config file, please setup this file correctly, and use demos in this repo, just type:

```
make flash
```

You may need to set 'BL_SDK_BASE' to your bl_mcu_sdk dir if using 'out sdk build'. 

All demos include triple core demo for BL808 in this repo can be programmed by 'BLFlashComand'.

### Option 1 : with `bflb-mcu-tool` :

For new firmware format (with .fw_header). If you rebuild your project with updated 'bl_mcu_sdk', it should be always new firmware.

```
bflb-mcu-tool --chipname=bl702 --interface=uart --port=/dev/ttyACM0 --baudrate=2000000 --firmware=build/build_out/blink_bl702.bin --addr 0x1000
```

For old firmware format (without .fw_header). Usually, old firmwares are some pre-built and released bin files. please remove `--addr 0x1000` options from above command:

```
bflb-mcu-tool --chipname=bl702 --interface=uart --port=/dev/ttyACM0 --baudrate=2000000 --firmware=build/build_out/blink_bl702.bin
```

### Option 2 : with `blisp`

For new firmware (with .fw_header). If you rebuild your project with updated 'bl_mcu_sdk', it should be always new firmware.

```
blisp iot -c bl70x -p /dev/ttyACM0 --reset -s build/build_out/blink_bl702.bin -l 0x1000
```

For old firmware (without .fw_header).
```
blisp write -c bl70x -p /dev/ttyACM0 --reset build/build_out/blink_bl702.bin
```
Or
```
blisp iot -c bl70x -p /dev/ttyACM0 --reset -s build/build_out/blink_bl702.bin -l 0x0
```

### for bl_iot_sdk

Too many options make things complex, let's keep it as simple as possible.

Use `bl_iot_sdk/customer_app/get-start/blink` as example, after `build_out/blink.bin` generated as mentioned in 'SDK' section, program it to XT-BL12 devboard by :

```
bflb-iot-tool --chipname=bl602 --port=/dev/ttyUSB0 --baudrate=2000000 --firmware=build_out/blink.bin
```

Don't forget enter programming mode first by **Hold the 'D8' (GPIO8) button down, press and release 'EN' button, then release 'D8' (GPIO8) button.**

After programming finished, you need repower the device to blink the LED connect to GPIO 5.

## Debugging

Debugging of BL series chips are supported by OpenOCD with JTAG debugger or C-Sky Debug Server with CK-Link debugger. 

The pinmap for JTAG or CK-Link is same:

|   CHIP/Pin    |  BL602/BL604  |  BL702/BL704/BL706 | BL616/BL618 |   BL808  |
|:-------------:|:-------------:|:------------------:|:-----------:|:--------:|
|TMS            |     GPIO12    |      GPIO0         |    GPIO0    |   GPIO6  |
|TCK            |     GPIO14    |      GPIO2         |    GPIO1    |   GPIO12 |
|TDO            |     GPIO11    |      GPIO9         |    GPIO2    |   GPIO7  |
|TDI            |     GPIO17    |      GPIO1         |    GPIO3    |   GPIO13 |

## With OpenOCD and JTAG debugger

There are some target config for OpenOCD in `bl_mcu_sdk`, you can use them directly:
- tools/openocd/target/tgt_602.cfg : for BL602
- tools/openocd/target/tgt_702.cfg : for BL702 
- tools/openocd/target/tgt_e907.cfg : for E907 core of BL808
- tools/openocd/target/tgt_c906.cfg : for C906 core of BL808

Not like STM32, OpenOCD does not support programming BL chips directly. Before debugging with OpenOCD, you have to program the target device using ISP mode.

After target device programmed, wire up any JTAG adapter as above table with Target device, and launch RISC-V OpenOCD as:
```
riscv-openocd -f <interface config file> -f tgt_702.cfg
```

If everything OK, the output looks like:
```
Info : clock speed 4000 kHz
Info : JTAG tap: riscv.cpu tap/device found: 0x20000e05 (mfg: 0x702 (<unknown>), part: 0x0000, ver: 0x2)
Info : [riscv.cpu.0] datacount=1 progbufsize=2
Info : Disabling abstract command reads from CSRs.
Info : Disabling abstract command writes to CSRs.
Info : [riscv.cpu.0] Examined RISC-V core; found 1 harts
Info : [riscv.cpu.0]  XLEN=32, misa=0x40801125
[riscv.cpu.0] Target successfully examined.
Info : starting gdb server for riscv.cpu.0 on 3333
Info : Listening on port 3333 for gdb connections
Info : JTAG tap: riscv.cpu tap/device found: 0x20000e05 (mfg: 0x702 (<unknown>), part: 0x0000, ver: 0x2)
reset-assert-pre
reset-deassert-post
reset-init
Info : Listening on port 6666 for tcl connections
Info : Listening on port 4444 for telnet connections
```
Then open another terminal and run gdb as:
```
riscv64-unknown-elf-gdb build/build_out/blink_bl702.elf
```
After '(gdb)' prompt showed:
```
(gdb) target remote :3333
Remote debugging using :3333
...
(gdb) set $pc=0x21000000
(gdb) set $mie=0x00
(gdb) set $mstatus=0x1880
(gdb) list main 15
15          while (1) {
16              bflb_gpio_set(gpio, GPIO_PIN_25);
17              bflb_mtimer_delay_ms(200);
18              bflb_gpio_reset(gpio, GPIO_PIN_25);
19              bflb_mtimer_delay_ms(200);
20          }
21      }
(gdb) hb 17
Hardware assisted breakpoint 1 at 0x2300238e: file <path>/blink_bl702/main.c, line 17.
(gdb) c
Continuing.

Breakpoint 1, main () at <path>/blink_bl702/main.c:17
17              bflb_mtimer_delay_ms(200);
(gdb)
```

There are something need to be explained here:
> For the code running on XIP, load is unnecessary and cannot be used, because XIP programs need to be
> programmed with a programming tool before debugging, and writing to the XIP area may cause unknown
> errors. In addition, the XIP program needs to rely on ROM code (0x21000000) to initialize the related software
> and hardware, so the following configuration is required:
> 
> set $pc = 0x21000000
> 
> set $mie = 0
> 
> set $mstatus = 0x1880

For more infomation about OpenOCD and gdb usage, please refer to official document "[Introduction of OpenOCD and GDB.pdf](https://github.com/bouffalolab/bl_docs/blob/main/BL602_Openocd%26GDB/en/Introduction%20of%20OpenOCD%20and%20GDB.pdf)".

## With C-Sky debug server and CK-Link Lite

You can buy a T-Head or HLK CK-Link Lite debugger from Aliexpress, or make it yourself using Sipeed RV Debugger plus / Sipeed M0S Dock or STM32F103 blue pill.

### Install C-Sky debug server

The T-Head debug server can be downlowed from https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1673423345494/T-Head-DebugServer-linux-x86_64-V5.16.7-20230109.sh.tar.gz

After download finished:

```
tar xf T-Head-DebugServer-linux-x86_64-V5.16.7-20230109.sh.tar.gz
tail -n +282 T-Head-DebugServer-linux-x86_64-V5.16.7-20230109.sh >csky-debug-server.tar.gz
```
Then extract the 'csky-debug-server.tar.gz' to somewhere, for example:
```
mkdir -p /opt/csky-debug-server
sudo tar zxf csky-debug-server.tar.gz -C /opt/csky-debug-server
```

The command of csky-debug-server is `DebugServerConsole.elf`, it depend on some libraries installed at `/opt/csky-debug-server` dir,you have to run it as:

```
cd /opt/csky-debug-server
./DebugServerConsole.elf
```

Or

```
LD_LIBRARY_PATH=/opt/csky-debug-server /opt/csky-debug-server/DebugServerConsole.elf
```

You can save below wrapper script as `csky-debug-server` and put it to `/usr/bin`:

```
#!/usr/bin/bash
cd /opt/csky-debug-server
export LD_LIBRARY_PATH=/opt/csky-debug-server
./DebugServerConsole.elf $@
```

You may also need to create a udev rule '/etc/udev/rules.d/99-csky-cklink.rules' with below contents to set device permission correctly (allow normal user read / write the CK-Link device).

```
# For Hi-Link CK-Link lite
SUBSYSTEM=="usb", ATTR{idVendor}="32bf", ATTR{idProduct}=="b210", MODE="666"
```

After this udev rules saved, please run:
```
udevadm trigger
udevadm control --reload
```

### Option 1 : Use T-Head or HLK CK-Link debugger

The Ck-Link pinout:

```
 +-------------+
 | TDI ▪ • GND |
 | TDO • • GND |
   TCK • • GND |
    -- • • --  |
  nRST • • TMS |
 |  -- • • --  |
 |VREF • • TRST|
 +-------------+
```

Official CK-Link debugger from T-Head or HLK do not supply power to target board, you need supply power to target board with another USB cable.

### Option 2 : Use Sipeed RV Debugger Plus or M0S Dock with cklink-lite firmware

The cklink-lite firmware for RV Debugger Plus and M0S Dock are provided in this repo:
- sipeed_rv_debugger_plus_factory_firmware/bl702_cklink_whole_img_v2.2.bin : for Sipeed RV Debugger Plus
- m0s_dock_cklink-lite_firmware/bl616-cklink-lite-2023-02-27.bin : for Sipeed M0S Dock

To program Sipeed RV Debugger Plus, hold 'BOOT' down and plug it in PC USB port:
```
cd sipeed_rv_debugger_plus_factory_firmware
./01-program-cklink-lite.sh
```
The pinmap was already printed at the back of Sipeed RV Debugger Plus:
<img src="./misc/rv-debugger.png" width="60%" />


To program Sipeed M0S Dock, hold 'BOOT' down and plug it in PC USB port:
```
cd m0s_dock_cklink-lite_firmware
./01-program-cklink-lite.sh
```
You need refer to below table for M0S Dock, since at the back of M0S Dock, only 'IOxx' is printed.

<img src="./m0s_dock_cklink-lite_firmware/m0sdock-cklink-lite-pinmap.png" width="60%" />

After programmed, re-power it and using `lsusb`, you will find:
```
42bf:b210 Bouffalo C-Sky CKLink-Lite
```

Then connect the target board with RV Debugger Plus / M0S Dock as same as CK-Link Lite Debugger.



### Option 3 : Make your own CK-Link Lite debugger with STM32F103

C-Sky debug server contains a set of cklink firmware files, if you have a STM32F103 devboard, you can use 'cklink_lite.hex' shipped with C-Sky debug server to make your own CK-Link debugger. 

'cklink_lite_iap.hex' (address range from 0x0800_0000 to 0x0800_4000) is the bootloader and 'cklink_lite.hex' (address range start from 0x0800_4000) is the firmware. the IAP firmware not works with STM32F103 bluepill (due to the circuit differences between CKLink Lite debugger and STM32F103 bluepill), we need modify the 'cklink_lite.hex' first to copy the vector table to the beginning of the flash:

- open 'cklink_lite.hex' in your favorite editor.
- copy the lines before address 0x4100 and paste them to the start of file.
- modify address of all lines just copied, from 0x40XX to 0x00XX.
- fix the checksum of all lines just modified.

I wrote a tool to convert it automatically, you can find it in [cklink-lite-fw-convertor](https://github.com/cjacker/cklink-lite-fw-convertor) repo.

And the pre-converted '[cklink-lite-2.36_for-stm32f103.hex](https://raw.githubusercontent.com/cjacker/cklink-lite-fw-convertor/main/cklink_lite-2.36_for-stm32f103.hex) can programmed to STM32F103 directly. If the firmware version is outdated, you can use `cklink-lite-fw-convertor` to convert the latest firmware yourself.

After STM32F103 programmed, refer to below table to connect STM32F103 with your target devboard and plug STM32F103 to PC USB port.

| STM32F103 | CK-Link  |
|-----------|----------|
| A0        | TRST     |
| A1        | TCK      |
| A4        | TDO      |
| A5        | TMS      |
| B9        | TDI      |
| 3V3       | 3V3      |
| GND       | GND      |


### Launch C-Sky debug server

Then invoke C-Sky debug server as mentioned above:

```
# here I use wrapper script
csky-debug-server
```

If all good, the output looks like:
```
+---                                                    ---+
|  T-Head Debugger Server (Build: Jan  9 2023, Linux)      |
   User   Layer Version : 5.16.07
   Target Layer version : 2.0
|  Copyright (C) 2022 T-HEAD Semiconductor Co.,Ltd.        |
+---                                                    ---+
T-HEAD: CKLink_Lite_V2, App_ver 2.36, Bit_ver null, Clock 2526.316KHz,
       5-wire, With DDC, Cache Flush On, SN CKLink_Lite_V2-650763C7D6.
+--  Debug Arch is RVDM.  --+
+--  CPU 0  --+
RISCV CPU Info:
        MARCHID: 0x00000000
        MISA   : 0x40801125
Target Chip Info:
        HWBKPT number is 4, HWWP number is 4.
        MISA: (RV32IMAFCX, Imp M-mode)

GDB connection command for CPUs(CPU0):
        target remote 127.0.0.1:1025
        target remote xxx.xxx.xxx.xxx:1025

****************  DebuggerServer Commands List **************
help/h
        Show help informations.
*************************************************************
DebuggerServer$
```

### Debugging
Use blink_bl702 as example, After build successfully, open new terminal window, and run:

```
riscv64-unknown-elf-gdb build/build_out/blink_bl702.elf
```


After '(gdb)' prompt showed:
```
(gdb) target remote :1025
Remote debugging using :1025
main () at /home/cjacker/work/opensource-toolchain-bouffalo-lab/blink_bl702/main.c:18
18              bflb_gpio_reset(gpio, GPIO_PIN_25);
(gdb) b main
Breakpoint 1 at 0x23002350: file /home/cjacker/work/opensource-toolchain-bouffalo-lab/blink_bl702/main.c, line 9.
(gdb) b main.c:9
Note: breakpoint 1 also set at pc 0x23002350.
Breakpoint 2 at 0x23002350: file /home/cjacker/work/opensource-toolchain-bouffalo-lab/blink_bl702/main.c, line 9.
(gdb) c
```

# Build linux kernel for BL808

The linux kernel building for C906 core of BL808 is worth a seperate section.

When we setup toolchain, I alreay mentioned the XuanTie RISC-V linux toolchain, and it never used in above sections. The RISC-V linux toolchain is only useful for building a linux kernel for C906 core of BL808.

Although there are still some drivers missing, but linux kernel can boot and work with BL808 already.

Before building the linux kernel, make sure you setup toolchains correctly.

## Building linux kernel

- Clone bl808_linux.

Upstream git is https://github.com/bouffalolab/bl808_linux, but the 'build.sh' need some changes to work better, you can use my fork now.

```
git clone https://github.com/cjacker/bl808_linux.git
git checkout for_tutorial
```
- Build bl808_linux.

If you use Sipeed M1S Dock, please run :
```
./switch_to_m1sdock.sh
```
It will apply a patch to setup UART pins for M1S Dock.

Then build it step by step:

```
./build.sh opensbi
./build.sh kernel_config
./build.sh kernel
./build.sh dtb
./build.sh low_load
./build.sh whole_bin
```
Or 
```
./build.sh all
```
When `./build.sh kernel_config`, it will launch kernel menuconfig, just exit directly or change kernel configuration if you really understand what you changed.

If all good, the result firmwares will be generated at 'out' dir:
- low_load_bl808_m0.bin : you can treat it as kernel loader.
- low_load_bl808_d0.bin : you can treat it as kernel loader.
- whole_img_linux.bin : the linux file system.

I put all pre-built firmwares at '[m1s_linux_firmware](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/tree/main/m1s_linux_firmware)' this repo.

## Flash linux kernel and Run

Please refer to https://github.com/cjacker/opensource-toolchain-bouffalo-lab/blob/main/m1s_linux_firmware/README.md.



# Misc

## how to build and program uartjtag and dualuart firmware for Sipeed RV Debugger Plus

Upstream repo for Sipeed RV Debugger Plus is https://github.com/sipeed/RV-Debugger-BL702/, The build instruction in README.md is outdated.

We do not use the outdated version of `bl_mcu_sdk` shipped with Sipeed RV Debugger Plus in this tutorial, just build the 'uartjtag' and 'dualuart' firmwares with it.

```
git clone https://github.com/sipeed/RV-Debugger-BL702
git submodule update --init --progress
cd firmware/bl_mcu_sdk
```

To build jtaguart firmware for Sipeed RV Debugger Plus:
```
make BOARD=bl702_debugger APP_DIR=../app APP=usb2uartjtag
```
If all good, the target file is 'out/app/usb2uartjtag/usb2uartjtag_bl702.bin'.


To build dualuart firmware for Sipeed RV Debugger Plus:
```
make BOARD=bl702_debugger APP_DIR=../app APP=usb2dualuart
```

If all good, the target file is 'out/app/usb2dualuart/usb2dualuart_bl702.bin'.

To program these firmwares to Sipeed RV Debugger Plus, you can use:

```
bflb-mcu-tool --chipname=bl702 --interface=uart --port=/dev/ttyACM0 --baudrate=2000000  <firmware.bin>
```
Or 
```
bflb-iot-tool --chipname=bl702 --port=/dev/ttyACM0 --baudrate=2000000 --addr 0x2000 --firmware=<firmware.bin>
```
Or
```
blisp iot -c bl70x --reset -s <firmware.bin> -l 0x2000
```

## how to turn M0S Dock to CK-Link Lite

The CK-Link Lite firmware for M0S Dock is in [m0s_dock_cklink-lite_firmware](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/tree/main/m0s_dock_cklink-lite_firmware) dir.

Hold the BOOT button down and power on M0S Dock by plug it in PC USB port, and program it as:
```
$ bflb-mcu-tool --chipname=bl616 --interface=uart --port=/dev/ttyACM0 --baudrate=2000000 --firmware=bl616-cklink-lite.bin
```


## M0sense board (BL702) programming notes

Sipeed M0sense is an AIOT development board based on BL702 of Bouffalo Lab, it's RISC-V architecture, supports low-energy bluetooth. There is a 8Pins FPC connector for connecting LCD screen, and 1 microphone, 1 RGB LED and a six-axis sensor chip are on this board. One USB 2.0 FS routes to Type-C interface.

It has 'BOOT' and 'RESET' buttons indeed, but NOT for entering UART programming mode, it's for entering U-Disk programming mode with factory firmware.

To enter UART programming mode we metioned above many times, you need to **short the 3v3 and boot pin**, then power it, the M0sense board will enter UART programming mode.

After that, you can program it with `bflb-mcu-tool` etc.

## M1S Dock (BL808) programming notes

Since BL808 has 3 cores, the programming process of BL808 will be a little bit complex, it depend on devboard design and bsp codes. 

Using Sipeed M1S Dock as example, beside BL808, it also have a standalone BL702 chip integrated on board to emulate 2 UART interfaces. you may need to:
- program BL702 to fix/restore damage dualuart firmware.
- program 3 cores of BL808

```
         +--------------+                  +----------------+
         |OTP TypeC Port|                  |UART TypeC Port |
         +--------------+                  +----------------+
                |                              |        |
                |                              |        |
         +------V-------+                      V        V
         |3M USB storage|               +---------------------+
         |to program D0 |               | BL702,emulate 2 UART| <- to program BL702,
         |              |               |   +-----+  +-----+  |    hold 'BOOT' button and power it.
         |Hold S1+S2    |               |   |UART0|  |UART1|  |
         |Toggle 'RST'  |               |   +---^-+  +-^---+  |
         |Mount         |               +-------|------|---|--+
         +----+---------+                     RX|TX  RX|TX | <- to program BL808 by UART Mode, power it and
              |                                 |      |   |    hold 'BOOT' button, toggle 'RST'.
              |To program      +----------------|------|---+----------+
              |D0 Core         |  BL808         |      |              |
              |by Udisk mode   |        +-------V-+  +-V-------+      |
              +-------------------------> D0 Core |  | M0 Core |      |
     +------------+            |        +---------+  +---------+      |
     | Standalone |           D18 (TX)  +---------+                   |
     |UART adapter|<--------------------> LP Core |                   |
     |   UART2    |           D19 (RX)  +---------+                   |
     +------------+            +--------------------------------------+
```

You can use 'BLDevCube' Linux version to make things easier, Sipeed already have a [good tutorial](https://wiki.sipeed.com/hardware/en/maix/m1s/other/start.html) here, please refer to [sipeed tutorial](https://wiki.sipeed.com/hardware/en/maix/m1s/other/start.html) on how to use 'BLDevCube' to program M1S Dock.

Here will explain how to program BL808 by command line:

### To program on-board BL702 of M1S Dock

Usually, it's useful to fix or restore the factory 'dualuart' firmware.

You need activate BL702 UART programming mode first, please refer to above sections on how to activate it.

```
$ bflb-iot-tool --chipname=bl702 --port=/dev/ttyACM0 --baudrate=2000000 --firmware=<dualuart factory firmware> --addr 0x2000 
```

Or 
```
$ blisp iot -c bl70x --reset -s usb2dualuart_bl702_221118.bin -l 0x2000
```

### To program E907 core of BL808 for M1S Dock 

You need activate BL808 UART programming mode first, please refer to above sections on how to activate it.

And use the bigger number of 2 serial devices, here is '/dev/ttyUSB1'.

```
bflb-iot-tool --chipname=bl808 --port=/dev/ttyUSB1 --baudrate=2000000 --firmware=<firmware.bin> --pt=<partition table, if have> --boot2=<boot2 file from BLDevCub>
```

For partion table and boot2 files, you can find it from https://github.com/sipeed/M1s_BL808_example and BLDevCube. There also has a [m1s_factory_firmware copy](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/tree/main/m1s_dock_factory_firmware) in this repo.

The UART programming mode can be used to program all 3 cores by BLDevCube and BLFlashCommand.

### To program C906 core of BL808 for M1S Dock (M1S Dock specific)

M1S dock implement U-Disk programming mode for C906 core, to activate U-Disk programming mode:
- connect the 'OTP' typec port of M1S Dock with PC USB port
- Hold 'S1' and 'S2' button down at the same time.
- Press 'RESET' button and release
- Release 'S1' and 'S2' button
- find the usb storage device and mount it to somewhere
- copy C906 firmware to mount point and umount it.

It will programmed automatically and reset the device.


## how to restore factory firmwares for M1S Dock

All factory firmwares for M1S Dock is in [m1s_dock_factory_firmware](https://github.com/cjacker/opensource-toolchain-bouffalo-lab/edit/main/m1s_dock_factory_firmware/README.md) dir.

The files in this dir includes:

- `01-restore-bl702-dualuart-firmware.sh` : script to restore BL702 factory firmware (dualuart) of M1S Dock.

- `02-restore-bl808-factory-firmware.sh` : script to restore BL808 factory firmware of M1S Dock. include E907 core (M0) and C906 core (D0)

- `usb2dualuart_bl702_221118.bin` : default dualuart firmware for BL702, from https://dl.sipeed.com/shareURL/MAIX/M1s/M1s_Dock/7_Firmware
 
- `boot2_isp_debug.bin` and `boot2_isp_release.bin` : from Dev Cube

- `d0fw_20221212.bin` : factory firmware for C906 core (D0)

- `firmware_20230227.bin` : factory firmware for E907 core (m0)

- `partition_cfg_16M_m1sdock.toml` : partition table for M1S Dock


`01-restore-bl702-dualuart-firmware.sh` and `02-restore-bl808-factory-firmware.sh` can be used to restore the factory formware for Sipeed M1S Dock. It will guide you step by step to activate the UART programming mode and program the firmware to target device.

To restore or fix dualuart firmware for BL702:
```
./01-restore-bl702-dualuart-firmware.sh
```

To restore factory firmwares for BL808:
```
./02-restore-bl808-factory-firmware.sh
```
