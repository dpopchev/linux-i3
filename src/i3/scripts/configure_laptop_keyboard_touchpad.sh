#!/usr/bin/env bash

# uncomment function bodies and double check device id
# concrete calls are ignored via gitignore filter found in attributes

disable_touchpad_middle_button_click () {
    xinput set-button-map $1 1 0 3 4 5 6 7
}

disable_inertial_scrolling () {
}

disable_touchpad_clicking () {
}

disable_touchpad_while_typing () {
    syndaemon -i 0.5 -K -R &
}

synaptics_id=$(xinput list | sed -rn '/Synaptics/s/.*id=([0-9]+).*/\1/p')
[[ -z $synaptics_id ]] && exit 1
disable_touchpad_middle_button_click $synaptics_id
disable_inertial_scrolling $synaptics_id
disable_touchpad_clicking  $synaptics_id
disable_touchpad_while_typing
