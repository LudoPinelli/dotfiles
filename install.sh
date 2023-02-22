#!/bin/bash

sudo add-apt-repository ppa:fish-shell/release-3
sudo apt update && sudo apt upgrade
sudo apt install fish
sudo apt install stow plocate

# PROGRAMMATION
sudo apt install build-essential pkg-config libssl-dev shellcheck
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
# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm ~/lazigit
rm ~/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz

# CLI Apps
cargo install --locked bat
cargo install exa
cargo install fd-find
cargo install ripgrep
cargo install zoxide --locked
cargo install --locked zellij
cargo install git-delta
cargo install starship --locked
cargo install du-dust
cargo install grex
cargo install procs
cargo install --locked navi
cargo install macchina
cargo install vivid
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

# set fish as default shell
command -v fish | sudo tee -a /etc/shells
sudo chsh -s $(which fish) $USER
