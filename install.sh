#!/usr/bin/sh
curl -sLfo ~/.p10k.zsh https://raw.githubusercontent.com/ali-commits/dotfiles/master/p10k/p10k.zsh
curl -sLfo ~/.zshrc https://raw.githubusercontent.com/ali-commits/dotfiles/master/zshrc
curl -sLfo ~/.vimrc https://raw.githubusercontent.com/ali-commits/dotfiles/master/vimrc
curl -sLfo ~/.config/neofetch/config.conf https://raw.githubusercontent.com/ali-commits/dotfiles/master/neofetch/neofetch --create-dirs
curl -sLfo ~/.config/latte/mcOS-BS-Large.layout.latte https://raw.githubusercontent.com/ali-commits/dotfiles/master/latte/mcOS-BS-Large.layout.latte --create-dirs

export pgks=(docker docker-compose zsh grc neofetch neovim exa btm ripgrep fd bat procs tokei zoxidez)

if  command -v apt &> /dev/null
then
    for pkg in ${pkgs[@]}; do
        sudo apt install $pkg
    done
fi

if command -v paru &> /dev/null
    for pkg in ${pkgs[@]}; do
        sudo paru -S $pkg
    done
fi

if command -v pacman &> /dev/null
    for pkg in ${pkgs[@]}; do
        sudo paru -S $pkg
    done
fi