# linux-i3

Configuration for `i3` window manager.

## Installation

### Requirements

- bash
- i3status
- xss-lock
- imagemagic: import, convert
- i3lock
- xrandr
- gammastep
- xclip
- xxkb
- libnotify: notify-send
- libpulse: pactl
- acpilight: xbacklight
- dmenu
- i3status
- nmcli

### Install

```
git clone https://github.com/dpopchev/linux-i3.git
cd linux-i3
make install
```

## Usage

Find `i3` logs into

- `~/.xsession-errors`
- `/run/user/$uid/i3/errlog.$pid`

### Setup

#### Laptop camera

To hard enable/disable the laptop camera I just load/unload its modules
runtime.

Allow users of `wheel` group to do so by `visudo` and something like:

```
...
## Same thing without a password
%wheel ALL=(ALL:ALL) NOPASSWD: /sbin/rmmod uvcvideo, /sbin/modprobe uvcvideo
...
```

#### Wifi connections

Users need be part of the `plugdev` group to use `nmcli` without elevating
rights.
