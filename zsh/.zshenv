export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export EDITOR="nvim"
export VISUAL="nvim"
export PAGER=bat
export BROWSER='librewolf'
# Open man pages in nvim
export MANPAGER="nvim +Man!"
export TERMINAL="kitty"
export TERM="xterm-256color"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

export PATH=~/.local/kitty.app/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/scripts:$PATH
export PATH=~/node_modules/.bin/:$PATH

. "$HOME/.cargo/env"
