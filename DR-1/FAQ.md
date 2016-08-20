## Frequently Asked Questions


### Is power supply included in the package?

No. A power supply unit is not included, and you will need to provide an ATX PSU. There are 2 PCI-e connectors for +12V DC input and both of them are required. You can use either PCI-e 6 Pin or 8 Pin. A 500 watts PSU would be good enough for powering our miners up.

### Is the Raspberry Pi required for running? 

No. The mining software could run on Windows, Linux (Ubuntu) and [Raspbian](http://www.raspbian.org/) on Raspberry Pi. Raspberry Pi is not required, but it may be easier to set up and consumes less power if you need to run the miner 24/7.

### Could I use a cgminer downloaded from somewhere other than this repo?

No. You can only use the binaries provided by us to mining X11 coins. The current binary we are using is forked from cgminer and custom-made to be able to talk with our miners. Downloading from other sources won't have the code we added. 

### Could I use the Ethernet port to connect the miner?

No. You cannot do that now. That port is reserved for a future module we're planing to release. The current Ethernet port won't do anything.

### Where shall I connect with the miner?

You will use the port besides the Ethernet port which is a [USB Type B port](http://pcsupport.about.com/od/termsu/a/usb-type-b.htm) for connecting to your Rasperry Pi or computer.

### What if I disconnect the USB connector while running, will the miner still continue mine?

No. The miner would stop mining because it needs the mining software to send/receive jobs from the network. It's strongly discouraged for users to disconnect the device while it is actively mining.
