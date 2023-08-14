#!/usr/bin/env bash

synaptics_id=$(xinput list | sed -rn '/Synaptics/s/.*id=([0-9]+).*/\1/p')
[[ -z $synaptics_id ]] && exit 1
xinput set-prop $synaptics_id 'Synaptics Palm Detection' 1
xinput set-prop $synaptics_id 'Synaptics Coasting Speed' 0 0
syndaemon -i 0.5 -K -R -d
