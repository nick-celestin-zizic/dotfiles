PS1='%F{205}[%f%F{112}%~% %f%F{205}]%f '

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# autocomplete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

#vim bindings
bindkey -v
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
export KEYTIMEOUT=1

alias ls="ls -a --color=auto"
alias vim="nvim"
alias c="clear;"
alias off="shutdown now"

ufetch

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
