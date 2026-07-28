# ~/.zsh/abbreviations.zsh
# Shell abbreviations using the zsh-abbr plugin
# Sourced once on first install; edit then run `abbr_reset` to reload

###############################################################################
#                         System Commands
###############################################################################
# Package management
abbr "s"="sudo"

# DNF package management (Fedora)
abbr "dn"="dnf"
abbr "dni"="dnf install -y"
abbr "dnr"="dnf remove -y"
abbr "dnu"="dnf update -y"
abbr "dns"="dnf search"

# System control
abbr "sy"="systemctl"
abbr "sys"="sudo systemctl"
abbr "systa"="sudo systemctl start"
abbr "systo"="sudo systemctl stop"
abbr "sysr"="sudo systemctl restart"
abbr "syss"="systemctl status"
abbr "syse"="sudo systemctl enable"
abbr "sysd"="sudo systemctl disable"

# System information
abbr "df"="df -h"
abbr "free"="free -m"
abbr "psa"="ps auxf"
abbr "psg"="ps aux | grep -v grep | grep -i"
abbr "ports"="netstat -tulpn"
abbr "ipext"="curl ipinfo.io/ip"
abbr "ipint"="hostname -I | cut -d' ' -f1"
abbr "usage"="du -sh"
abbr "total"="df -hl --total"

###############################################################################
#                         Directory Navigation & Shortcuts
###############################################################################
# Note: Regular (non-global) abbreviations so 'cd ..' or 'ls ~' don't get corrupted
abbr ".."="cd .."
abbr "..."="cd ../.."
abbr "...."="cd ../../../.."
abbr "md"="mkdir -p"
abbr "rd"="rmdir"

# Directory listing
abbr "ll"="ls -lh"
abbr "la"="ls -lah"
abbr "lt"="ls --tree"
abbr "l."="ls -d .*"
abbr "lsd"="ls -d */"

# Directory shortcuts
abbr "dl"="cd ~/Downloads"
abbr "doc"="cd ~/Documents"
abbr "dt"="cd ~/Desktop"
abbr "proj"="cd ~/Projects"
abbr "cfg"="cd ~/.config"

###############################################################################
#                         Git Commands
###############################################################################
# Basic git operations
abbr "g"="git"
abbr "gs"="git status"
abbr "ga"="git add"
abbr "gc"="git commit -m"
abbr "gca"="git commit -am"
abbr "gp"="git push"
abbr "gpl"="git pull"
abbr "gf"="git fetch"
abbr "gco"="git checkout"
abbr "gb"="git branch"
abbr "gm"="git merge"
abbr "gd"="git diff"
abbr "gl"="git log"

# Advanced git
abbr "glog"="git log --oneline --graph"
abbr "gclean"="git clean -fd"
abbr "greset"="git reset --hard"
abbr "gstash"="git stash"
abbr "gpop"="git stash pop"
abbr "gignore"="git update-index --assume-unchanged"
abbr "gunignore"="git update-index --no-assume-unchanged"

###############################################################################
#                         Docker Commands
###############################################################################
# Docker basics
abbr "d"="docker"
abbr "dc"="docker compose"
abbr "dcu"="docker compose up -d"
abbr "dcd"="docker compose down"
abbr "dcl"="docker compose logs -f"
abbr "dcp"="docker compose pull"

# Docker containers
abbr "dps"="docker ps"
abbr "dpsa"="docker ps -a"
abbr "dst"="docker stats"
abbr "dex"="docker exec -it"
abbr "dlg"="docker logs -f"
abbr "drm"="docker rm"
abbr "drmi"="docker rmi"
abbr "dprune"="docker system prune -af"

###############################################################################
#                         Development Commands
###############################################################################
# Python
abbr "py"="python3"
abbr "pipi"="pip install"
abbr "pipir"="pip install -r requirements.txt"
abbr "pipup"="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U"
abbr "penv"="python -m venv .venv"
abbr "aenv"="source .venv/bin/activate"
abbr "denv"="deactivate"
abbr "pytest"="python -m pytest"

# Node.js
abbr "nr"="npm run"
abbr "ni"="npm install"
abbr "nid"="npm install --save-dev"
abbr "nig"="npm install -g"
abbr "nrm"="npm remove"
abbr "nrd"="npm run dev"
abbr "nrb"="npm run build"
abbr "nrt"="npm run test"

###############################################################################
#                         Network Commands
###############################################################################
abbr "wget"="wget -c"
abbr "curl"="curl -L"
abbr "ping"="ping -c 5"
abbr "myip"="curl ifconfig.me"
abbr "http"="python3 -m http.server"

###############################################################################
#                         System Utilities
###############################################################################
abbr "sizeof"="du -sh"
abbr "disk"="df -h"
abbr "memory"="free -h"
abbr "processes"="ps aux"
abbr "running"="ps aux | grep"
abbr "h"="history"
abbr "j"="jobs -l"
abbr "c"="clear"
abbr "path"="echo -e \${PATH//:/\\n}"
abbr "now"="date +\"%T\""
abbr "nowdate"="date +\"%Y-%m-%d\""
abbr "timestamp"="date +\"%Y%m%d_%H%M%S\""

###############################################################################
#                         Configuration Shortcuts
###############################################################################
abbr "zshrc"="$EDITOR ~/.zshrc"
abbr "zshr"="source ~/.zshrc"
abbr "zshenv"="$EDITOR ~/.zshenv"
abbr "vimrc"="$EDITOR ~/.vimrc"
abbr "tmuxrc"="$EDITOR ~/.tmux.conf"
abbr "gitconfig"="$EDITOR ~/.gitconfig"

###############################################################################
#                         Podman Shortcuts
###############################################################################
# Podman basics
abbr "p"="podman"
abbr "pc"="podman-compose"
abbr "pcu"="podman-compose up -d"
abbr "pcd"="podman-compose down"
abbr "pcl"="podman-compose logs -f"
abbr "pcp"="podman-compose pull"

# Podman containers
abbr "pps"="podman ps"
abbr "ppsa"="podman ps -a"
abbr "pst"="podman stats"
abbr "pex"="podman exec -it"
abbr "pl"="podman logs -f"
abbr "prm"="podman rm"
abbr "prmi"="podman rmi"
abbr "prun"="podman run --rm -it"
abbr "pstart"="podman start"
abbr "pstop"="podman stop"
abbr "prestart"="podman restart"

# Podman system
abbr "pprune"="podman system prune -af"
abbr "ppod"="podman pod"
abbr "pvol"="podman volume"
abbr "pnet"="podman network"
abbr "pbuild"="podman build"
abbr "ppull"="podman pull"
abbr "ppush"="podman push"

###############################################################################
#                         Global Redirection Helpers (Only true globals)
###############################################################################
# Use -g ONLY for pipeline and redirection snippets
abbr -g "G"="| grep"
abbr -g "L"="| less"
abbr -g "NE"="2>/dev/null"
abbr -g "DN"=">/dev/null 2>&1"
