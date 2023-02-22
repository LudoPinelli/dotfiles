if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (zellij setup --generate-auto-start fish | string collect)
end

fish_add_path ~/.cargo/bin/
source ~/.config/fish/abbrev

set fish_greeting

starship init fish | source
