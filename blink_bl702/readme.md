```bash
# to build:
$ make CHIP=bl702 BOARD=bl702dk CROSS_COMPILE=riscv-none-embed- BL_SDK_BASE=<bl_mcu_sdk path>

#to flash:
$ make flash COMX=/dev/ttyACM0 CHIP=bl702 BOARD=bl702dk CROSS_COMPILE=riscv-none-embed- BL_SDK_BASE=<bl_mcu_sdk path>
```
