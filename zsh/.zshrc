# Aliases

alias ls='exa -lF --git-ignore --group-directories-first --git --icons'
alias la='exa -laF --group-directories-first --git --icons'
alias lt='exa -T --level=2 --long --icons'
alias lta='exa -aT --level=2 --long --icons'

alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'

alias c='clear'
alias s='z ..'

alias v='nvim'

alias df='df --human-readable'
alias du='du --human-readable'

# https://gihub.com/EzeeLinux/up-debian_ubuntu_update_toolt
alias up='up --clean'

alias lg='lazygit'
alias gu='gitui'

alias trash-empty='trash-empty -trash-dir=/home/ludo/.local/share/Trash'

alias gt='git status'
alias gb='git branch'

alias neoc='cd ~/.dotfiles/neovim/.config/nvim/'

# Path
export PATH=~/.local/bin:~/.cargo/bin:~/.nvm/versions/node/v17.3.0/bin:~/.local/share/nvim/lsp_servers/rust:$PATH

# Ctrl+space to accept autosuggestions
bindkey '^ ' autosuggest-accept
# Up/Down to search through history with zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Default editor
export EDITOR=nvim

# Source plugins
# To install new plugins, add repo to .zsh_plugins.txt then run :
# antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
source ~/.zsh_plugins.sh

# Launch zoxide
eval "$(zoxide init zsh)"

# Launch Starship
eval "$(starship init zsh)"
