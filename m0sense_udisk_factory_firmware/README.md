# U-disk factory firmware for Sipeed M0sense

To program `m0sense_udisk_bl702_v0.1.bin` to M0sense board, you need:
- short 3v3 pin and boot pin
- power it

Then program it as : 

```
bflb-mcu-tool --chipname bl702 --interface uart --port /dev/ttyACM0 --baudrate 2000000 --firmware m0sense_udisk_bl702_v0.1.bin
```

After firmware programmed, hold 'BOOT' button, toggle 'RESET' button will turn m0sense to U-disk, you can mount the device and copy uf2 firmware to it to program.

