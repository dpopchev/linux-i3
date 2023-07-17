# linux-i3

Configuration to distribute for `i3`.

## Quickstart

```
git clone https://github.com/dpopchev/linux-i3.git
cd linux-i3
make install
```

## Dependencies

- xss-lock
- gammastep
- setxkbmap
- xxkb
- dunst
- xrandr
- i3status
- dmenu

## Configs

Scripts in current repo log trough `_i3_logger.sh`, which directs messages to `/var/log/syslog`
and `~/.xsession-errors`.

Find `i3` live logging into `run/user/USERNAME/i3/errorlog.I3PID`.

### Laptop camera

To hard enable/disable the laptop videocamera I just load/unload its modules
runtime.

Allow users of `wheel` group to do so by `visudo` and something like:

```
...
## Same thing without a password
%wheel ALL=(ALL:ALL) NOPASSWD: /sbin/rmmod uvcvideo, /sbin/modprobe uvcvideo
...
```
