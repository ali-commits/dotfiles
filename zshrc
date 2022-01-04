# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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


[[ ! -f $PLUGINS ]] && wget https://raw.githubusercontent.com/ali-commits/dotfiles/master/zsh/plugins.zsh -O $PLUGINS
[[ ! -f $CONFIGS ]] && wget https://raw.githubusercontent.com/ali-commits/dotfiles/master/zsh/config.zsh -O $CONFIGS
[[ ! -f $ABBRS ]] && wget https://raw.githubusercontent.com/ali-commits/dotfiles/master/zsh/aliases.zsh -O $ABBRS

source $PLUGINS
source $CONFIGS
source $ABBRS



# source powerleve10k theme CONFIGS file
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
