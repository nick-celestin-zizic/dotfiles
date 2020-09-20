PS1='%F{205}[%f%F{112}%~% %f%F{205}]%f '

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

alias ls="ls --color=auto"
alias vim="nvim"
alias c="clear;"

ufetch

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
