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
  + Sipeed M1s : BL808

# Toolchain overview:
- Compiler : riscv gcc toolchain
- SDK : bl_mcu_sdk
