# ~/.zshrc
# Main Zsh configuration file that sources all other components

# Performance profiling (uncomment to enable startup timing)
# zmodload zsh/zprof

###############################################################################
#                            Directory Structure
###############################################################################
# Create zsh config directory if it doesn't exist
[ ! -d ~/.zsh ] && mkdir ~/.zsh

# Define paths for the configuration components
export ABBRS=~/.zsh/abbreviations.zsh      # Zsh abbreviations (zsh-abbr)
export PLUGINS=~/.zsh/plugins.zsh          # Plugin manager and plugins
export CONFIGS=~/.zsh/config.zsh           # Paths, env vars, options, completion
export KEYBINDINGS=~/.zsh/keybindings.zsh  # Key bindings and mappings
export FUNCTIONS=~/.zsh/functions.zsh      # Custom functions
export ALIASES=~/.zsh/aliases.zsh          # General aliases
export ZSH_CACHE=~/.cache/zsh              # Cache directory

# Create cache directory if it doesn't exist
[ ! -d $ZSH_CACHE ] && mkdir -p $ZSH_CACHE

###############################################################################
#                            Source Configuration Files
###############################################################################
source $PLUGINS
source $CONFIGS
source $KEYBINDINGS
source $FUNCTIONS
source $ALIASES

# Machine-specific configuration (optional, not tracked in the repo)
# Put things like OLLAMA_HOST, GOOGLE_CLOUD_*, etc. here
[[ -f ~/.zsh/local.zsh ]] && source ~/.zsh/local.zsh

###############################################################################
#                            Machine-Specific Integrations
###############################################################################
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# kiro shell integration
[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# uv environment
[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"

# Android SDK (only if installed)
if [[ -d "$HOME/Android/Sdk" ]]; then
    export ANDROID_HOME="$HOME/Android/Sdk"
    export ANDROID_SDK_ROOT="$ANDROID_HOME"
    path+=("$ANDROID_HOME/platform-tools" "$ANDROID_HOME/cmdline-tools/latest/bin" "$ANDROID_HOME/emulator")
fi

# Added by Antigravity CLI installer
export PATH="$HOME/.local/bin:$PATH"

# Performance monitoring (if enabled)
if [[ "$PROFILE_STARTUP" == true ]]; then
    zprof
fi
