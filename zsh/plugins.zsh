#          _             _             _           
#  _______| |__    _ __ | |_   _  __ _(_)_ __  ___ 
# |_  / __| '_ \  | '_ \| | | | |/ _` | | '_ \/ __|
#  / /\__ \ | | | | |_) | | |_| | (_| | | | | \__ \
# /___|___/_| |_| | .__/|_|\__,_|\__, |_|_| |_|___/
#                 |_|            |___/  
#
# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk


 zinit ice depth=1; zinit light romkatv/powerlevel10k
 zinit light ali-commits/zsh-sudoSwitch
 zinit light ali-commits/zsh-abbr
 zplugin ice wait lucid atload'_zsh_autosuggest_start'; zinit light zsh-users/zsh-autosuggestions
 zinit snippet OMZ::plugins/dirhistory/dirhistory.plugin.zsh
 zinit light zsh-users/zsh-history-substring-search
#  zinit light ali-commits/zsh-commandEditor
 zinit light zsh-users/zsh-completions
 zinit light zpm-zsh/colorize
 zinit light zdharma-continuum/fast-syntax-highlighting
 zinit load zdharma-continuum/history-search-multi-word

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh


