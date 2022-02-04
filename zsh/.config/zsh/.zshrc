setopt HIST_SAVE_NO_DUPS	# Do not write a duplicate event to the history file.

source $ZDOTDIR/completion.zsh
source $HOME/.cargo/env

setopt AUTO_PUSHD		# Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS	# Do not store duplicates in the stack
setopt PUSHD_SILENT		# Do not print the directory stack after pushd or popd

# Vi mode
bindkey -v
export KEYTIMEOUT=1

source $ZDOTDIR/aliases

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


fpath+=${ZDOTDIR:-~}/.zsh_functions

source ~/.config/zsh/.zsh_plugins.sh
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

neofetch
