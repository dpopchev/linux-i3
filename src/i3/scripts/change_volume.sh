#!/usr/bin/env bash

MAX_LIMIT=130

action=$1
delta=$2

get_volume() {
    local volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+\%' | sort -u)
    echo "${volume%\%}"
}

make_delta() {
    local action=$1
    local delta=$2

    if [[ $action == 'set' ]]; then
        echo "$delta%"
        return
    fi

    if [[ $action == 'decrease' ]]; then
        echo "-$delta%"
        return
    fi

    if [[ $(get_volume) -ge $MAX_LIMIT ]]; then
        echo "+0%"
        return
    fi

    echo "+$delta%"
    return
}

delta=$(make_delta $action $delta)

pactl set-sink-volume @DEFAULT_SINK@ $delta

volume=$(get_volume)
notify-send "Volume: $volume%" -h int:value:$volume -h string:synchronous:volume
