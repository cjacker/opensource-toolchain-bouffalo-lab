'bl702_cklink_whole_img_v2.2.bin':

- Turn sipeed rv debugger plus to CK-Link Lite debugger.
- Program as `blisp iot -c bl70x --reset -s bl702_cklink_whole_img_v2.2.bin -l 0x0`
- It is from https://github.com/bouffalolab/bl_mcu_sdk/tree/master/tools/cklink_firmware. 
- only binary release.


'usb2uartjtag_bl702.bin' and 'usb2dualuart_bl702.bin':

- Turn sipeed rv debugger plus to jtag+uart or dual uart.
- Program as `bflb_mcu_tool --chipname=bl702 --interface=uart --port=/dev/ttyACM0 --baudrate=2000000 --firmware=usb2uartjtag_bl702.bin`
- It is built from https://github.com/sipeed/RV-Debugger-BL702/tree/main/firmware


 

