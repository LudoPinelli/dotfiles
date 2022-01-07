---
pandoc_:
  - to: html
  - highlight-style: pygments
  - standalone: true
---

# dotfiles

Just a repo of my dotfiles. The only thing that can be of interest is the Neovim config in _lua_ for both Linux and Windows.

# Neovim

![Neovim](imgs/landing.png?raw=true)

## Requirements

- Neovim-Nightly (the configuration takes advantage of the latest features like the use of ftplugin.lua instead of ftplugin.vim)

### Linux

Most of them are probably already installed on your system

- _curl_
- a c compiler (_cc_, _gcc_, _clang_, _cl_, _zig_)
- _node_
- _git_ (obviously)
- _ripgrep_
- _fd_
- _sh_
- _tar_
- _gzip_
- _python3_ & _pip3_
- _npm_
- _plocate_ or _locate_

**Note**: this configuration is ready for lua, Rust, Python, shell scripts and javascript (but you can remove/add anything you want).
null_ls requires the following linter/formatter in order to format the code for those languages:

- _stylua_ (lua)
- _autopep8_ (Python)
- _prettier_ (javascript, html, css, and others)
- _shellharden_ (shell script)
- _shellcheck_ (shell script)
- _taplo_ (fichiers toml)

### Windows

Same as Linux (most of them can be installed via _chocolatey_ and/or _scoop_), execpt:

- _sh_, _shellharden_, _shellcheck_ Not relevant on Windows
- _locate/plocate_ Does not exist for Windows which means that the _repo_ extension for _Telescope_ won't be available
