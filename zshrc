# show
# neofetch 

#######################################################
#            _             _
#  _____ __ | |_   _  __ _(_)_ __
# |_  / '_ \| | | | |/ _` | | '_ \
#  / /| |_) | | |_| | (_| | | | | |
# /___| .__/|_|\__,_|\__, |_|_| |_|
#     |_|            |___/

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
### Added by Zplugin's installer
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zplugin installer's chunk


#######################################################
#  ___  ___  _   _ _ __ ___ ___ 
# / __|/ _ \| | | | '__/ __/ _ \
# \__ \ (_) | |_| | | | (_|  __/
# |___/\___/ \__,_|_|  \___\___|
#

### check if the resource file exist
[ ! -d ~/.zsh ] && mkdir ~/.zsh
### define variables for the resource files
export ABBRS=~/.zsh/aliases.zsh
export PLUGINS=~/.zsh/plugins.zsh
export CONFIGS=~/.zsh/config.zsh

# source $PLUGINS file
[[ ! -f $PLUGINS ]] && wget https://raw.githubusercontent.com/ali-commits/dotfiles/master/zsh/$$PLUGINS.zsh -O $$PLUGINS
[[ ! -f $CONFIGS ]] && wget https://raw.githubusercontent.com/ali-commits/dotfiles/master/zsh/CONFIGS.zsh -O $CONFIGS
[[ ! -f $ABBRS ]] && wget https://raw.githubusercontent.com/ali-commits/dotfiles/master/zsh/aliases.zsh -O $ABBRS

source $PLUGINS
source $CONFIGS
source $ABBRS

# source powerleve10k theme CONFIGS file
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

