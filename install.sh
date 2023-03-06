#!/bin/bash

sudo add-apt-repository ppa:fish-shell/release-3
sudo apt update && sudo apt upgrade
sudo apt install fish
sudo apt install stow plocate hyperfine

# install WezTerm
mkdir Installs && cd Installs/
curl -LO https://github.com/wez/wezterm/releases/download/nightly/wezterm-nightly.Ubuntu22.04.deb
sudo apt install -y ./wezterm-nightly.Ubuntu22.04.deb
rm -if wezterm-nightly.Ubuntu22.04.deb

# PROGRAMMATION
sudo apt install build-essential pkg-config libssl-dev shellcheck meson ninja-build
# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install cargo-update
cargo install cargo-watch
cargo install cargo-edit
# Python
sudo apt install python3-pip python3-venv
python3 -m pip install --upgrade pip
pip3 install virtualenv
python3 -m pip install flake8
pip install bpython
# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
# node
nvm install node
# tools
cargo install shellharden
cargo install stylua
cargo install taplo-cli --locked
npm install --save-dev --save-exact prettier

# CLI Apps
cargo install --locked bat
cargo install exa
cargo install fd-find
cargo install ripgrep
cargo install --locked zellij
cargo install git-delta
cargo install starship --locked
cargo install du-dust
cargo install grex
cargo install procs
cargo install zoxide
cargo install tealdeer
# configure tealdeer
tldr --seed-config
tldr --update
# neovim
sudo apt-get install sofware-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
sudo npm install -g neovim
# Glow
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install glow
# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# Image viewer
sudo apt install imv

# set fish as default shell
command -v fish | sudo tee -a /etc/shells
sudo chsh -s $(which fish) $USER

# install plugin manager for fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
# install fish plugins
# fisher install FabioAntunes/fish-nvm edc/bass
# fisher install PatrickF1/fzf.fish
# fisher install jorgebucaran/autopair.fish
# fisher install jethrokuan/z

# update bat cache after clone dotfile repo:
# bat cache --build

# Install lf
curl -L https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz | tar xzC ~/.local/bin
# Install ctpv
git clone https://github.com/NikitaIvanovV/ctpv
cd ctpv
sudo make install
cd ..
sudo rm -rf ctpv
