## Overview

This is my personal dotfile repository which is under active development. I am still trying to figure out the best software/plugins to use, so things may change over time. The main criterias for my dot files is to be **minimalistic** (and therefore lightweight) while providing the necessary functionality.

Main settings are concerned:
* prezto
* zsh
* tmux
* vim

## Requirements

* `git`
* `zsh`
* `chsh`
* `vim`
* `tmux`

## Installation  

To perform the download, run from terminal:  

```bash
git clone https://github.com/vicrucann/dotfiles.git  
cd dotfiles
bash install.sh
bash install-tmux.sh
```

**Note 1**: If you install on clean terminal, you can say *yes* to all of the installation steps. One of the main reasons of those steps is so that to not re-install a package if you already have it, for example, when you try to upgrade the configuration, there is no need to re-install Prezto.

**Note 2**: During the installation you might see error messages related to *vim*, especially if you do clean install. You can ignore them since they occur because you do not have the necessary vim config files (*E185: Cannot find color scheme 'solarized'*) yet.

Assuming your installation is complete, re-run your shell and enjoy its new functionality.

#### Installation steps - description

1. Prezto installation from official github source
2. Removal of previous symbolic links from `$HOME` such as `.vimrc`, `.zshrc`, `.tmux.conf` etc. 
3. Symbolic link creation. The `install.sh` checks for the terminal type (`cygwin` vs. `linux`) and uses corresponding command to create the symbolic link.
4. Any *vim* setting removal: files at `$HOME` directory, as well as from `.vim` directory
5. *Vundle* installation from official github source
5. *vim* plugin installation using *Vundle*

## Configuration files

#### Vim plugins
* Plugin management: [Vundle](https://github.com/VundleVim/Vundle.vim)
* Color scheme: Gruvbox
* File viewer: [NERDTree](https://github.com/scrooloose/nerdtree) - maybe will be replaced by [CtrlP](https://github.com/kien/ctrlp.vim)
* Status bar: [vim-airline](https://github.com/bling/vim-airline)
* Working with code: 
    * Code comments - [NERDCommenter](https://github.com/scrooloose/nerdcommenter) 
    * Syntax check - [syntastic](https://github.com/scrooloose/syntastic) 
    * Enhanced C++ highlights - [vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)

#### zsh
* Based on Prezto  
* Custom prompt configuration: [viruca](://github.com/vicrucann/dotfiles/blob/master/viruca.zsh-theme)

#### Tmux
* Replaced some basic key bindings for easier reach, e.g., `<C>b` is replaced by `<C>a`

## Prefixes, paths, help

* Tmux prefix: `<C>a`. 
* Vim prefix: `\` (e.g. when using with `NERDCommenter`, etc.).
* To open **vim command tips**, open vim and then in *normal* mode: `\?`. Use `<C>w+<up>` and `<C>w+<down>` to naviage between the main vim window and the open **vim tips** window.
* Zsh variable: `$dots` is the path for the `~/github/dotfiles`.

#### Tmux

`<C>a |` - split the screen in half vertically  
`<C>a -` - split the pane in half horizontally  
`<C>a h` or `<C>a j` or `<C>a k` or `<C>a l` - jump the between the panes   
`<C>-a <up>\<down>\<left>\<right>` - move between the open panes  
`<C>a H` or `<C>a J` or `<C>a K` or `<C>a L` - resize the panes   
`<C>a <tab>` or `<C>a <backspace>` - toggle/untoggle and bring focus to sidebar with directory tree 
`<C>a [` scroll withint the tmux buffer. `Esc` - quit the scrolling mode.
`<C>a r` - reload the current tmux config  
`<C>d` - close current window  
`<C>a c` - open up another window  
`<C>a n` - go to the next window  
`$ tmux ls` - in terminal: check what Tmux sessions are running  





