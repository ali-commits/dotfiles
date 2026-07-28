# ~/.zsh/functions.zsh
# Custom utility functions

###############################################################################
#                         Directory Management
###############################################################################
# Create a directory and cd into it
function take() {
    mkdir -p "$1" && cd "$1"
}

# List directory contents after cd
function chpwd() {
    if command -v eza &> /dev/null; then
        eza --icons --group-directories-first
    elif command -v exa &> /dev/null; then
        exa --icons --group-directories-first
    else
        ls
    fi
}

###############################################################################
#                         System Utilities
###############################################################################
# Create an alias only if the command exists
function cmd_alias() {
    if command -v "$2" &> /dev/null; then
        alias "$1"="${@:2}"
    fi
}

# Extract various archive formats
function extract() {
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Show directory size
function dirsize() {
    if command -v dust &> /dev/null; then
        dust "$@"
    else
        du -sh "$@"
    fi
}

###############################################################################
#                         Process Management
###############################################################################
# Find process by name
function psg() {
    ps aux | grep -v grep | grep -i -e VSZ -e "$1"
}

# Kill process by name
function pskill() {
    local pid=$(ps aux | grep -v grep | grep -i "$1" | awk '{print $2}')
    if [ -n "$pid" ]; then
        echo -n "Killing $1 (process $pid)..."
        kill -9 "$pid"
        echo "done"
    else
        echo "Process $1 not found"
    fi
}

###############################################################################
#                         Network Utilities
###############################################################################
# Get external IP address
function myip() {
    curl -s http://ipecho.net/plain
    echo
}

# Simple HTTP server
function serve() {
    local port=${1:-8000}
    if command -v python3 &> /dev/null; then
        python3 -m http.server $port
    elif command -v python &> /dev/null; then
        python -m SimpleHTTPServer $port
    else
        echo "Python is not installed"
    fi
}

###############################################################################
#                         Development Utilities
###############################################################################
# Create Python virtual environment
function penv() {
    python -m venv .venv && source .venv/bin/activate
}

# Activate Python virtual environment
function aenv() {
    if [ -d .venv ]; then
        source .venv/bin/activate
    else
        echo "No virtual environment found in current directory"
        echo "Create one with: penv"
    fi
}

###############################################################################
#                         System Information
###############################################################################
# Show system information
function sysinfo() {
    echo "OS Information:"
    cat /etc/os-release | grep PRETTY_NAME
    echo "\nKernel Information:"
    uname -a
    echo "\nMemory Information:"
    free -h
    echo "\nDisk Usage:"
    df -h /
}

# Show weather
function weather() {
    local city=${1:-""}
    curl -s "wttr.in/$city?format=v2"
}

###############################################################################
#                         Abbreviation Helpers (zsh-abbr)
###############################################################################
# Delete all abbreviations
function abbr_clear_all() {
    local -a abbrs=()
    while IFS= read -r line; do
        abbrs+=("$line")
    done < <(abbr list-abbreviations)

    for abbr in "${abbrs[@]}"; do
        abbr erase -g "$abbr"
    done
}

# Delete all abbreviations and reset the installed flag (reloads on next shell)
function abbr_reset() {
    abbr_clear_all
    rm -f "$ZPFX/.zsh-abbr-installed"
}
