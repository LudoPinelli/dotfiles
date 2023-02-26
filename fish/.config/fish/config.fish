# Path
fish_add_path ~/.cargo/bin/
fish_add_path ~/scripts/
fish_add_path ~/.local/bin/
fish_add_path ~/.nvm/versions/node/v19.7.0/bin/

# Abbreviations & aliases
alias xy "xclip -selection clipboard"
alias xp "xclip -selection clipboard -o"
abbr -a yp "pwd|xy" # copy current path
abbr -a pp "xp"

alias ls "exa -F --group-directories-first --icons"
alias ll "exa -lhF --group-directories-first --git --icons"
alias la "exa -ahF --group-directories-first --icons"
alias lla "exa -lahF --group-directories-first --git --icons"
alias lt "exa -hT --level=3 --long --git --icons"
alias lta "exa -aT --ignore-glob='.git' --level=3 --long --git --icons"

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
abbr -a vdev "nvim --cmd 'set rtp+ .'"
abbr -a r "ranger"
abbr -a weather "clear && curl wttr.in"
abbr -a mind "nvim +MindOpenMain"

alias df="df --human-readable"

abbr -a du "clear && dust"

alias gu="gitui -t macchiato.ron"

alias gt "git status"
alias gb "git branch"
alias gw "git switch"

abbr -a neoc "cd ~/dotfiles/neovim/.config/nvim"

alias ze "zellij -l compact"

abbr -a py "python3"

abbr -a neo "clear && neofetch"

function gi
  # Write .gitignore file for the given language
  # example: ign Rust
  gibo dump $argv >> .gitignore
end

abbr -a cnc "cargo_cli_setup.sh"

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

# Vi mode
# function my_vi_bindings
#   fish_vi_key_bindings
#   bind -M insert -m default jk backward-char force-repaint
# end
# set -g fish_key_bindings my_vi_bindings

# Start Starship prompt
function starship_transient_rprompt_func
  starship module time
end
starship init fish | source
enable_transience
