# Default editor
export VISUAL=nvim
export EDITOR="$VISUAL"
export BROWSER=wslview
export PAGER=bat

# Path
export PATH=~/.local/bin:~/bin:$PATH
export PATH=~/.cargo/bin:$PATH
export PATH=~/.local/share/nvim/lsp_servers/rust:$PATH
export PATH=~/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin:$PATH
export PATH=~/.nvm/versions/node/v17.3.0/bin/:$PATH

# history
HIST_STAMPS="%d/%m/%y %T"
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.zsh_history

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
unsetopt histverify

# autocd
setopt autocd
cdpath=($HOME/.dotfiles $HOME/dev)

# Open man pages in nvim
export MANPAGER="nvim +Man!"

# Aliases

alias -s txt=nvim
alias -s md=nvim
alias -s log=nvim
alias -s lua=nvim
alias -s js=nvim
alias -s rs=nvim

alias ls="exa -F --git-ignore --group-directories-first"
alias ll="exa -lhF --git-ignore --group-directories-first --git"
alias la="exa -ahF --group-directories-first"
alias lla="exa -lahF --group-directories-first --git"
alias lt="exa -hT --level=2 --long --git"
alias lta="exa -aT --level=2 --long"

alias rm="rm -i"
alias mv="mv -iv"
alias cp="cp -riv"
alias mkdir="mkdir -vp"

alias c="clear"
alias s="z .."

alias cat="bat"

alias v="nvim"
alias vdev="nvim --cmd 'set rtp+=.'"


alias df="df --human-readable"
alias du="dust"

# https://gihub.com/EzeeLinux/up-debian_ubuntu_update_toolt
alias up="up --clean"

alias lg="lazygit"

alias htop="btm"

alias gt="git status"
alias gb="git branch"

function gw {
  git switch $1
}

function gd {
  git branch -d $1
}

alias neoc="z ~/.dotfiles/neovim/.config/nvim/"
alias windoc="z /mnt/c/Users/ludov/OneDrive/"

alias zsh="echo 'sourcing ~/.zshrc...' && source ~/.zshrc"
alias zrc="$EDITOR ~/.zshrc"

alias matrix="cmatrix -a -C magenta"

function gi {
  # Write .gitignore file for the give language
  # example: ign Rust
  gibo dump $1 >> .gitignore
}

# Configure zsh-vi-mode
function zvm_config() {
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
}

# Up/Down to search through history with zsh-history-substring-search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Ctrl+space to accept autosuggestions
bindkey "^ " autosuggest-accept

# Launch zoxide
eval "$(zoxide init zsh)"

# Launch Starship
eval "$(starship init zsh)"

# Source plugins
# To install new plugins, add repo to .zsh_plugins.txt then run :
# antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
source ~/.zsh_plugins.sh

