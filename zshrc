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
export abbrs=~/.zsh/aliases.zsh
export plugins=~/.zsh/plugins.zsh
export config=~/.zsh/config.zsh

# source plugins file
[[ ! -f $plugins ]] && wget https://raw.githubusercontent.com/ali-commits/dotfiles/master/zsh/plugins.zsh -O $plugins
[[ ! -f $config ]] && wget https://raw.githubusercontent.com/ali-commits/dotfiles/master/zsh/config.zsh -O $config
[[ ! -f $abbrs ]] && wget https://raw.githubusercontent.com/ali-commits/dotfiles/master/zsh/aliases.zsh -O $abbrs

source $plugins
source $config
source $abbrs

# source powerleve10k theme config file
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

