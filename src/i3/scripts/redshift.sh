# gammastep is live alternative to redshift
# they share the same CLI API

source ~/.config/i3/scripts/_i3_logger.sh

CONFIG=~/.config/redshift.conf
CMD_CANDIDATES=(gammastep redshift)

unset shift_cmd
for candidate in "${CMD_CANDIDATES[@]}"; do
    if [ -x "$(command -v $candidate)" ]; then
        shift_cmd=$candidate
        break
    fi
done

${shift_cmd} -c ${CONFIG}
