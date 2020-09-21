#######################################################################
#                   __ _
#   ___ ___  _ __  / _(_) __ _
#  / __/ _ \| '_ \| |_| |/ _` |
# | (_| (_) | | | |  _| | (_| |
#  \___\___/|_| |_|_| |_|\__, |
#                        |___/

export PATH=$HOME/.bin:/usr/local/bin:$HOME/.gem/ruby/2.7.0/bin:/root/.gem/ruby/2.7.0/bin:/var/lib/snapd/snap/bin:$PATH
export VISUAL=vim
export EDITOR=vim
setopt autocd #change dirictories without ch ( directory name only ) 
setopt inc_append_history # To save every command before it is executed 
setopt share_history # share history between sesions 
setopt beep 

export SAVEHIST=10000
export HISTSIZE=10000
export HISTFILE=~/.zsh_history

ZSH_AUTOSUGGEST_STRATEGY=(history completion )
ZSH_AUTOSUGGEST_USE_ASYNC=1 #async auto suggestions

fast-theme -q default # set theme for fast-theme-auto-highlight plugin

#######################################################################
#              _                                  _      _       
#   __ _ _   _| |_ ___   ___ ___  _ __ ___  _ __ | | ___| |_ ___ 
#  / _` | | | | __/ _ \ / __/ _ \| '_ ` _ \| '_ \| |/ _ \ __/ _ \
# | (_| | |_| | || (_) | (_| (_) | | | | | | |_) | |  __/ ||  __/
#  \__,_|\__,_|\__\___/ \___\___/|_| |_| |_| .__/|_|\___|\__\___|
#                                          |_|                   

zstyle ':completion:*' completer _complete _match _approximate #_correct 
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
zstyle ':completion:*' menu select
zstyle ':completion:*' file-sort time
zstyle :compinstall filename '/home/ali/.zshrc'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:cd:*' ignore-parents parent pwd
autoload -Uz compinit
zmodload zsh/complist
compinit
#_comp_options+=(globdots)		# Include hidden files.

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

#######################################################################
#  _                                    
# | | _____ _   _ _ __ ___   __ _ _ __  
# | |/ / _ \ | | | '_ ` _ \ / _` | '_ \ 
# |   <  __/ |_| | | | | | | (_| | |_) |
# |_|\_\___|\__, |_| |_| |_|\__,_| .__/ 
#           |___/                |_|    

# key bindings for history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey -M vicmd 'k'  history-substring-search-up
bindkey -M vicmd 'j'  history-substring-search-down
bindkey -M viins \^U  kill-whole-line
#bindkey -M viins \^I  backward-kill-word
bindkey -M viins ';;' vi-cmd-mode # exit from viins to vicmd (normal mode) using ;;
bindkey -M viins ';d' backward-kill-line
bindkey -M vicmd "J"  beginning-of-line
bindkey -M vicmd "K"  end-of-line
bindkey -M vicmd ";s" sudoSwitch 
bindkey -M viins ";s" sudoSwitch 

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
# auto ls (with colorls) when cd to directory 
chpwd() colorls --group-directories-first

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
