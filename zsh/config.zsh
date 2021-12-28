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

export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim

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
# zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*:match:*' original only

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 

zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
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


WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word


# Offer to install missing package if command is not found
if [[ -r /usr/share/zsh/functions/command-not-found.zsh ]]; then
    source /usr/share/zsh/functions/command-not-found.zsh
    export PKGFILE_PROMPT_INSTALL_MISSING=1
fi

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

#_comp_options+=(globdots)		# Include hidden files.


# Arch Linux command-not-found support, you must have package pkgfile installed
# https://wiki.archlinux.org/index.php/Pkgfile#.22Command_not_found.22_hook
[[ -e /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh

# Advanced command-not-found hook
[[ -e /usr/share/doc/find-the-command/ftc.zsh ]] && source /usr/share/doc/find-the-command/ftc.zsh


#######################################################################
#  _                                    
# | | _____ _   _ _ __ ___   __ _ _ __  
# | |/ / _ \ | | | '_ ` _ \ / _` | '_ \ 
# |   <  __/ |_| | | | | | | (_| | |_) |
# |_|\_\___|\__, |_| |_| |_|\__,_| .__/ 
#           |___/                |_|    

# key bindings for history-substring-search

bindkey -e

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey ";s" sudoSwitch 
bindkey "\e\e" sudoSwitch 

bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                      # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action



# bindkey -M vicmd 'k'  history-substring-search-up
# bindkey -M vicmd 'j'  history-substring-search-down
# bindkey -M viins ';;' vi-cmd-mode                               # exit from viins to vicmd (normal mode) using ;;
# bindkey -M viins ';d' kill-whole-line
# bindkey -M vicmd "J"  beginning-of-line
# bindkey -M vicmd "K"  end-of-line

# bindkey ";h" history-incremental-pattern-search-backward

# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history

#######################################################################
#   __                  _   _                 
#  / _|_   _ _ __   ___| |_(_) ___  _ __  ___ 
# | |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
# |  _| |_| | | | | (__| |_| | (_) | | | \__ \
# |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
#                                             

### functions 
take() # create dirctory and cd to it
{ 
        mkdir $1 && cd $1
}
# auto list dirs (with colorls) when cd to directory 
if  command -v colorls &> /dev/null
then
    chpwd() colorls --group-directories-first
else
    chpwd() ls
fi


# history
hist()
{
my_var=$1
if [ -z "$my_var" ]
then
      cat ~/.zsh_history 
else
      cat ~/.zsh_history | grep -i $1
fi

}

