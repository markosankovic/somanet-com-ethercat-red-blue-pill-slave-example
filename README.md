SOMANET COM EtherCAT Red Blue Pill Slave Example
================================================

How to run
----------

    $ git clone https://github.com/markosankovic/somanet-com-ethercat-red-blue-pill-slave-example.git --depth 1
    $ git submodule update --init --recursive --depth 1
    $ xmake
    $ xrun --io sw_somanet_com_ethercat_red_blue_pill_slave_example/app_somanet_com_ethercat_red_blue_pill_slave_example/bin/app_somanet_com_ethercat_red_blue_pill_slave_example.xe

The SOMANET EtherCAT Service will output:

    SOMANET EtherCAT Service Version 2.0-dev
    EEPPROM loaded, PDI operational
