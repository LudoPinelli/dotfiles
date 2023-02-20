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

# source antidote (plugin manager)
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
# initialize plugins
antidote load

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# vivid
export LS_COLORS="$(vivid generate catppuccin-macchiato)"

# Zoxide
_z_cd() {
    cd "$@" || return "$?"

    if [ "$_ZO_ECHO" = "1" ]; then
        echo "$PWD"
    fi
}

z() {
    if [ "$#" -eq 0 ]; then
        _z_cd ~
    elif [ "$#" -eq 1 ] && [ "$1" = '-' ]; then
        if [ -n "$OLDPWD" ]; then
            _z_cd "$OLDPWD"
        else
            echo 'zoxide: $OLDPWD is not set'
            return 1
        fi
    else
        _zoxide_result="$(zoxide query -- "$@")" && _z_cd "$_zoxide_result"
    fi
}

zi() {
    _zoxide_result="$(zoxide query -i -- "$@")" && _z_cd "$_zoxide_result"
}


alias za='zoxide add'

alias zq='zoxide query'
alias zqi='zoxide query -i'

alias zr='zoxide remove'
zri() {
    _zoxide_result="$(zoxide query -i -- "$@")" && zoxide remove "$_zoxide_result"
}


_zoxide_hook() {
    zoxide add "$(pwd -L)"
}

chpwd_functions=(${chpwd_functions[@]} "_zoxide_hook")
eval "$(zellij setup --generate-auto-start zsh)"
