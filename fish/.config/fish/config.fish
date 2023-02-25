# Path
fish_add_path ~/.cargo/bin/
fish_add_path ~/scripts/
fish_add_path ~/.local/bin/
fish_add_path ~/.nvm/versions/node/v19.7.0/bin/

# Abbreviations
abbr -a xy "xclip -selection clipboard"
abbr -a xp "xclip -selection clipboard -o"
abbr -a yp "pwd|xy && echo 'Current path copied'"
abbr -a pp "xp"

abbr -a ls "exa -F --group-directories-first --icons"
abbr -a ll "exa -lhF --group-directories-first --git --icons"
abbr -a la "exa -ahF --group-directories-first --icons"
abbr -a lla "exa -lahF --group-directories-first --git --icons"
abbr -a lt "exa -hT --level=3 --long --git --icons"
abbr -a lta "exa -aT --ignore-glob='.git' --level=3 --long --git --icons"

abbr -a rm "rm -if"
abbr -a rmd "rm -rfi"
abbr -a mv "mv -iv"
abbr -a cp "cp -riv"
abbr -a mkdir "mkdir -vp"

abbr -a c "clear"
abbr -a s "cd .."

abbr -a cat "bat"

abbr -a v "nvim"
abbr -a vt "nvim +terminal"
abbr -a vdev "nvim --cmd 'set rtp+ .'"
abbr -a r "ranger"
abbr -a weather "clear && curl wttr.in"

abbr -a df "df --human-readable"

abbr -a du "clear && dust"

abbr -a lg "lazygit"

abbr -a gt "git status"
abbr -a gb "git branch"
abbr -a gw "git switch"

abbr -a neoc "cd ~/.dotfiles/neovim/.config/nvim"

abbr -a ze "zellij -l compact"

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

# set -gx TERMINAL kitty
set -gx TERM "xterm-256color"

# Vi mode
# function my_vi_bindings
#   fish_vi_key_bindings
#   bind -M insert -m default jk backward-char force-repaint
# end
# set -g fish_key_bindings my_vi_bindings

# Start Starship prompt
starship init fish | source
