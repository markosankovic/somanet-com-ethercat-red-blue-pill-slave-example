#include <CORE_C22-rev-a.bsp>
#include <COM_ECAT-rev-a.bsp>

#include <platform.h>
#include <print.h>
#include <xs1.h>

#include <ethercat_service.h>

EthercatPorts ethercat_ports = SOMANET_COM_ETHERCAT_PORTS;

on tile[1]: out port ledRed = LED_RED;
on tile[1]: out port ledBlue = LED_BLUE;

static void pdo_handler(chanend pdo_out, chanend pdo_in) {

    unsigned int count;
    unsigned int offered_pill;

    timer t;
    const unsigned int delay = 100;
    unsigned int time = 0;

    while(1) {

        count = 0;
        pdo_in <: DATA_REQUEST; // Poll the channel with the command DATA_REQUEST
        pdo_in :> count; // Get the number of available data words

        if (count == 1) { // There is only one data word received from master
            pdo_in :> offered_pill; // Get "Offered pill" PDO from master
            if (offered_pill == 1) { // Turn on the red LED
                ledRed <: 0;
                ledBlue <: 1;
                printstrln("red pill offered");
            } else if (offered_pill == 2) { // Turn on the blue LED
                ledRed <: 1;
                ledBlue <: 0;
                printstrln("blue pill offered");
            } else { // Offered pill is not recognized
                ledRed <: 0;
                ledBlue <: 0;
                printstrln("suspicious pill offered");
            }
            pdo_out <: 1; // Send only one data word to master
            pdo_out <: offered_pill; // Send "Pill taken" PDO to master
        }

        t :> time;
        t when timerafter(time+delay) :> void;
    }
}

int main(void) {

    chan coe_out;
    chan coe_in;
    chan eoe_out;
    chan eoe_in;
    chan eoe_sig;
    chan foe_out;
    chan foe_in;
    chan pdo_out;
    chan pdo_in;

    par {
        on tile[0]: {
            ethercat_service(coe_out, coe_in, eoe_out, eoe_in, eoe_sig, foe_out, foe_in, pdo_out, pdo_in, ethercat_ports); // Only pdo_out and pdo_in channels are used
        }

        on tile[1]: {
            pdo_handler(pdo_out, pdo_in);
        }
    }

    return 0;
}

