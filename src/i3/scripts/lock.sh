#!/usr/bin/env bash

source ~/.config/i3/scripts/_i3_logger.sh

DEPS_PRESENT=~/.cache/dpopchev/verified_lock_deps

verify_dependencies() {
    if [[ -e $DEPS_PRESENT ]]; then
        return
    fi

    cmds=(import convert i3lock)
    for cmd in "${cmds[@]}"; do
        if ! command -v "$cmd" > /dev/null; then
            log_unhandled $cmd "does not exist"
            exit 1
        fi
    done

    mkdir -p $(dirname $DEPS_PRESENT)
    touch $DEPS_PRESENT
    return
}

make_temp_image() {
    mktemp /tmp/lock_bg_XXXXXX.png
}

make_screenshot() {
    import -window root "$1"
}

pixelate_screenshot() {
    convert "$1" -scale 10% -scale 1000% "$1"
}

blur_screenshot() {
    convert "$1" -blur 2,5 "$1"
}

verify_dependencies

background=$(make_temp_image)
make_screenshot $background
pixelate_screenshot $background

i3lock --show-failed-attempts --nofork --image $background

trap 'rm -f $background' EXIT
