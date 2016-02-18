#!/bin/bash

setup_leds(){
    echo none > /sys/class/leds/led0/trigger
    echo none > /sys/class/leds/led1/trigger
    echo 0 > /sys/class/leds/led0/brightness
    echo 0 > /sys/class/leds/led1/brightness
    return 1
}

set_leds_green(){
    echo 1 > /sys/class/leds/led0/brightness
    echo 0 > /sys/class/leds/led1/brightness
}

set_leds_red(){
    echo 0 > /sys/class/leds/led0/brightness
    echo 1 > /sys/class/leds/led1/brightness
}

setup_leds

while true; do
    if ps -ef | grep zerousb.sh | grep -v grep | \
        grep zerousb.sh > /dev/null; then 
        set_leds_red
    else
        set_leds_green
    fi
    sleep 5
done
