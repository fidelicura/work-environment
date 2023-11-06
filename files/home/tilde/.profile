# {{ AUTOSTART XORG }}
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
# {{ AUTOSTART XORG }}



# {{ ENVIRONMENT SOURCE }}
source "$HOME/.own/rust/cargo/env"
# {{ ENVIRONMENT SOURCE }}
