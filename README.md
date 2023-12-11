# linux-i3

`i3` window manager configuration.

## Installation

### Requirements

- bash
- i3status
- xss-lock
- imagemagic: import, convert
- i3lock
<!-- - gammastep -->
<!-- - setxkbmap -->
<!-- - xxkb -->
<!-- - dunst -->
<!-- - xrandr -->
<!-- - i3status -->
<!-- - dmenu -->

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

Find `i3` live logging into `run/user/USERNAME/i3/errorlog.I3PID`.

### Setup

#### Laptop camera

To hard enable/disable the laptop videocamera I just load/unload its modules
runtime.

Allow users of `wheel` group to do so by `visudo` and something like:

```
...
## Same thing without a password
%wheel ALL=(ALL:ALL) NOPASSWD: /sbin/rmmod uvcvideo, /sbin/modprobe uvcvideo
...
```
