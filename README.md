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
- [Debugging]
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
  + Various JTAG debuggers


# Toolchain overview:
- Compiler : RISC-V 32/64 embed and linux toolchain
- SDK : official [bl_iot_sdk](https://github.com/bouffalolab/bl_iot_sdk_tiny) and [bl mcu sdk](https://github.com/bouffalolab/bl_mcu_sdk)
- Programming tool : Dev Cube Linux Version / BLFlashCommand (integrated in bl_mcu_sdk) / bflb-iot-tool / bflb-mcu-tool / blisp
- Debugger : OpenOCD / C-Sky Debug Server and gdb 

**NOTE:**

**About the difference between bl_iot_sdk & bl_mcu_sdk**, there is an answer [here](https://bbs.bouffalolab.com/d/124-difference-bl-iot-sdk-bl-mcu-sdk).

<img src="https://raw.githubusercontent.com/cjacker/opensource-toolchain-bouffalo-lab/main/misc/diff-iot-mcu.png" width="60%" />

The answer is not very clear. In short, bl_iot_sdk focus on IOT-related programming, such as Wi-Fi/BLE, etc, and bl_mcu_sdk doesn't have these support. I am a little bit confusing why they have 2 official SDKs and even differ a lot, but it already does and seems plan to be merge together into bl_mcu_sdk in futrue. For now, you can choose the sdk as your own need.

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

Usually I prefer to use Xpack prebuilt toolchains, but Xpack only provide rv32 embed toolchain up to now and not compatible with some Xuantie extentions. In this tutorial, we will and have to use prebuilt T-Head Xuantie toolchains.

## T-Head Xuantie RISC-V embeded gcc

T-Head provide RISC-V embed toolchain (gcc v10.2.0) to work with 32bit and 64bit RISC-V, it can be download from [here](https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1663142243961/Xuantie-900-gcc-elf-newlib-x86_64-V2.6.1-20220906.tar.gz).

After download:

```
sudo mkdir -p /opt/xuantie-riscv64-embed-toolchain
sudo tar xf Xuantie-900-gcc-elf-newlib-x86_64-V2.6.1-20220906.tar.gz -C /opt/xuantie-riscv64-embed-toolchain --strip-components=1
```

and add `/opt/xuantie-riscv64-embed-toolchain/bin` to PATH env according to your shell.

**NOTE**, the triplet of prebuilt Xuantie rv64 embed toolchain is **`riscv64-unknown-elf`**, make sure it is not conflict with toolchains you already installed, otherwise you have to handle PATH env yourself.

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

It will download the sifive gcc toolchain and setup it automatically.


# SDK

## bl_mcu_sdk

[bl mcu sdk](https://github.com/bouffalolab/bl_mcu_sdk) is an MCU software development kit provided by the Bouffalo Lab Team, supports all the series of Bouffalo chips, include but not limited to:

- BL602/BL604
- BL702/BL704/BL706
- BL616/BL618
- BL808

### SDK installation

The installation process of bl_mcu_sdk is very simple, just fetch it and put it somewhere, for example:
```
# fetch it
git clone https://github.com/bouffalolab/bl_mcu_sdk.git
# move it to home dir if not, you should have write permission to sdk dir.
mv bl_mcu_sdk <where your home dir>
```

And, set env as:
```
export BL_SDK_BASE=<path to>/bl_mcu_sdk
```

If you put the bl_mcu_sdk to other dir, please change above `export` to point to your sdk dir. if did not export the `BL_SDK_BASE` env, you need supply it when invoke 'make'.

### Demo project

The bl_mcu_sdk use cmake and make to manage the project, and have it's own project management style, use blink demos in this repo as example, the dir structure looks like:

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

here use 'blink_bl702' with Sipeed RV Debugger Plus, 'blink_bl602' demo is almost same except you need change '702' to '602' for CHIP and BOARD:

```
cd blink_bl702
make CHIP=bl702 BOARD=bl702dk CROSS_COMPILE=riscv64-unknown-elf- BL_SDK_BASE=<path to bl_mcu_sdk>
```

### Blink Demo for BL616
Here use 'blink_bl616' with Sipeed M0S Dock:

```
cd blink_bl616
make CHIP=bl616 BOARD=bl616dk CROSS_COMPILE=riscv64-unknown-elf- BL_SDK_BASE=<bl_mcu_sdk path>
```

The CHIP / BOARD / CROSS_COMPILE / BL_SDK_BASE options can be set in 'Makefile'. Refer to 'README.md' in each demo dir to find more command usage.

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
bflb-mcu-tool --chipname=bl702 --interface=uart --port=/dev/ttyACM0 --baudrate=2000000 --firmware=build/build_out/sipeed_debugger_plus_blink_bl702.bin --addr 0x1000
```

For old firmware format (without .fw_header). Usually, old firmwares are some pre-built and released bin files. please remove `--addr 0x1000` options from above command:

```
bflb-mcu-tool --chipname=bl702 --interface=uart --port=/dev/ttyACM0 --baudrate=2000000 --firmware=build/build_out/sipeed_debugger_plus_blink_bl702.bin
```

### Option 2 : with `blisp`

For new firmware (with .fw_header). If you rebuild your project with updated 'bl_mcu_sdk', it should be always new firmware.

```
blisp iot -c bl70x -p /dev/ttyACM0 --reset -s build/build_out/sipeed_debugger_plus_blink_bl702.bin -l 0x1000
```

For old firmware (without .fw_header).
```
blisp write -c bl70x -p /dev/ttyACM0 --reset build/build_out/sipeed_debugger_plus_blink_bl702.bin
```
Or
```
blisp iot -c bl70x -p /dev/ttyACM0 --reset -s build/build_out/sipeed_debugger_plus_blink_bl702.bin -l 0x0
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

**to be written**

Default JTAG pin:

|   CHIP/Pin    |  BL602/BL604  |  BL702/BL704/BL706 | BL616/BL618 |   BL808  |
|:-------------:|:-------------:|:------------------:|:-----------:|:--------:|
|TMS            |     GPIO12    |      GPIO0         |    GPIO0    |   GPIO6  |
|TCK            |     GPIO14    |      GPIO2         |    GPIO1    |   GPIO12 |
|TDO            |     GPIO11    |      GPIO9         |    GPIO2    |   GPIO7  |
|TDI            |     GPIO17    |      GPIO1         |    GPIO3    |   GPIO13 |


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
