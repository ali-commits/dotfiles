#          _             _             _
#  _______| |__    _ __ | |_   _  __ _(_)_ __  ___
# |_  / __| '_ \  | '_ \| | | | |/ _` | | '_ \/ __|
#  / /\__ \ | | | | |_) | | |_| | (_| | | | | \__ \
# /___|___/_| |_| | .__/|_|\__,_|\__, |_|_| |_|___/
#                 |_|            |___/
#


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



# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
zdharma-continuum/zinit-annex-as-monitor \
zdharma-continuum/zinit-annex-bin-gem-node \
zdharma-continuum/zinit-annex-patch-dl \
zdharma-continuum/zinit-annex-rust

# Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# zsh-sudoSwitch
zinit ice depth=1 wait! silent; zinit light ali-commits/zsh-sudoSwitch

# zsh-autosuggestions
zinit ice depth=1 wait! silent atload'_zsh_autosuggest_start'; zinit light zsh-users/zsh-autosuggestions

# dirhistory
zinit ice depth=1 wait! silent; zinit snippet OMZ::plugins/dirhistory/dirhistory.plugin.zsh

# zsh-history-substring-search
zinit ice depth=1 wait! silent; zinit light zsh-users/zsh-history-substring-search

# zsh-completions
zinit ice depth=1 wait! silent; zinit light zsh-users/zsh-completions

# colorize
zinit ice depth=1; zinit light zpm-zsh/colorize

# fast-syntax-highlighting
zinit ice depth=1; zinit light zdharma-continuum/fast-syntax-highlighting

# history-search-multi-word
zinit ice depth=1 wait! silent; zinit load zdharma-continuum/history-search-multi-word

# zsh-autoswitch-virtualenv
zinit ice depth=1 wait! silent; zinit light MichaelAquilina/zsh-autoswitch-virtualenv

# zsh-abbr
zinit ice depth=1 wait! silent atload"[[ ! -f $ZPFX/.zsh-abbr-installed ]] && source $ABBRS && touch $ZPFX/.zsh-abbr-installed"; zinit light olets/zsh-abbr

zinit ice depth=1 wait! silent; zinit light felixr/docker-zsh-completion


