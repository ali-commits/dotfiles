#!/usr/bin/sh
curl -sLfo ~/.p10k.zsh https://raw.githubusercontent.com/ali-commits/dotfiles/master/p10k/p10k.zsh
curl -sLfo ~/.zshrc https://raw.githubusercontent.com/ali-commits/dotfiles/master/zshrc
curl -sLfo ~/.vimrc https://raw.githubusercontent.com/ali-commits/dotfiles/master/vimrc
curl -sLfo ~/.config/neofetch/config.conf https://raw.githubusercontent.com/ali-commits/dotfiles/master/neofetch/neofetch --create-dirs
curl -sLfo ~/.config/latte/mcOS-BS-Large.layout.latte https://raw.githubusercontent.com/ali-commits/dotfiles/master/latte/mcOS-BS-Large.layout.latte --create-dirs


# install packages needed packages

export pkgs=(
    docker
    docker-compose
    zsh
    grc
    neofetch
    neovim
    exa
    bottom
    ripgrep
    fd
    bat
    procs
    tokei
    zoxide
    bpython
    ipython
)

if command -v apt >/dev/null 2>&1; then
    apt update
    apt install -y ${pkgs[@]}
    echo "Installed packages using apt"
elif command -v paru >/dev/null 2>&1; then
    paru -Syu
    paru -S --noconfirm --needed ${pkgs[@]}
    echo "Installed packages using pacman"
elif command -v pacman >/dev/null 2>&1; then
    pacman -Syu
    pacman -S --noconfirm --needed ${pkgs[@]}
    echo "Installed packages using pacman"
elif command -v dnf >/dev/null 2>&1; then
    dnf -y update
    dnf -y install ${pkgs[@]}
    echo "Installed packages using dnf"
elif command -v zypper >/dev/null 2>&1; then
    zypper -y update
    zypper -y install ${pkgs[@]}
    echo "Installed packages using zypper"
elif command -v yum >/dev/null 2>&1; then
    yum -y update
    yum -y install ${pkgs[@]}
    echo "Installed packages using yum"
else
    echo "No package manager found"
fi