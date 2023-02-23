if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (zellij setup --generate-auto-start fish | string collect)
end

# Path
fish_add_path ~/.cargo/bin/
fish_add_path ~/scripts/
fish_add_path ~/.local/bin/

# Abbreviations
source ~/.config/fish/abbrev

# Remove greetings
set fish_greeting 

# Environement
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$XDG_CONFIG_HOME/local/share"
set -gx XDG_CACHE_HOME "$XDG_CONFIG_HOME/cache"

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER bat
set -gx MANPAGER "nvim +Man!"

# set -gx TERMINAL kitty
set -gx TERM "xterm-256color"

# Vi mode
function my_vi_bindings
  fish_vi_key_bindings
  bind -M insert -m default jk backward-char force-repaint
end
set -g fish_key_bindings my_vi_bindings

# Start Starship prompt
starship init fish | source
