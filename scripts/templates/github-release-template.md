## Installation

Download one of the releases from the [release page](https://github.com/PinIdea/ASIC-X11-Miner/releases/) directly.

See the install [docs](https://github.com/PinIdea/ASIC-X11-Miner/) for more install options and instructions.

## Usage

### Windows Usage

```console
$ cgminer.exe --x11 -o "stratum+tcp://url:port" -u xxxx -p x \
--dr1-clk 400 --dr1-fan LV3 -S //./COM5
```

USB miner usage:
```console
$ cgminer.exe --x11 -o "stratum+tcp://url:port" -u xxxx -p x --dr1-clk 200 --dr1-fan LV3  -S //./COM352 --du1
```

### Linux (Ubuntu) Usage
curl curses dev library 

```console
$ sudo apt-get install -y libcurl4-openssl-dev libncurses5-dev

```

```console
$ cgminer --x11 -o "stratum+tcp://url:port" -u xxx -p x \
--dr1-clk 400 --dr1-fan LV3 -S /dev/ttyUSB0
```
USB Usage:
```console
$ ./cgminer --x11 -o "stratum+tcp://url:port" -u xxx -p x --dr1-clk 400 --dr1-fan LV3 -S /dev/ttyUSB0 --du1 
```

### Raspberry Pi Usage

Pi DEPENDENCIES:

curl curses dev library 

```console
$ sudo apt-get install -y libcurl4-openssl-dev libncurses5-dev

```

Usage:
```console
$ cgminer --x11 -o "stratum+tcp://url:port" \
                -u xxx -p x --dr1-clk 400 \
                --dr1-fan LV3 -S /dev/ttyUSB0
```

USB Usage:
```console
$ ./cgminer --x11 -o "stratum+tcp://url:port" -u xxx -p x --dr1-clk 400 --dr1-fan LV3 -S /dev/ttyUSB0 --du1 
```

### Parameters for cgminer added by PinIdea

| Parameter                 | Description                                           |
| ------------------------- | ----------------------------------------------------- |
| ``--dr1-cutoff-temp``     | Set DR1 overheat cut off temperature (default: 45)    |
| ``--dr1-cutoff-fan``      | Set DR1 too slow cut off fanspeed (default: 0)        |
| ``--dr1-clk``             | Set frequency for DR1, (default: 200) 200/250/300/400 |
| ``--dr1-asic-x``          | Set asic x num (default:10)                           |
| ``--dr1-asic-y``          | Set asic y num (default:6)                            |
| ``--dr1-check-testnonce`` | Set DR1 check nonce before submit to server           |
| ``--dr1-scan-serial|-S``  | 1. Direct serial I/O, manual port specification <br/>(Linux) <br/>``--dr1-scan-serial /dev/ttyUSB0 --dr1-scan-serial /dev/ttyUSB1`` <br/>(Windows) <br/> ``--dr1-scan-serial //./COM5`` <br/>2. Direct serial I/O, auto-detect ports <br/>(Linux only)<br/> ``--dr1-scan-serial dr1:auto`` |
| ``--dr1-asic-status``     | Set DR1 status refresh interval (default: 300 Seconds)|
| ``--dr1-fan``             | Set fanspeed percentage for DR1, single value or range (default: LV3 )(LV1/LV2/LV3) |
|``--du1``           |Just for miniusb mining,if set minidr will auto ignore --dr1-asic-x --dr1-asic-y --dr1-cutoff-temp --drl-cutoff-fan|

## Changelog

*Edit the changelog below by hand*

{{CHANGELOG}}

## Checksums

{{CHECKSUM}}

