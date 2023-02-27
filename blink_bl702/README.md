# to build:

```bash
$ make CHIP=bl702 BOARD=bl702dk CROSS_COMPILE=riscv-none-embed- BL_SDK_BASE=<bl_mcu_sdk path>
```

# to flash:

```bash
$ make flash COMX=/dev/ttyACM0 CHIP=bl702 BOARD=bl702dk CROSS_COMPILE=riscv-none-embed- BL_SDK_BASE=<bl_mcu_sdk path>
```
# to flash with bfld-mcu-tool

```bash
$ bflb-mcu-tool --chipname=bl702 --interface=uart --port=/dev/ttyACM0 --baudrate=2000000 --firmware=build/build_out/sipeed_debugger_plus_blink_bl702.bin --addr 0x1000
```

# to flash with blisp

```bash
$ blisp iot -c bl70x -p /dev/ttyACM0 --reset -s build/build_out/sipeed_debugger_plus_blink_bl702.bin -l 0x1000
```

# to clean

```bash
make clean CHIP=bl702 BOARD=bl702dk CROSS_COMPILE=riscv-none-embed- BL_SDK_BASE=<bl_mcu_sdk path>
```
