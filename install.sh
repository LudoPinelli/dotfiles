#!/bin/bash

sudo apt install build-essential pkg-config libssl-dev zsh shellcheck
sudo apt install stow plocate pandoc

# Python
sudo apt install python3-pip python3-venv
python3 -m pip install --upgrade pip
pip3 install virtualenv
python3 -m pip install flake8
pip install bpython

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# various cli softwares
cargo install --locked bat
cargo install exa
cargo install fd-find
cargo install ripgrep
cargo install cargo-update
cargo install cargo-watch
cargo install cargo-edit
cargo install zoxide --locked
cargo install --locked zellij
cargo install git-delta
cargo install starship --locked
cargo install du-dust
cargo install grex
cargo install procs
cargo install stylua
cargo install shellharden
cargo install tealdeer
cargo install taplo-cli --locked
# configure tealdeer
tldr --seed-config
tldr --update

# Configure zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER

# install antidote (zsh plugin manager)
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote

# installation de neovim
sudo apt-get install sofware-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
# node
nvm install node

# installation de prettier
npm install --save-dev --save-exact prettier

sudo npm install -g neovim

# installation de lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm ~/lazigit
rm ~/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz

# installation de Glow
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install glow
