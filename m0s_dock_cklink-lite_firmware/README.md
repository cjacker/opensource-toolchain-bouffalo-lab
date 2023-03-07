bl616-cklink-lite-2023-02-27.bin:

- Turn m1s dock to CK-Link Lite debugger.
- program as `bflb-mcu-tool --chipname=bl616 --interface=uart --port=/dev/ttyACM0 --baudrate=2000000 --firmware=bl616-cklink-lite.bin`
- It is binary only.


<img src="./m0sdock-cklink-lite-pinmap.png" width="50%" />

<table>
<thead>
  <tr>
    <th colspan="2">M0S Dock</th>
    <th colspan="2">CK-Link pinout</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>GND</td>
    <td>GND</td>
    <td>GND</td>
    <td>GND</td>
  </tr>
  <tr>
    <td>5V<br></td>
    <td>3V3</td>
    <td>5V</td>
    <td>3V3</td>
  </tr>
  <tr>
    <td>IO10</td>
    <td>IO11</td>
    <td>TCK</td>
    <td>TXD<br></td>
  </tr>
  <tr>
    <td>IO12</td>
    <td>IO13</td>
    <td>TDI</td>
    <td>RXD</td>
  </tr>
  <tr>
    <td>IO14</td>
    <td>IO15</td>
    <td>TDO</td>
    <td>DTR</td>
  </tr>
  <tr>
    <td>IO16</td>
    <td>IO17</td>
    <td>TMS</td>
    <td>RTS</td>
  </tr>
</tbody>
</table>
