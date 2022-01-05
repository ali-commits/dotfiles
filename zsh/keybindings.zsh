

#######################################################################
#  _                                    
# | | _____ _   _ _ __ ___   __ _ _ __  
# | |/ / _ \ | | | '_ ` _ \ / _` | '_ \ 
# |   <  __/ |_| | | | | | | (_| | |_) |
# |_|\_\___|\__, |_| |_| |_|\__,_| .__/ 
#           |___/                |_|    

# key bindings for history-substring-search

bindkey -e

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey ";s" sudoSwitch 
bindkey "\e\e" sudoSwitch 

bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                      # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action



# bindkey -M vicmd 'k'  history-substring-search-up
# bindkey -M vicmd 'j'  history-substring-search-down
# bindkey -M viins ';;' vi-cmd-mode                               # exit from viins to vicmd (normal mode) using ;;
# bindkey -M viins ';d' kill-whole-line
# bindkey -M vicmd "J"  beginning-of-line
# bindkey -M vicmd "K"  end-of-line

# bindkey ";h" history-incremental-pattern-search-backward

# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
