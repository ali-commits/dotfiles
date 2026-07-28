#!/usr/bin/env bash
#
# Dotfiles bootstrap for a new machine
# Usage: curl -L bit.ly/alicnfg | bash
#
# What it does:
#   1. Downloads the dotfiles from GitHub
#   2. Detects the package manager (apt / dnf / pacman / paru / zypper)
#   3. Adds the official Docker CE repo (apt/dnf) and installs packages
#   4. Falls back to official installers for tools missing from distro repos
#   5. Sets zsh as the default shell and adds the user to the docker group

set -u

REPO=https://raw.githubusercontent.com/ali-commits/dotfiles/master

###############################################################################
# 1. Download dotfiles
###############################################################################
echo "==> Downloading dotfiles..."
mkdir -p ~/.zsh ~/.config ~/.bin

curl -sLfo ~/.zshrc "$REPO/zshrc"
for f in aliases abbreviations config functions keybindings plugins; do
    curl -sLfo ~/.zsh/$f.zsh "$REPO/zsh/$f.zsh"
done
curl -sLfo ~/.zsh/local.zsh.example "$REPO/zsh/local.zsh.example"
curl -sLfo ~/.config/starship.toml "$REPO/starship/starship.toml" --create-dirs
curl -sLfo ~/.vimrc "$REPO/vimrc"
for s in dotpush dotpull; do
    curl -sLfo ~/.bin/$s "$REPO/bin/$s" && chmod +x ~/.bin/$s
done

###############################################################################
# 2. Package manager detection and package lists
###############################################################################
# Package names differ per distro; everything we use is listed here.
packages_apt=(
    git curl wget zsh neovim
    eza bat ripgrep fd-find fzf
    zoxide direnv atuin starship git-delta fastfetch
    bottom procs lazygit lazydocker duf du-dust tldr hexyl hyperfine
    mtr grc bpython jq unzip
)

packages_dnf=(
    git curl wget zsh neovim
    eza bat ripgrep fd-find fzf
    zoxide direnv atuin starship git-delta fastfetch
    bottom procs duf dust tldr hexyl hyperfine
    mtr grc bpython jq unzip
)

packages_pacman=(
    git curl wget zsh neovim
    eza bat ripgrep fd fzf
    zoxide direnv atuin starship git-delta fastfetch
    bottom procs lazygit lazydocker duf dust tldr hexyl hyperfine
    mtr grc bpython jq unzip
)

packages_zypper=(
    git curl wget zsh neovim
    eza bat ripgrep fd fzf
    zoxide direnv starship git-delta fastfetch
    procs lazygit lazydocker duf dust tldr hexyl hyperfine
    mtr grc bpython jq unzip
)

PM=""
packages=()
update_cmd=""
install_cmd=""

if command -v apt >/dev/null 2>&1; then
    PM="apt"
    packages=("${packages_apt[@]}")
    update_cmd="sudo apt update"
    install_cmd="sudo apt install -y"
elif command -v paru >/dev/null 2>&1; then
    PM="paru"
    packages=("${packages_pacman[@]}")
    update_cmd="paru -Sy"
    install_cmd="paru -S --noconfirm --needed"
elif command -v pacman >/dev/null 2>&1; then
    PM="pacman"
    packages=("${packages_pacman[@]}")
    update_cmd="sudo pacman -Sy"
    install_cmd="sudo pacman -S --noconfirm --needed"
elif command -v dnf >/dev/null 2>&1; then
    PM="dnf"
    packages=("${packages_dnf[@]}")
    update_cmd="sudo dnf makecache"
    install_cmd="sudo dnf -y install"
elif command -v zypper >/dev/null 2>&1; then
    PM="zypper"
    packages=("${packages_zypper[@]}")
    update_cmd="sudo zypper refresh"
    install_cmd="sudo zypper -y install"
else
    echo "No compatible package manager found (apt/dnf/pacman/zypper)."
    exit 1
fi

echo "==> Detected package manager: $PM"

###############################################################################
# 3. Docker CE
###############################################################################
install_docker_apt() {
    # Official Docker CE apt repository
    . /etc/os-release
    local docker_id="${ID:-ubuntu}"
    local docker_codename="${UBUNTU_CODENAME:-${VERSION_CODENAME:-}}"

    # Ubuntu derivatives (Pop!_OS, Linux Mint, Elementary OS, KDE Neon)
    if [[ "$docker_id" =~ ^(pop|mint|linuxmint|elementary|neon)$ ]]; then
        docker_id="ubuntu"
    fi

    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL "https://download.docker.com/linux/$docker_id/gpg" | \
        sudo gpg --dearmor --yes -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/$docker_id $docker_codename stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io \
        docker-buildx-plugin docker-compose-plugin
}

install_docker_dnf() {
    # Official Docker CE dnf repository
    sudo curl -sLfo /etc/yum.repos.d/docker-ce.repo \
        https://download.docker.com/linux/fedora/docker-ce.repo
    sudo dnf -y install docker-ce docker-ce-cli containerd.io \
        docker-buildx-plugin docker-compose-plugin
    sudo systemctl enable --now docker
}

install_docker_arch() {
    # Arch/OpenSUSE ship Docker CE in their official repos
    $install_cmd docker docker-compose
    sudo systemctl enable --now docker
}

echo "==> Installing Docker CE..."
case "$PM" in
    apt)            install_docker_apt  ;;
    dnf)            install_docker_dnf  ;;
    pacman|paru)    install_docker_arch ;;
    zypper)         install_docker_arch ;;
esac

# Allow running docker without sudo (takes effect after re-login)
getent group docker >/dev/null || sudo groupadd docker
sudo usermod -aG docker "$USER"

###############################################################################
# 4. Install packages
###############################################################################
echo "==> Installing packages..."
eval "$update_cmd"

not_found_packages=()
for pkg in "${packages[@]}"; do
    if ! eval "$install_cmd $pkg"; then
        not_found_packages+=("$pkg")
    fi
done

# Debian/Ubuntu name the binaries batcat/fdfind; link them to bat/fd
if [ "$PM" = "apt" ]; then
    command -v bat    >/dev/null 2>&1 || command -v batcat >/dev/null 2>&1 && \
        sudo ln -sf "$(command -v batcat)" /usr/local/bin/bat
    command -v fd     >/dev/null 2>&1 || command -v fdfind >/dev/null 2>&1 && \
        sudo ln -sf "$(command -v fdfind)" /usr/local/bin/fd
fi

###############################################################################
# 5. Fallback installers (tools missing from some distro repos)
###############################################################################
command -v starship >/dev/null 2>&1 || \
    curl -sS https://starship.rs/install.sh | sh -s -- -y

command -v atuin >/dev/null 2>&1 || \
    curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

# superfile (terminal file manager, `spf`) - not in distro repos yet
command -v spf >/dev/null 2>&1 || \
    bash -c "$(curl -sLo- https://superfile.dev/install.sh)"

# lazydocker - not in Fedora/apt repos; official script installs to ~/.local/bin
command -v lazydocker >/dev/null 2>&1 || \
    curl -sL https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# lazygit - not in Fedora repos; install the latest GitHub release binary
if ! command -v lazygit >/dev/null 2>&1; then
    LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep -Po '"tag_name": "v\K[^"]*')
    curl -sLo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar -xzf /tmp/lazygit.tar.gz -C /tmp lazygit
    install -m 0755 /tmp/lazygit ~/.local/bin/lazygit
    rm -f /tmp/lazygit.tar.gz /tmp/lazygit
fi

###############################################################################
# 6. Default shell
###############################################################################
if [ "$SHELL" != "$(command -v zsh)" ]; then
    echo "==> Setting zsh as the default shell..."
    chsh -s "$(command -v zsh)" "$USER"
fi

###############################################################################
# Report
###############################################################################
if [ ${#not_found_packages[@]} -ne 0 ]; then
    echo ""
    echo "The following packages were not found in the distro repos:"
    for pkg in "${not_found_packages[@]}"; do
        echo " - $pkg"
    done
    echo "Install them manually (cargo, upstream installers, etc.) if needed."
fi

echo ""
echo "==> Done! Log out and back in (for docker group + default shell),"
echo "    then start zsh — zinit will auto-install the plugins on first run."
