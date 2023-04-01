# Patch for Sipeed M0P Dock
for Sipeed M0P Dock, the patch '[bouffalo_sdk-patch-for-m0p.patch](./bouffalo_sdk-patch-for-m0p.patch)' need to be applied to bouffalo_sdk.


# to build:

```bash
$ make CHIP=bl616 BOARD=bl616dk CROSS_COMPILE=riscv64-unknown-elf- BL_SDK_BASE=<bl_mcu_sdk path>
```
# to flash:

```bash
$ make CHIP=bl616 BOARD=bl616dk CROSS_COMPILE=riscv64-unknown-elf- BL_SDK_BASE=<bl_mcu_sdk path> COMX=/dev/ttyACM0 flash
```
# to flash with blfb-mcu-tool

```bash
$ bflb-mcu-tool --chipname=bl616 --interface=uart --port=/dev/ttyACM0 --baudrate=2000000 --firmware=build/build_out/blink_m0s_dock_bl616.bin --addr 0x1000
```

# to clean:

```bash
$ make CHIP=bl616 BOARD=bl616dk CROSS_COMPILE=riscv64-unknown-elf- BL_SDK_BASE=<bl_mcu_sdk path> flash
```
Or
```
$ rm -rf build
```
