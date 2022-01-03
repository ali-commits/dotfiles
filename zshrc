# show
# neofetch 




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

