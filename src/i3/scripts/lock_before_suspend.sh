#!/usr/bin/env bash

source ~/.config/i3/scripts/_i3_logger.sh

if pgrep -f xss-lock; then
    log_handled 'xss-lock detected'

    killall -SIGUSR1 xss-lock

    if [[ $? -eq 0 ]]; then
        log_handled 'xss-lock killed'
    else
        log_unhandled 'xss-lock NOT killed'
    fi
fi

xss-lock --transfer-sleep-lock -- bash ~/.config/i3/scripts/lock.sh
