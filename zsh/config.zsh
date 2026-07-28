# ~/.zsh/config.zsh
# Paths, environment variables, zsh options, and completion system

###############################################################################
#                            Path Configuration
###############################################################################
# Enable unique path entries (automatically remove duplicates)
typeset -U PATH path

# Define additional paths to add to PATH
path=(
    $HOME/.local/bin              # User local binaries
    $HOME/.cargo/bin              # Rust binaries
    $HOME/.npm/bin                # NPM global binaries
    $HOME/.bun/bin                # Bun binaries
    $HOME/.bin                    # Custom user scripts
    $path                         # Existing PATH
)

###############################################################################
#                            Environment Variables
###############################################################################
# Editor configuration
export VISUAL=nvim
export EDITOR=nvim
export PAGER=less

# Python environment
export PYTHONDONTWRITEBYTECODE=1  # Prevent Python from writing .pyc files
export PYTHONUNBUFFERED=1         # Prevent Python from buffering stdout/stderr

# Set language and locale 
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# History configuration
export HISTFILE=~/.zsh_history    # History file location
export HISTSIZE=50000             # Maximum events in internal history
export SAVEHIST=50000             # Maximum events in history file

# Hide the EOL sign ('%') on partial lines
PROMPT_EOL_MARK=""

# Don't consider certain characters part of a word (better Ctrl+W/Alt+Backspace)
WORDCHARS=${WORDCHARS//\/[&.;]}

###############################################################################
#                            History Options
###############################################################################
setopt EXTENDED_HISTORY           # Save timestamp and duration for commands
setopt HIST_EXPIRE_DUPS_FIRST     # Remove duplicate commands first when trimming history
setopt HIST_FIND_NO_DUPS          # Don't display duplicates when searching history
setopt HIST_REDUCE_BLANKS         # Remove unnecessary blanks from history
setopt HIST_VERIFY                # Show command with history expansion before executing
setopt INC_APPEND_HISTORY         # Add commands to history as they are typed
setopt SHARE_HISTORY              # Share history between sessions
setopt HIST_FCNTL_LOCK            # Better file locking

###############################################################################
#                            Directory Navigation
###############################################################################
setopt AUTO_CD                    # Change directory without typing cd
setopt AUTO_PUSHD                 # Push directories onto stack automatically
setopt PUSHD_IGNORE_DUPS          # Don't push duplicate directories onto stack
setopt PUSHD_MINUS                # Use -N to refer to Nth directory in stack
setopt PUSHD_SILENT               # Don't print directory stack after pushd/popd

###############################################################################
#                            Globbing and Completion
###############################################################################
setopt EXTENDED_GLOB              # Use additional glob patterns
setopt GLOB_DOTS                  # Include hidden files in globbing
setopt NO_CASE_GLOB               # Case insensitive globbing
setopt NUMERIC_GLOB_SORT          # Sort filenames numerically when appropriate
setopt RC_EXPAND_PARAM            # Array expansion with parameters
setopt CORRECT                    # Try to correct command spelling

###############################################################################
#                            Job Control
###############################################################################
setopt LONG_LIST_JOBS             # List jobs in long format
setopt NOTIFY                     # Report status of background jobs immediately
setopt NO_CHECK_JOBS              # Don't warn about running processes when exiting

###############################################################################
#                            Input/Output
###############################################################################
setopt NO_BEEP                    # Don't beep on errors
setopt INTERACTIVE_COMMENTS       # Allow comments in interactive shells
setopt PRINT_EXIT_VALUE           # Print exit value if non-zero

###############################################################################
#                            Prompting
###############################################################################
setopt PROMPT_SUBST               # Allow parameter/command substitution in prompt
setopt TRANSIENT_RPROMPT          # Remove right prompt after command execution

###############################################################################
#                         Completion System Initialization
###############################################################################
autoload -Uz compinit
# Create a cache directory if it doesn't exist
mkdir -p $ZSH_CACHE/completions
# Only rebuild the completion cache once per day
if [[ -n $ZSH_CACHE/completions/zcompdump(#qN.mh+24) ]]; then
    compinit -d $ZSH_CACHE/completions/zcompdump
else
    compinit -C -d $ZSH_CACHE/completions/zcompdump
fi

# Load additional completion features
zmodload zsh/complist  # Required for menu selection

# Bash completion compatibility (needed by some tools, e.g. pipx/argcomplete)
autoload -U bashcompinit
bashcompinit

###############################################################################
#                         Completion System Configuration
###############################################################################
# Basic completion settings
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $ZSH_CACHE/completions

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'   # Skip completion for exact matches in PATH
zstyle ':completion:*' rehash true           # Automatically find new executables in PATH

# Completion menu settings
zstyle ':completion:*:*:*:*:*' menu select  # Interactive menu for completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # Case insensitive completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}:ma=01;36;44"  # Colored completion with vibrant highlight for selection
zstyle ':completion:*' special-dirs true    # Complete . and .. special directories
zstyle ':completion:*' file-sort time       # Sort files by modification time
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/2))numeric)'

# Group matches and describe groups
zstyle ':completion:*' group-name ''  # Group different types of matches
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:corrections' format '%F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'

# Ignore internal helper functions and parent dirs
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Process completion
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# History completion
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Directory completion
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'

# SSH completion
zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:scp:*' group-order files users hosts-domain hosts-host hosts-ipaddr

# Kill completion
zstyle ':completion:*:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:kill:*' insert-ids single
zstyle ':completion:*:*:*:*:processes' force-list always

# Docker completion stacking
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# pipx completion (via argcomplete)
command -v register-python-argcomplete >/dev/null && eval "$(register-python-argcomplete pipx)"

###############################################################################
#                         Pager & Man Page Colors
###############################################################################
if (( $+commands[bat] )); then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    export MANROFFOPT="-c"
    export LESS='-R'
else
    export LESS='-R --use-color -Dd+r$Du+b'
    export MANPAGER='less -R --use-color -Dd+r -Du+b'
    # Color man pages via termcap
    export LESS_TERMCAP_mb=$'\E[01;32m'
    export LESS_TERMCAP_md=$'\E[01;32m'
    export LESS_TERMCAP_me=$'\E[0m'
    export LESS_TERMCAP_se=$'\E[0m'
    export LESS_TERMCAP_so=$'\E[01;47;34m'
    export LESS_TERMCAP_ue=$'\E[0m'
    export LESS_TERMCAP_us=$'\E[01;36m'
fi

# eza/exa color tuning (if installed)
if (( $+commands[eza] )) || (( $+commands[exa] )); then
    export EZA_COLORS="da=37:uu=37:un=37:gu=37:gn=37"
    export EXA_COLORS="$EZA_COLORS"
    export TIME_STYLE="long-iso"
fi
