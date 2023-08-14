#!/usr/bin/env bash

# uncomment function bodies and double check device id
# concrete calls are ignored via gitignore filter found in attributes

disable_touchpad_middle_button_click () {
    # xinput set-button-map 12 1 0 3 4 5 6 7
}

disable_inertial_scrolling () {
    # xinput set-prop 11 337 0 0
}

disable_touchpad_clicking () {
    # xinput set-prop 11 330 0 0 0
}

disable_touchpad_while_typing () {
    syndaemon -i 0.5 -K -R &
}

disable_touchpad_middle_button_click
disable_inertial_scrolling
disable_touchpad_clicking
disable_touchpad_while_typing
