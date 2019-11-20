#######################################################
#                   __ _
#   ___ ___  _ __  / _(_) __ _
#  / __/ _ \| '_ \| |_| |/ _` |
# | (_| (_) | | | |  _| | (_| |
#  \___\___/|_| |_|_| |_|\__, |
#                        |___/

export VISUAL=vim
export PATH=$HOME/.bin:/usr/local/bin:$PATH
setopt  autocd autopushd 
setopt inc_append_history # To save every command before it is executed 
setopt share_history # setopt inc_append_history

export SAVEHIST=10000
export HISTSIZE=10000
export HISTFILE=~/.zsh_history

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _match _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select
zstyle :compinstall filename '/home/ali/.zshrc'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:cd:*' ignore-parents parent pwd
autoload -Uz compinit
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
# End of lines added by compinstall

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=1 #async auto suggestions
fast-theme -q zdharma # set theme for fast-theme-auto-highlight plugin

# key bindings for history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey -s ';;' '\e' # exit from viins to vicmd (normal mode) using ;;

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history


### functions 
take() # create dirctory and cd to it
{ 
        mkdir $1 && cd $1
}
 
chpwd() colorls
