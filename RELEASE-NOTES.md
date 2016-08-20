### Major Change

``--dr1-asic-status`` is added for checking regularly. The mining software is more stable now.


### DR-1 miner parameters description:

```sh
--dr1-cutoff-temp  
           Set DR1 overheat cut off temperature (default: 45)  
--dr1-cutoff-fan   
           Set DR1 too slow cut off fanspeed (default: 0)
--dr1-fan          
           Set fanspeed percentage for DR1, single value or range (default: LV5 )(LV1/LV2/LV3/LV4/LV5)
--dr1-clk          
           Set frequency for DR1, (default: 200) 200/250/300/400
--dr1-asic-x       
           Set asic x num (default:10)
--dr1-asic-y       
           Set asic y num (default:6)
--dr1-check-testnonce 
           Set DR1 check nonce before submit to server
--dr1-scan-serial|-S 
           [# 
               Direct serial I/O, manual port specification 
               (Linux) --dr1-scan-serial /dev/ttyUSB0 --dr1-scan-serial /dev/ttyUSB1 
               (Windows) --dr1-scan-serial //./COM5
           ]
           [# Direct serial I/O, auto-detect ports (Linux only)--dr1-scan-serial dr1:auto]
--dr1-asic-status   Set DR1 status refresh interval (default: 300 Seconds)
```

### Windows Usage

```sh
cgminer.exe --x11 -o "stratum+tcp://url:port" -u xxxx -p x --dr1-clk 400 --dr1-fan LV5 -S //./COM5
```

### Linux (Ubuntu) Usage

```sh
./cgminer --x11 -o "stratum+tcp://url:port" -u xxx -p x --dr1-clk 400 --dr1-fan LV5 -S /dev/ttyUSB0
```

### Raspberry Pi Usage

Pi DEPENDENCIES :
curl dev library 
(``sudo apt-get install libcurl4-openssl-dev``)

curses dev library
(``sudo apt-get install libncurses5-dev``)

Usage:
```sh
./cgminer --x11 -o "stratum+tcp://url:port" -u xxx -p x --dr1-clk 400 --dr1-fan LV5 -S /dev/ttyUSB0
```

### SHA-1 Checksum

```
2669d2eb9251ed5c3bb8227e1e59c68834a10092  ./cgminer-dr1-pi.zip
b678f2c01ce35a387288bdec4b128cd1d833c5ab  ./cgminer-dr1-ubuntu32.zip
b72e7a107790fbd6458fa3af7a667bbaa23d5b87  ./cgminer-dr1-ubuntu64.zip
eaafaba6b48efad03307cd357b23bb1d6d3581db  ./cgminer-dr1-win.zip
```