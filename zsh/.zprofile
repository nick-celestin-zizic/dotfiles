GUIX_PROFILE="/home/big/.config/guix/current"
. "$GUIX_PROFILE/etc/profile"

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
