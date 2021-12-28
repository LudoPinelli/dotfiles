# Aliases
alias ls='lsd'
alias ll='ls -lF'
alias la='ls -laF'
alias lt='ls --tree'

alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'

alias c='clear'
alias s='cd ..'

alias v='nvim'

alias df='df --human-readable'
alias du='du --human-readable'

alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'

alias lg='lazygit'
alias trash-empty='trash-empty -trash-dir=/home/ludo/.local/share/Trash'
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

# Launch Starship
eval "$(starship init zsh)"
