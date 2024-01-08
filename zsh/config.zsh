#######################################################################
#                   __ _
#   ___ ___  _ __  / _(_) __ _
#  / __/ _ \| '_ \| |_| |/ _` |
# | (_| (_) | | | |  _| | (_| |
#  \___\___/|_| |_|_| |_|\__, |
#                        |___/

if [ -d "$HOME/.local/bin" ]; then
    export PATH=$HOME/.local/bin:$PATH
fi
if [ -d "/opt/anaconda/bin/" ]; then
    export PATH=/opt/anaconda/bin/:$PATH
fi
if [ -d "$HOME/.bin" ]; then
    export PATH=$HOME/.bin:$PATH
fi
if [ -d "$HOME/.cargo/bin/navi" ]; then
    export PATH=$HOME/.cargo/bin/navi:$PATH
fi



export VISUAL=/usr/bin/nvim
export EDITOR=/usr/bin/nvim

## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt notify                                                   # report the status of background jobs immediately
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt nobeep                                                   # No beep

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus


setopt autocd                                                   # change dirictories without ch ( directory name only ) 
setopt inc_append_history                                       # To save every command before it is executed 
setopt share_history                                            # share history between sesions 

export SAVEHIST=10000
export HISTSIZE=10000
export HISTFILE=~/.zhistor

ZSH_AUTOSUGGEST_STRATEGY=(history completion )
ZSH_AUTOSUGGEST_USE_ASYNC=1 #async auto suggestions

# hide EOL sign ('%')
PROMPT_EOL_MARK=""

fast-theme -q default # set theme for fast-theme-auto-highlight plugin

#######################################################################
#              _                                  _      _       
#   __ _ _   _| |_ ___   ___ ___  _ __ ___  _ __ | | ___| |_ ___ 
#  / _` | | | | __/ _ \ / __/ _ \| '_ ` _ \| '_ \| |/ _ \ __/ _ \
# | (_| | |_| | || (_) | (_| (_) | | | | | | |_) | |  __/ ||  __/
#  \__,_|\__,_|\__\___/ \___\___/|_| |_| |_| .__/|_|\___|\__\___|
#                                          |_|                   

zstyle ':completion:*' completer _complete _match _approximate  

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 

zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/2))numeric)'
zstyle ':completion:*' menu select
zstyle ':completion:*' file-sort time
zstyle :compinstall filename '/home/ali/.zshrc'

zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zcache

autoload -Uz compinit
zmodload zsh/complist
compinit

autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"                      # pipx completion

WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word



# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R



