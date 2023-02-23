if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (zellij setup --generate-auto-start fish | string collect)
end

# Path
fish_add_path ~/.cargo/bin/
fish_add_path ~/scripts/

# Abbreviations
source ~/.config/fish/abbrev

# Remove greetings
set fish_greeting 

# Vi mode
function my_vi_bindings
  fish_vi_key_bindings
  bind -M insert -m default jk backward-char force-repaint
end
set -g fish_key_bindings my_vi_bindings

# Start Starship prompt
starship init fish | source
