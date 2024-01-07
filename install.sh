#!/usr/bin/env sh

# Function to log not found packages
log_not_found_packages() {
    echo "The following packages were not found:"
    for pkg in "${not_found_packages[@]}"; do
        echo " - $pkg"
    done
}

# Downloading Configuration Files
curl -sLfo ~/.p10k.zsh https://raw.githubusercontent.com/ali-commits/dotfiles/master/p10k/p10k.zsh
curl -sLfo ~/.zshrc https://raw.githubusercontent.com/ali-commits/dotfiles/master/zshrc
curl -sLfo ~/.vimrc https://raw.githubusercontent.com/ali-commits/dotfiles/master/vimrc
curl -sLfo ~/.config/neofetch/config.conf https://raw.githubusercontent.com/ali-commits/dotfiles/master/neofetch/neofetch --create-dirs
# curl -sLfo ~/.config/latte/mcOS-BS-Large.layout.latte https://raw.githubusercontent.com/ali-commits/dotfiles/master/latte/mcOS-BS-Large.layout.latte --create-dirs

# Package list
packages=(
    docker
    docker-compose
    zsh
    grc
    neofetch
    neovim
    exa
    ripgrep
    bat
    zoxide
    bpython
    mtr

    # Add or remove packages as needed
)

# Initialize array for not found packages
not_found_packages=()

# Function to install packages using a specific package manager
install_packages() {
    local pkg_manager=$1
    local install_cmd=$2
    local update_cmd=$3

    # Update repositories
    eval "$update_cmd"

    # Try to install each package individually
    for pkg in "${packages[@]}"; do
        if ! eval "$install_cmd $pkg"; then
            not_found_packages+=("$pkg")
        fi
    done
}

# Detect package manager and install packages
if command -v apt >/dev/null 2>&1; then
    install_packages "apt" "sudo apt install -y" "sudo apt update"
elif command -v paru >/dev/null 2>&1; then
    install_packages "paru" "paru -S --noconfirm --needed" "paru -Syyyuu"
elif command -v pacman >/dev/null 2>&1; then
    install_packages "pacman" "sudo pacman -S --noconfirm --needed" "sudo pacman -Syyuu"
elif command -v dnf >/dev/null 2>&1; then
    install_packages "dnf" "sudo dnf -y install" "sudo dnf -y update"
elif command -v zypper >/dev/null 2>&1; then
    install_packages "zypper" "sudo zypper -y install" "sudo zypper -y update"
elif command -v yum >/dev/null 2>&1; then
    install_packages "yum" "sudo yum -y install" "sudo yum -y update"
else
    echo "No compatible package manager found."
    exit 1
fi



# Docker group configuration
sudo groupadd docker && sudo usermod -aG docker $USER

# Create 'legend' group and configure sudoers
sudo groupadd legend
sudo usermod -aG legend $USER

# Configure sudoers to allow 'legend' group members to use sudo without a password
# Note: Using 'tee' command as a safer way to modify sudoers
echo "%legend ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/legend

# Log not found packages
if [ ${#not_found_packages[@]} -ne 0 ]; then
    log_not_found_packages
fi
