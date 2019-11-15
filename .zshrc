bindkey -e
bindkey -s '^S' 'tmux a || tmux\n'

alias ls='ls --color -F'
alias reload='source $HOME/.zshrc'
alias q='exit'

export EDITOR='emacsclient -t'
export ALTERNATE_EDITOR=

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt share_history
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt correct
setopt ignore_eof
setopt no_flow_control
setopt interactive_comments

autoload -U compinit && compinit
zstyle ':completion:*' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end

autoload -U vcs_info
setopt prompt_subst
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
prompt=$'\n[%~]$vcs_info_msg_0_%# '
