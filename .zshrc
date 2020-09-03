# Luke's (modified) config

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%F{yellow}%~ %(?.%F{blue}:).%F{red}:() %F{magenta}%# %f%b"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use ctrl-vim keys in tab complete menu:
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history

# aliases
alias ls="ls -FNh --color=auto --group-directories-first"
alias o="xdg-open"
alias starwars="telnet towel.blinkenlights.nl"

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
