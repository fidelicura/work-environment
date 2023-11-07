# {{ INTERACTIVE }}
[[ $- != *i* ]] && return
# {{ INTERACTIVE }}



# {{ PROMPT }}
PS1="\n[#] \w [>] "
# {{ PROMPT }}



# {{ VARIABLES }}
source ~/.bash_profile
# {{ VARIABLES }}



# {{ ALIASES }}
alias h="hx"
alias cc="clang"
alias ll="ls -lA"
alias py="python3"
alias ls="ls --color"
alias xdg-open="handlr open"
alias xclip="xclip -selection c"
# {{ ALIASES }}



# {{ FUNCTIONS }}
function cd() { command cd "$@"; ls; }
function clear() { command clear; ufetch; echo; ls; }

function bashclear() {
    history -c && history -w;
    clear;
    printf "\n[$] > Bash history cleared.\n";
}

function screenrec() {
    ffmpeg -f x11grab -i :0.0 $HOME/documents/videos/$(date "+%Y-%m-%d_%H-%M-%S").mkv
}

function sus() {
    local args="$@";
    su -c "$args"
}
 
function f() {
  local filepath=$(find $HOME | fzf)
  local filetype=$(file --mime-type -b "$filepath")

  if [[ $filetype == text/* ]]; then
      hx "$filepath"
  elif [[ $filetype == video/* ]]; then
      ffplay "$filepath"
  else
      echo -e "[$] > Unsupported \`$filetype\` filetype!\n"
  fi
}

function notes() {
    local stamp="$(date +'%Y-%m-%d')"

    pushd $HOME/documents/notes

    git add . &&
    git commit -m "[script] $stamp" &&
    git push

    popd
}

function look() {
    pushd $HOME/documents/notes/content
    glow
    popd
}
# {{ FUNCTIONS }}



# {{ ON STARTUP }}
clear
# {{ ON STARTUP }}
. "/home/fidelicura/.own/rust/cargo/env"
