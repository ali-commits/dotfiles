# ~/.zsh/keybindings.zsh
# Configuration for key bindings and keyboard shortcuts

###############################################################################
#                         Emacs Key Bindings
###############################################################################
bindkey -e

###############################################################################
#                         History Navigation
###############################################################################
# Initialize history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# History substring search (plugin)
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey '^[[A' history-substring-search-up     # Up arrow
bindkey '^[[B' history-substring-search-down   # Down arrow

# Incremental history search
# NOTE: Ctrl+R is owned by atuin (see plugins.zsh)
bindkey '^S' history-incremental-search-forward   # Ctrl+S: forward search

###############################################################################
#                         Cursor Movement
###############################################################################
# Line navigation
bindkey '^A' beginning-of-line                 # Ctrl+A: Start of line
bindkey '^E' end-of-line                       # Ctrl+E: End of line

# Word navigation
bindkey '^[[1;5D' backward-word                # Ctrl+Left: Previous word
bindkey '^[[1;5C' forward-word                 # Ctrl+Right: Next word
bindkey '^[Oc' forward-word                    # Ctrl+Right (alternative)
bindkey '^[Od' backward-word                   # Ctrl+Left (alternative)
bindkey '^W' backward-kill-word                # Ctrl+W: Delete previous word
bindkey '^H' backward-kill-word                # Ctrl+Backspace: Delete previous word
bindkey '^[[3;5~' kill-word                    # Ctrl+Delete: Delete next word

###############################################################################
#                         Line Editing
###############################################################################
bindkey '^U' backward-kill-line                # Ctrl+U: Clear line before cursor
bindkey '^K' kill-line                         # Ctrl+K: Clear line after cursor
bindkey '^Y' yank                              # Ctrl+Y: Paste killed text

# Undo/Redo
bindkey '^_' undo                              # Ctrl+/: Undo
bindkey '^X^R' redo                            # Ctrl+X,Ctrl+R: Redo
bindkey '^[[Z' undo                            # Shift+Tab: Undo

###############################################################################
#                         Completion Menu
###############################################################################
# Menu navigation (when showing completion menu)
bindkey -M menuselect 'h' vi-backward-char        # Left: Previous column
bindkey -M menuselect 'j' vi-down-line-or-history # Down: Next item
bindkey -M menuselect 'k' vi-up-line-or-history   # Up: Previous item
bindkey -M menuselect 'l' vi-forward-char         # Right: Next column
bindkey -M menuselect '^[[Z' reverse-menu-complete # Shift+Tab: Previous match

###############################################################################
#                         Special Functions
###############################################################################
# SudoSwitch plugin bindings
bindkey ';s' sudoSwitch                        # ;s: Toggle sudo prefix
bindkey '\e\e' sudoSwitch                      # Esc,Esc: Toggle sudo prefix

###############################################################################
#                         Terminal Keys
###############################################################################
# Home / End (multiple terminal variants + terminfo fallback)
bindkey '^[[H' beginning-of-line               # Home
bindkey '^[[F' end-of-line                     # End
bindkey '^[[7~' beginning-of-line              # Home (alternative)
bindkey '^[[8~' end-of-line                    # End (alternative)
bindkey '^[[1~' beginning-of-line              # Home (alternative)
bindkey '^[[4~' end-of-line                    # End (alternative)
bindkey '^[OH' beginning-of-line               # Home (alternative)
bindkey '^[OF' end-of-line                     # End (alternative)
if [[ "${terminfo[khome]}" != "" ]]; then
    bindkey "${terminfo[khome]}" beginning-of-line
fi
if [[ "${terminfo[kend]}" != "" ]]; then
    bindkey "${terminfo[kend]}" end-of-line
fi

# Insert / Delete
bindkey '^[[2~' overwrite-mode                 # Insert
bindkey '^[[3~' delete-char                    # Delete

# Page Up / Page Down: search history by what is already typed
bindkey '^[[5~' history-beginning-search-backward
bindkey '^[[6~' history-beginning-search-forward
