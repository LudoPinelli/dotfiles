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
fish_vi_key_bindings

# Start Starship prompt
starship init fish | source
