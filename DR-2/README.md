### Manual

DR-2 mining device can be configured and managed via web user interface instead of CLI. It is easier and simpler for users who is not a big fan of commands in terminals. 

By following the steps below, DR-2 can be easily setup to work.

Note: For each machine, the default private IP address is set to be ``192.168.1.200``.

* If your router in your network is set within the range of ``192.168.1.*``(e.g. ``192.168.1.1``), simply plug in the miner, and connect an Ethernet cable to your router directly.

  * Visit ``http://192.168.1.200`` with a modern web browser (Google Chrome Recommended) from a computer connected to the same network, and use the default password ``admin`` to log in. The password ``admin`` is all lowercase. 

* If your router isn't within the network as ``192.168.1.1``, there are two options to make it work:

  * 1. Reconfigure your router to be ``192.168.1.1``
  * 2. Reconfigure your DR-2's IP address
    * Change your computer's private IP address to be ``192.168.1.5``, subnet mask ``255.255.255.0``, leave the gateway IP blank. Then connect the miner to your computer directly via an Ethernet cable. 
    * Visit ``http://192.168.1.200`` since you're on the same network now. Once you are able to get access to the web interface of DR-2, simply click on ``Network Configure``, and modify the IP address of the Miner to whatever you want. 

*PLEASE BE VERY CAREFUL HERE*. Any misconfigure may result in making your miner inaccessible.

* In ``Pool Configure`` section, you can set up the username and password for mining and mineral pools address.
Mining pool address format should be ``IP:port`` (e.g ``mine pool.in:7903``). Click ``apply``, your miner will start mining automatically in 10 seconds.
* In ``ASIC Status`` section, the working status for the chips will be displayed.
