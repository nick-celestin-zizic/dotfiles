PS1='%F{205}[%f%F{112}%2~%f%F{205}]%f '

HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history

# adding stuff to PATH
export PATH=~/Programming/Odin/Compiler:~/.local/bin:$PATH
export PATH=~/.guix-profile/bin:$PATH
GUIX_PROFILE="/home/big/.config/guix/current"
. "$GUIX_PROFILE/etc/profile"

#FZF
export FZF_DEFAULT_COMMAND='find ~'

# autocomplete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vim bindings
bindkey -v
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# aliases
alias ls="ls -a --color=auto"
alias c="clear"
alias off="sudo shutdown now"
alias inf202="ssh -i ~/.ssh/Nick_Zizic_INF_202 nzizic@myinf202.eastus.cloudapp.azure.com"
alias dzen="dzen2 -p 1 -h 30 -bg #222222 -fg #FFFFFF -fn firacode"
alias trim="find ./ -name \"*.png\" -exec convert {} -trim {} \;"

function mkcd() {
    mkdir $1
    cd $1
}
function commit() {
    git add -A && git commit -m $1
}
function commit!(){
    git add -A && git commit -m $1 && git push
}
function dzenmsg(){
    # I have no clue why I can't just use the dzen alias here.
    echo $1 | dzen2 -p 1 -h 30 -bg \#222222 -fg \#FFFFFF -fn firacode
}

# startup 
ufetch

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source ~/Programming/C/emsdk/emsdk_env.sh &>/dev/null
