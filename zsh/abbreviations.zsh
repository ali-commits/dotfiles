# ~/.zsh/abbreviations.zsh
# Shell abbreviations using the zsh-abbr plugin
# Sourced once on first install; edit then run `abbr_reset` to reload

###############################################################################
#                         System Commands
###############################################################################
# Package management
abbr -g "s"="sudo"

# DNF package management (Fedora)
# Note: "d" is taken by docker, so dnf uses "dn"
abbr -g "dn"="dnf"
abbr -g "dni"="dnf install -y"
abbr -g "dnr"="dnf remove -y"
abbr -g "dnu"="dnf update -y"
abbr -g "dns"="dnf search"
abbr -g "dnf i"="dnf install -y"
abbr -g "dnf r"="dnf remove -y"
abbr -g "dnf u"="dnf update -y"
abbr -g "dnf s"="dnf search"

# System control
abbr -g "sy"="systemctl"
abbr -g "sys"="sudo systemctl"
abbr -g "systa"="sudo systemctl start"
abbr -g "systo"="sudo systemctl stop"
abbr -g "sysr"="sudo systemctl restart"
abbr -g "syss"="systemctl status"
abbr -g "syse"="sudo systemctl enable"
abbr -g "sysd"="sudo systemctl disable"

# System information
abbr -g "df"="df -h"
abbr -g "free"="free -m"
abbr -g "psa"="ps auxf"
abbr -g "psg"="ps aux | grep -v grep | grep -i"
abbr -g "ports"="netstat -tulpn"
abbr -g "ipext"="curl ipinfo.io/ip"
abbr -g "ipint"="hostname -I | cut -d' ' -f1"
abbr -g "usage"="du -sh"
abbr -g "total"="df -hl --total"

###############################################################################
#                         Directory Navigation
###############################################################################
abbr -g ".."="cd .."
abbr -g "..."="cd ../.."
abbr -g "...."="cd ../../.."
abbr -g "~"="cd ~"
abbr -g "-"="cd -"
abbr -g "md"="mkdir -p"
abbr -g "rd"="rmdir"

# Directory listing
abbr -g "ll"="ls -lh"
abbr -g "la"="ls -lah"
abbr -g "lt"="ls --tree"
abbr -g "l."="ls -d .*"
abbr -g "lsd"="ls -d */"

# Directory shortcuts
abbr -g "dl"="cd ~/Downloads"
abbr -g "doc"="cd ~/Documents"
abbr -g "dt"="cd ~/Desktop"
abbr -g "proj"="cd ~/Projects"
abbr -g "cfg"="cd ~/.config"

###############################################################################
#                         Git Commands
###############################################################################
# Basic git operations
abbr -g "g"="git"
abbr -g "gs"="git status"
abbr -g "ga"="git add"
abbr -g "gc"="git commit -m"
abbr -g "gca"="git commit -am"
abbr -g "gp"="git push"
abbr -g "gpl"="git pull"
abbr -g "gf"="git fetch"
abbr -g "gco"="git checkout"
abbr -g "gb"="git branch"
abbr -g "gm"="git merge"
abbr -g "gd"="git diff"
abbr -g "gl"="git log"

# Advanced git
abbr -g "glog"="git log --oneline --graph"
abbr -g "gclean"="git clean -fd"
abbr -g "greset"="git reset --hard"
abbr -g "gstash"="git stash"
abbr -g "gpop"="git stash pop"
abbr -g "gignore"="git update-index --assume-unchanged"
abbr -g "gunignore"="git update-index --no-assume-unchanged"

###############################################################################
#                         Docker Commands
###############################################################################
# Docker basics
abbr -g "d"="docker"
abbr -g "dc"="docker-compose"
abbr -g "dcu"="docker-compose up -d"
abbr -g "dcd"="docker-compose down"
abbr -g "dcl"="docker-compose logs -f"
abbr -g "dcp"="docker-compose pull"

# Docker containers
abbr -g "dps"="docker ps"
abbr -g "dpsa"="docker ps -a"
abbr -g "dst"="docker stats"
abbr -g "dex"="docker exec -it"
abbr -g "dlg"="docker logs -f"
abbr -g "drm"="docker rm"
abbr -g "drmi"="docker rmi"
abbr -g "dprune"="docker system prune -af"

###############################################################################
#                         Development Commands
###############################################################################
# Python
abbr -g "py"="python3"
abbr -g "pipi"="pip install"
abbr -g "pipir"="pip install -r requirements.txt"
abbr -g "pipup"="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U"
abbr -g "penv"="python -m venv .venv"
abbr -g "aenv"="source .venv/bin/activate"
abbr -g "denv"="deactivate"
abbr -g "pytest"="python -m pytest"

# Node.js
abbr -g "nr"="npm run"
abbr -g "ni"="npm install"
abbr -g "nid"="npm install --save-dev"
abbr -g "nig"="npm install -g"
abbr -g "nrm"="npm remove"
abbr -g "nrd"="npm run dev"
abbr -g "nrb"="npm run build"
abbr -g "nrt"="npm run test"

###############################################################################
#                         Network Commands
###############################################################################
abbr -g "wget"="wget -c"
abbr -g "curl"="curl -L"
abbr -g "ping"="ping -c 5"
abbr -g "myip"="curl ifconfig.me"
abbr -g "http"="python3 -m http.server"

###############################################################################
#                         System Utilities
###############################################################################
abbr -g "sizeof"="du -sh"
abbr -g "disk"="df -h"
abbr -g "memory"="free -h"
abbr -g "processes"="ps aux"
abbr -g "running"="ps aux | grep"
abbr -g "h"="history"
abbr -g "j"="jobs -l"
abbr -g "c"="clear"
abbr -g "path"="echo -e \${PATH//:/\\n}"
abbr -g "now"="date +\"%T\""
abbr -g "nowdate"="date +\"%Y-%m-%d\""
abbr -g "timestamp"="date +\"%Y%m%d_%H%M%S\""

###############################################################################
#                         Configuration Shortcuts
###############################################################################
abbr -g "zshrc"="$EDITOR ~/.zshrc"
abbr -g "zshr"="source ~/.zshrc"
abbr -g "zshenv"="$EDITOR ~/.zshenv"
abbr -g "vimrc"="$EDITOR ~/.vimrc"
abbr -g "tmuxrc"="$EDITOR ~/.tmux.conf"
abbr -g "gitconfig"="$EDITOR ~/.gitconfig"

###############################################################################
#                         Podman Shortcuts
###############################################################################
# Podman basics
abbr -g "p"="podman"
abbr -g "pc"="podman-compose"
abbr -g "pcu"="podman-compose up -d"
abbr -g "pcd"="podman-compose down"
abbr -g "pcl"="podman-compose logs -f"
abbr -g "pcp"="podman-compose pull"

# Podman containers
abbr -g "pps"="podman ps"
abbr -g "ppsa"="podman ps -a"
abbr -g "pst"="podman stats"
abbr -g "pex"="podman exec -it"
abbr -g "pl"="podman logs -f"
abbr -g "prm"="podman rm"
abbr -g "prmi"="podman rmi"
abbr -g "prun"="podman run --rm -it"
abbr -g "pstart"="podman start"
abbr -g "pstop"="podman stop"
abbr -g "prestart"="podman restart"

# Podman system
abbr -g "pprune"="podman system prune -af"
abbr -g "ppod"="podman pod"
abbr -g "pvol"="podman volume"
abbr -g "pnet"="podman network"
abbr -g "pbuild"="podman build"
abbr -g "ppull"="podman pull"
abbr -g "ppush"="podman push"
