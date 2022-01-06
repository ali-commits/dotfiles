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
export ABBRS=~/.zsh/abbreviations.zsh
export PLUGINS=~/.zsh/plugins.zsh
export CONFIGS=~/.zsh/config.zsh
export KEYBINDINGS=~/.zsh/keybindings.zsh
export FUNCTIONS=~/.zsh/functions.zsh
export ALIASES=~/.zsh/aliases.zsh

REPO=https://raw.githubusercontent.com/ali-commits/dotfiles/master/zsh

[[ ! -f $PLUGINS ]] && wget $REPO/plugins.zsh -O $PLUGINS                 
[[ ! -f $CONFIGS ]] && wget $REPO/zsh/config.zsh -O $CONFIGS              
[[ ! -f $KEYBINDINGS ]] && wget $REPO/zsh/keybindings.zsh -O $KEYBINDINGS 
[[ ! -f $FUNCTIONS ]] && wget $REPO/zsh/functions.zsh -O $FUNCTIONS         
[[ ! -f $ABBRS ]] && wget $REPO/zsh/abbreviations.zsh -O $ABBRS           
[[ ! -f $ALIASES ]] && wget $REPO/zsh/aliases.zsh -O $ALIASES

source $PLUGINS
source $CONFIGS
source $KEYBINDINGS
source $FUNCTIONS
source $ABBRS
source $ALIASES

# source powerleve10k theme CONFIGS file
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
