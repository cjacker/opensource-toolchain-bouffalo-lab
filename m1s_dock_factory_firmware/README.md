## Factory firmwares for Sipeed M1S Dock and programming utility for Linux command line

`01-restore-bl702-dualuart-firmware.sh` and `02-restore-bl808-factory-firmware.sh` can be 
used to restore the factory formware for Sipeed M1S Dock from command line.

`03-program-d0-firmware.sh` can be used to program all other D0 factory demos or firmware you build from SDK
 for Sipeed M1S Dock from command line.

## Usage
To restore or fix dualuart firmware for BL702:
```
./01-restore-bl702-dualuart-firmware.sh
```

To restore factory firmwares for BL808:
```
./02-restore-bl808-factory-firmware.sh
```

To program other firmwares for D0 of BL808 (no matter factory demos or build from M1S SDK):
```
./03-program-d0-firmware.sh <firmware>
```

## File list

- `01-restore-bl702-dualuart-firmware.sh` : script to restore BL702 factory firmware (dualuart) of M1S Dock.

- `02-restore-bl808-factory-firmware.sh` : script to restore BL808 factory firmware of M1S Dock. include E907 core (M0) and C906 core (D0)

- `03-program-d0-firmware.sh` : script to program D0 firmwares your build from SDK.

- `usb2dualuart_bl702_221118.bin` : default dualuart firmware for BL702, from https://dl.sipeed.com/shareURL/MAIX/M1s/M1s_Dock/7_Firmware
 
- `boot2_isp_debug.bin` and `boot2_isp_release.bin` : from Dev Cube

- `whole_img_d0fw_20221212.bin` : preprocessed factory firmware for C906 core (D0), can be programmed by command line.

- `d0fw_20221212.bin` : not used, factory firmware for C906 core (D0)

- `firmware_20230227.bin` : factory firmware for E907 core (m0)

- `partition_cfg_16M_m1sdock.toml` : partition table for M1S Dock
