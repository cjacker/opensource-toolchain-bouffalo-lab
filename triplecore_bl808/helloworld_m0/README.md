# bl808_dualcore


## Support CHIP

|      CHIP        | Remark |
|:----------------:|:------:|
|BL808             |  Only for M0 CPU      |

## Compile

- BL808

```
make CHIP=bl808 BOARD=bl808dk CPU_ID=m0
```

## Flash

```
make flash CHIP=chip_name COMX=xxx # xxx is your com name
```