# enter program mode for XT-BL12 devboards

Hold 'D8' button down, press 'EN' button and release, then release 'D8' button.

# to build:

```bash
$ make CHIP=bl602 BOARD=bl602dk CROSS_COMPILE=riscv-none-embed- BL_SDK_BASE=<path to bl_mcu_sdk>
```
# to flash:

```bash
$ make flash CHIP=bl602 BOARD=bl602dk CROSS_COMPILE=riscv-none-embed- BL_SDK_BASE=<path to bl_mcu_sdk> COMX=/dev/ttyUSB0
```
# to flash with blfb-mcu-tool

```bash
$ bflb-mcu-tool --chipname=bl602 --interface=uart --port=/dev/ttyUSB0 --baudrate=2000000 --firmware=build/build_out/blink_xt_bl12_bl602.bin --addr 0x1000
```

# to clean:

```bash
$ make clean CHIP=bl602 BOARD=bl602dk CROSS_COMPILE=riscv-none-embed- BL_SDK_BASE=<path to bl_mcu_sdk>
```
