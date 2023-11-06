# {{ TTY }}
if [[ "$(tty)" == "/dev/tty1" ]]; then
    exec startx
fi
# {{ TTY }}



# {{ ENVIRONMENT SOURCE }}
source "$HOME/.own/rust/cargo/env"
# {{ ENVIRONMENT SOURCE }}
