# change backlight using available command

source ~/.config/i3/scripts/_i3_logger.sh

CMD_CANDIDATES=(brightnessctl xbacklight)

unset backlight_cmd
for candidate in "${CMD_CANDIDATES[@]}"; do
    if [ -x "$(command -v $candidate)" ]; then
        backlight_cmd=$candidate
        break
    fi
done

case "$1" in
    up) $backlight_cmd s 5%+;;
    down) $backlight_cmd s 5%-;;
    half) $backlight_cmd s 50%;;
    full) $backlight_cmd s 100%;;
    *) log_unhandled $backlight_cmd "did not manage subcmd" "$1";;
esac
