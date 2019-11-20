#show
echo
neofetch 

#######################################################
#            _             _
#  _____ __ | |_   _  __ _(_)_ __
# |_  / '_ \| | | | |/ _` | | '_ \
#  / /| |_) | | |_| | (_| | | | | |
# /___| .__/|_|\__,_|\__, |_|_| |_|
#     |_|            |___/

### install zplugin
if [ ! -d ~/.zplugin ] 
then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi
### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
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
[[ ! -f $plugins ]] && wget https://raw.githubusercontent.com/newaaa41/configs/master/zsh/plugins.zsh -O $plugins
[[ ! -f $config ]] && wget https://raw.githubusercontent.com/newaaa41/configs/master/zsh/config.zsh -O $config
[[ ! -f $abbrs ]] && wget https://raw.githubusercontent.com/newaaa41/configs/master/zsh/aliases.zsh -O $abbrs

source $plugins
source $config
source $abbrs

# source powerleve10k theme config file
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
