#!/usr/bin/env bash

LOG=~/.xsession-errors

log() {
    local status=$1; shift
    local message="i3 event $status: $*"
    logger $message
    echo $message >> $LOG
}

log_handled() {
    log "handled" "$*"
}

log_unhandled() {
    log "unhandled" "$*"
}
