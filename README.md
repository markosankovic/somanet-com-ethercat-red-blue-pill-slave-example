SOMANET COM EtherCAT Red Blue Pill Slave Example
================================================

This is the EtherCAT slave example program for [SOMANET CORE C22](https://doc.synapticon.com/hardware/core-c22/revision-a5/index.html) and [SOMANET COM EtherCAT](https://doc.synapticon.com/hardware/com-ethercat/revision-a4/index.html) stack from [Synapticon](https://www.synapticon.com/).

This program receives PDO named "Offered pill" from master and according to its value turns the C22 LED to either red or blue.

How to run
----------

You must install the [xTIMEcomposer tools](https://www.xmos.com/support/tools) and have xmake and xrun binaries in PATH.

    $ git clone https://github.com/markosankovic/somanet-com-ethercat-red-blue-pill-slave-example.git --depth 1
    $ git submodule update --init --recursive --depth 1
    $ xmake
    $ xrun --io sw_somanet_com_ethercat_red_blue_pill_slave_example/app_somanet_com_ethercat_red_blue_pill_slave_example/bin/app_somanet_com_ethercat_red_blue_pill_slave_example.xe

The SOMANET EtherCAT Service will output:

    SOMANET EtherCAT Service Version 2.0-dev
    EEPPROM loaded, PDI operational

Once the slave node starts to receive the PDO data from master, the EtherCAT Service will output:

    Red pill offered.
    Blue pill offered.
