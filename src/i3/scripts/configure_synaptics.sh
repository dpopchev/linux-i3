#!/usr/bin/env bash

synaptics_id=$(xinput list | sed -rn '/Synaptics/s/.*id=([0-9]+).*/\1/p')
[[ -z $synaptics_id ]] && exit 1
xinput set-prop $synaptics_id 'Synaptics ClickPad' 0
xinput set-prop $synaptics_id 'Synaptics Tap Action' 0 0 0
xinput set-prop $synaptics_id 'Synaptics Palm Detection' 1
xinput set-prop $synaptics_id 'Synaptics Palm Dimensions' 5 5
xinput set-prop $synaptics_id 'Synaptics Coasting Speed' 0 0
xinput set-prop $synaptics_id 'Synaptics Gestures' 0
xinput set-button-map $synaptics_id 1 0 3 4 5 6 7
syndaemon -i 0.5 -K -R -d

