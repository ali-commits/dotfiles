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
if [ ! -d ~/.zsh ]
then
  mkdir ~/.zsh
fi

### define variables for the resource files
export abbr=~/.zsh/aliases.zsh
export plugins=~/.zsh/plugins.zsh
export config=~/.zsh/config.zsh

# source plugins file
if [ -f $plugins ] 
then
  source $plugins
else
  wget https://raw.githubusercontent.com/newaaa41/configs/master/zsh/plugins.zsh -O $plugins
  source $plugins
fi

# source config file
if [ -f $config ] 
then
  source $config
else
  wget https://raw.githubusercontent.com/newaaa41/configs/master/zsh/config.zsh -O $config
  source $config
fi

# source abbrevations and aliases file
if [ -f $abbr ] 
then
  source $abbr
else
  wget https://raw.githubusercontent.com/newaaa41/configs/master/zsh/aliases.zsh -O $abbr
  source $abbr
fi

# source powerleve10k theme config file
source ~/.p10k.zsh
