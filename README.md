<h1 align="center">dotfiles</h1>

![Neovim in action](./imgs/title.png?raw=true)
Just a repo of my dotfiles.

:warning: The _Neovim_ configuration is OS "aware" and works on both Linux and Windows, however I didn't test everything on Windows.

# Table of Contents

- [Neovim](#neovim)
  - [Main Features](#main-features)
    - [Dealing With Files/Buffers](#dealing-with-filesbuffers)
    - [Writing/Editing](#writingediting)
    - [Git](#git)
    - [Terminal](#terminal)
    - [Some help at any stage at my fingertips](#some-help-at-any-stage-at-my-fingertips)
    - [UI Enhancements](#ui-enhancements)
    - [Plugin Management](#plugin-management)
    - [Others](#others)
  - [Performances](#performances)
  - [Requirements](#requirements)
    - [Linux](#linux)
    - [Windows](#windows)
- [Zsh](#zsh)
  - [Some Tools](#some-tools)
  - [Prompt](#prompt)

# Neovim

## Main Features

### Dealing With Files/Buffers

- **Finding files**: [Telescope](https://github.com/nvim-telescope/telescope.nvim) - _The_ Swiss army knife to find anything I want. Not only files, but also help, diagnostics, commands, key maps and a lot more, and I can even easily write my own pickers. Very intuitive, highly configurable, a _must have_.
- **Browsing files**: [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) 

### Writing/Editing

- **Dealing with (), [], {} & co**: [nvim-autopairs](https://github.com/windwp/nvim-autopairs)/[surround.vim](https://github.com/tpope/vim-surround) - The former for automatic closing, no need to present the later since nearly every (Neo)vim user has it in his tool set!
- **Commenting**: [Comment.nvim](https://github.com/numToStr/Comment.nvim) - comment/uncomment line or blocks with a few keystrokes.
- **Clipboard manager**: [neoclip](https://github.com/AckslD/nvim-neoclip.lua) - Records everything that gets yanked. I don't know you, but I find registers as powerful as they are painful to use :)
- **LSP/Completion engine**: [cmp-treesitter,](https://github.com/ray-x/cmp-treesitter) [lspconfig](https://github.com/neovim/nvim-lspconfig)/[lsp-installer](https://github.com/williamboman/nvim-lsp-installer/), [Mason](https://github.com/williamboman/mason.nvim), [nvim-cmp](https://github.com/hrsh7th/nvim-cmp), [null_ls](https://github.com/jose-elias-alvarez/null-ls.nvim), [Trouble](https://github.com/folke/trouble.nvim)... - Everything needed to autocomplete, have hints and help, diagnostics, code actions, advanced highlighting, add/remove languages and more. Easily accessible and nicely presented.
- **Snippet engine**: [LuaSnip](https://github.com/L3MON4D3/LuaSnip)/[friendly-snippets](https://github.com/rafamadriz/friendly-snippets) Powerful snippet engine and a huge collection of them.
- **Jumping around**: [Leap](https://github.com/ggandor/leap.nvim) - To jump to any visible part of the document in a couple of keystrokes.
- **Markdown goodies**: [markdown-preview](https://github.com/iamcco/markdown-preview.nvim) - For direct preview in the browser with automatic updates.

### Git

- **Dealing with hunks**: [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) Visual signs of changes in the buffer, operations on hunks: stage/unstage, revert, etc.
- **Everything else**: I just bring _GitUi_ or _LazyGit_ in _Neovim_ via _toggleterm_ (see below).

### Terminal

- [Toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) - It has more than what I could dream of: a terminal in a vertical/horizontal window or in a float one, any number of terminals open at the same time, processes running in the background when hidden, access to any CLI app with a key binding... Configurable and really easy to write any custom terminal I want.

### Some help at any stage at my fingertips

Beside the help for coding brought by _lspconfig_, _lsp-signature_ and the others already covered:

- **Key bindings**: With [which-key.nvim](https://github.com/folke/which-key.nvim) nearly every key binding - custom or builtin - is just there.

### UI Enhancements

- **Seeing where I am**: [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) - Nice indentation lignes. Highly customizable.
- **Status Bar**: [lualine](https://github.com/nvim-lualine/lualine.nvim) - Fast, easy to customize.
- **Themes**: I use Catppuccin, which is well designed, beautiful (to me!) and not too high-contrast: [Catppuccin](https://github.com/catppuccin/catppuccin)

### Plugin Management

- [lazy](https://github.com/folke/lazy.nvim) - To rule them all!

### Others

Others plugins operate under the hood to make life easier, see the [plugConfig](./neovim/.config/nvim/lua/plugConfig/) folder for more information

## Requirements

- Latest Neovim stable release (0.8.3 at the time this repo is updated).

### Linux

A lot of them are probably already installed on your system

- [curl](https://github.com/curl/curl)
- a c compiler (_cc_, _gcc_, _clang_, _cl_, _zig_)
- [node](https://nodejs.org/en/)
- [git](https://git-scm.com/) (obviously)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [tar](https://www.gnu.org/software/tar/)
- [gzip](https://www.gnu.org/software/gzip/)
- [python3](https://www.python.org/) & _pip3_
- [npm](https://www.npmjs.com/)
- [plocate](https://plocate.sesse.net/) or [locate](https://www.gnu.org/software/findutils/)
- [pandoc](https://pandoc.org/)

**Note**: this configuration is ready for lua, Rust, Python, shell scripts and javascript (but you can remove/add anything you want).
null_ls requires the following linter/formatter in order to format the code for those languages:

- [stylua](https://github.com/johnnymorganz/stylua) (lua)
- [autopep8](https://pypi.org/project/autopep8/) (Python)
- [prettier](https://github.com/prettier/prettier) (javascript, html, css, and others)
- [shellharden](https://github.com/anordal/shellharden) (shell script)
- [shellcheck](https://www.shellcheck.net/) (shell script)
- [taplo](https://taplo.tamasfe.dev/) (fichiers toml)

### Windows

Same as Linux (most of them can be installed via _chocolatey_ and/or _scoop_), except:

- _sh_, _shellharden_, _shellcheck_ Not relevant on Windows

# Zsh

Nothing fancy configuration wise: a couple of functions, some basic aliases, a few carefully chosen plugins (thanks god, no _oh my Zsh_!) managed by [antidote](https://github.com/mattmc3/antidote), and that's about it. _(For a list of the plugins, see [.zsh_plugins.txt](./zsh/.zsh_plugins.txt))_

## Some Tools

- [exa](https://github.com/ogham/exa): Better, than `ls`, and to me better than [lsd](https://github.com/Peltoche/lsd).
- [zoxide](https://github.com/ajeetdsouza/zoxide): far better than `cd`
- [delta](https://github.com/dandavison/delta): "synthax-highlighting pager for git, diff, and grep output"
- [zellij](https://github.com/zellij-org/zellij): Powerful, simple to use Terminal Multiplexer

## Prompt

- [Starship](https://github.com/starship/starship): "The minimal, blazing-fast, and infinitely customizable prompt for any shell" is just perfect out of the box (I just added date and time because, well, because).

![zsh with exa in action](./imgs/zsh.png?raw=true)
