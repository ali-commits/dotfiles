# ~/.zsh/aliases.zsh
# General aliases (uses cmd_alias from functions.zsh for conditional aliases)

###############################################################################
#                         Colors
###############################################################################
alias ip='ip --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='diff --color=auto'

###############################################################################
#                         Modern Replacements
###############################################################################
# Only create if modern alternatives are installed
# eza is the maintained fork of exa; prefer it when available
if (( $+commands[eza] )); then
    alias ls='eza'              # Modern ls replacement
elif (( $+commands[exa] )); then
    alias ls='exa'
fi
cmd_alias top 'btm'             # bottom: Better system monitor
cmd_alias ps 'procs'            # Modern ps replacement
cmd_alias vi 'nvim'             # neovim
cmd_alias vim 'nvim'            # neovim

###############################################################################
#                         Python Aliases
###############################################################################
alias python='python3'
alias pip='pip3'

###############################################################################
#                         Less Options
###############################################################################
alias less='less -R'            # Raw control characters
alias more='less'               # Nobody should use more
