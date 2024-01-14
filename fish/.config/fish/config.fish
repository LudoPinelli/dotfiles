# Remove greetings
set fish_greeting 

# Environnement
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$XDG_CONFIG_HOME/local/share"
set -gx XDG_CACHE_HOME "$XDG_CONFIG_HOME/cache"

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER bat
set -gx MANPAGER "nvim +Man!"

set -gx CARGO_REGISTRIES_CRATES_IO_PROTOCOL sparse

# Path
fish_add_path ~/.cargo/bin/
fish_add_path ~/scripts/
fish_add_path ~/.local/bin/
fish_add_path ~/.nvm/versions/node/v19.7.0/bin/
fish_add_path ~/.local/zig/

# Abbreviations & aliases
alias xy "xclip -selection clipboard"
alias xp "xclip -selection clipboard -o"
abbr -a yp "pwd|xy" # copy current path
abbr -a pp "xp"

alias ls "eza -F --group-directories-first --icons=auto"
alias ll "eza -lhF --group-directories-first --git --icons=auto"
alias la "eza -ahF --group-directories-first --icons=auto"
alias lla "eza -lahF --group-directories-first --git --icons=auto"
alias lt "eza -hT --level=3 --icons=auto"
alias lta "eza -aT --ignore-glob='.git' --level=3 --icons=auto"
alias llt "eza -hT --level=3 --long --git --icons=auto"
alias llta "eza -alT --ignore-glob='.git' --level=3 --git --icons"

alias rm "rm -if"
alias rmd "rm -rfi"
alias mv "mv -iv"
alias cp "cp -riv"
alias mkdir "mkdir -vp"

abbr -a c "clear"
alias s "cd .."

abbr -a cat "bat"

abbr -a v "nvim"
abbr -a vt "nvim +terminal"

abbr -a weather "clear && curl wttr.in"

alias df "df --human-readable"

abbr -a du "clear && dust"

alias gu "gitui -t mocha.ron"
alias lg "lazygit"

alias gt "git status"
alias gb "git branch"
alias gw "git switch"
alias ga "git add --patch"

abbr -a dot "cd ~/dotfiles"
abbr -a neoc "cd ~/dotfiles/neovim/.config/nvim"

alias zel "zellij"

abbr -a py "python3"

abbr -a neo "clear && neofetch"

abbr -a music "mpv --no-video --shuffle ~/Musique/"

function gi
  # Write .gitignore file for the given language
  # example: ign Rust
  gibo dump $argv >> .gitignore
end

# Rust
alias cwatch "cargo watch -q -c -x 'run -q'"
abbr -a cnc "cargo_cli_setup.sh"

alias zup "zellij run -d right -- up"
alias cb "zellij edit ~/dev/neovim/comment-box.nvim/lua/comment-box/init.lua"

# Vi mode
function my_vi_bindings
  fish_vi_key_bindings
  bind -M insert -m default jk backward-char force-repaint
end
set -g fish_key_bindings my_vi_bindings

# Start Starship prompt
function starship_transient_rprompt_func
  starship module time
end
starship init fish | source

# Start zoxide
enable_transience
zoxide init fish | source
alias cd "z"

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/ludo/.ghcup/bin $PATH # ghcup-env
