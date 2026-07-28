# ~/.zsh/plugins.zsh
# Plugin manager (zinit) initialization, plugins, and plugin configuration

###############################################################################
#                         Zinit Installation Check
###############################################################################
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing Zinit...%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

# Source zinit
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load essential annexes
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

###############################################################################
#                         Prompt
###############################################################################
# Starship prompt (config: ~/.config/starship.toml)
eval "$(starship init zsh)"

###############################################################################
#                         Essential Plugins
###############################################################################
# Zsh Completions - Additional completion definitions
zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# History Substring Search - Better history search (Up/Down arrows)
zinit ice wait lucid
zinit light zsh-users/zsh-history-substring-search

# Zsh Autosuggestions - Fish-like autosuggestions
zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

###############################################################################
#                         Directory Navigation
###############################################################################
# Directory History - Navigate directory stack (Alt+Left/Right)
zinit ice wait lucid
zinit snippet OMZ::plugins/dirhistory/dirhistory.plugin.zsh


###############################################################################
#                         Productivity Plugins
###############################################################################
# Sudo plugin - Press ESC twice (or ;s) to add/remove sudo
zinit ice lucid
zinit light ali-commits/zsh-sudoSwitch

# Auto Pairs - Auto-close quotes, brackets, etc.
zinit ice wait lucid
zinit light hlissner/zsh-autopair

# Abbreviations - expand short aliases into full commands
zinit ice lucid \
    atload"[[ ! -f $ZPFX/.zsh-abbr-installed ]] && \
    source $ABBRS && \
    touch $ZPFX/.zsh-abbr-installed"
zinit light olets/zsh-abbr

# Colorize - Colorized cat/less via pygments (ccat/cless)
zinit ice wait lucid
zinit light zpm-zsh/colorize

###############################################################################
#                         Development Tools
###############################################################################
# Docker Completions
zinit ice wait lucid as"completion"
zinit light felixr/docker-zsh-completion

###############################################################################
#                         FZF Integration
###############################################################################
# Only load if fzf is installed
if (( $+commands[fzf] )); then
    # FZF completion and key bindings (Ctrl+T, Alt+C)
    # Loaded immediately (not deferred) so atuin can claim Ctrl+R afterwards
    zinit snippet https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh

    # FZF Tab - Disabled for standard zsh menu completion
    # zinit light Aloxaf/fzf-tab

    # Forgit - Interactive git commands powered by fzf (forgit::log, forgit::add, ...)
    zinit ice wait lucid
    zinit light wfxr/forgit
fi

###############################################################################
#                         Shell Integrations
###############################################################################
# Atuin - SQLite shell history with fuzzy search and optional sync
# Takes over Ctrl+R; --disable-up-arrow keeps arrows on substring-search
# NOTE: must be initialized AFTER the fzf key-bindings snippet
(( $+commands[atuin] )) && eval "$(atuin init zsh --disable-up-arrow)"

# Zoxide - Smarter cd: `z foo` jumps to frecent directories, `zi` for fzf picker
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"

# Direnv - Auto-load per-project .envrc files on cd
(( $+commands[direnv] )) && eval "$(direnv hook zsh)"

###############################################################################
#                         Syntax Highlighting (load last)
###############################################################################
# Fast Syntax Highlighting - Real-time syntax highlighting
zinit ice wait lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    atload"fast-theme -q default"
zinit light zdharma-continuum/fast-syntax-highlighting

###############################################################################
#                         Plugin Configuration
###############################################################################
# Autosuggestions configuration
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080"

# History Substring Search configuration
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=green,fg=white,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'
export HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='i'
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# Fast Syntax Highlighting configuration
typeset -gA FAST_HIGHLIGHT
FAST_HIGHLIGHT[use_brackets]=1
FAST_HIGHLIGHT[use_pattern]=1
FAST_HIGHLIGHT[use_regexp]=1

# Magic Enter configuration
export MAGIC_ENTER_GIT_COMMAND='git status -s'
export MAGIC_ENTER_OTHER_COMMAND='ls'

# Forgit configuration
export FORGIT_NO_ALIASES=1   # Don't shadow our abbreviations; use forgit::log etc.

# Autopair configuration
export AUTOPAIR_INHIBIT_INIT=0
export AUTOPAIR_BETWEEN_WHITESPACE=0
export AUTOPAIR_PAIRS=('`' '`' "'" "'" '"' '"' '{' '}' '[' ']' '(' ')')

# Directory history configuration
export DIRSTACKSIZE=20

###############################################################################
#                         FZF Configuration
###############################################################################
if (( $+commands[fzf] )); then
    # TokyoNight colors to match the starship theme
    export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border --cycle --color=bg+:#24283b,bg:#1a1b26,spinner:#7dcfff,hl:#7aa2f7,fg:#c0caf5,header:#7aa2f7,info:#bb9af7,pointer:#7dcfff,marker:#9ece6a,fg+:#c0caf5,prompt:#bb9af7,hl+:#7aa2f7'

    # Use fd for file/dir listing (respects .gitignore, much faster than find)
    if (( $+commands[fd] )); then
        export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
    fi

    # Previews: bat for files, eza tree for directories
    if (( $+commands[bat] )); then
        export FZF_CTRL_T_OPTS='--preview "bat --color=always --style=numbers --line-range=:200 {}" --preview-window=right,60%,wrap'
    fi
    if (( $+commands[eza] )); then
        export FZF_ALT_C_OPTS='--preview "eza --tree --level=2 --color=always {} 2>/dev/null || ls -la {}"'
    fi

    # FZF Tab configuration
    zstyle ':fzf-tab:*' fzf-command fzf
    zstyle ':fzf-tab:*' fzf-flags '--height=50% --layout=reverse --border --cycle'
    zstyle ':fzf-tab:*' fzf-bindings 'tab:accept'
    zstyle ':fzf-tab:*' continuous-trigger '/'
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath 2>/dev/null || ls $realpath'
    zstyle ':fzf-tab:complete:*:*' fzf-preview 'if [ -d $realpath ]; then eza -1 --color=always $realpath 2>/dev/null || ls $realpath; else bat --color=always --style=plain $realpath 2>/dev/null || less ${(Q)realpath}; fi'
fi
