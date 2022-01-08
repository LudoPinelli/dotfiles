# Default editor
export EDITOR=nvim
export VISUAL=nvim

# Path
export PATH=~/.local/bin:~/bin:~/.cargo/bin:~/.nvm/versions/node/v17.3.0/bin:$PATH
export PATH=~/.local/share/nvim/lsp_servers/rust:$PATH
export PATH=~/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin:$PATH
export PATH=~/.nvm/versions/node/v17.3.0/bin/:$PATH

# Aliases

alias ls="exa -lF --git-ignore --group-directories-first --git"
alias la="exa -laF --group-directories-first --git"
alias lt="exa -T --level=3 --long"
alias lta="exa -aT --level=3 --long"

alias rm="rm -I"
alias mv="mv -iv"
alias cp="cp -riv"
alias mkdir="mkdir -vp"

alias c="clear"
alias s="z .."

alias v="nvim"

alias df="df --human-readable"
alias du="du --human-readable"

# https://gihub.com/EzeeLinux/up-debian_ubuntu_update_toolt
alias up="up --clean"

alias lg="lazygit"
alias gu="gitui"

alias trash-empty="trash-empty -trash-dir=/home/ludo/.local/share/Trash"

alias gt="git status"
alias gb="git branch"

alias neoc="cd ~/.dotfiles/neovim/.config/nvim/"

alias zsh="source ~/.zshrc"
alias zrc="$EDITOR ~/.zshrc"

alias matrix="cmatrix -a -C magenta"

# Ctrl+space to accept autosuggestions
bindkey "^ " autosuggest-accept

# Command line edition
bindkey -e
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^E" edit-command-line

# Up/Down to search through history with zsh-history-substring-search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Source plugins
# To install new plugins, add repo to .zsh_plugins.txt then run :
# antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
source ~/.zsh_plugins.sh

# Launch zoxide
eval "$(zoxide init zsh)"

# Launch Starship
eval "$(starship init zsh)"
