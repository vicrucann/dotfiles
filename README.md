## Overview

This is my personal dotfile repository which is under active development. I am still trying to figure out the best software/plugins to use, so things may change over time. The main criterias for my dot files is to be **minimalistic** (and therefore lightweight) while providing the necessary functionality. The current configuration was made and works for an old and slow PC under Lubuntu-14.04. 

The latest stable version is accessible through releases; the master branch is a development branch. The configuration files include settings for: 

* LXTerminal (also works for Cygwin terminal): color sceme, command line format, etc.
* ~~oh-my-zsh~~ prezto zsh
* tmux - terminal multiplier
* vim (customized for C++ and Qt development mainly)

Made to work under Lubuntu-14.04, and later tuned to be used with Cygwin.

## Initial printscreens

These are solely examples, the end version might look slightly different.  

![ex-git](https://github.com/vicrucann/dotfiles/blob/master/img/ex-git.png?raw=true "Git repo example")  
\* Inside modified git repository  

![ex-vim](https://github.com/vicrucann/dotfiles/blob/master/img/ex-vim.png?raw=true "Vim and tmux example")  
\* Editing with vim inside tmux session  

## Platforms

* Was made to work under **Lubuntu**-14.04
* Is being tuned to work with **Cygwin** 
	* Note: the Cygwin must be **run as Administrtor** when installing (for symbolic links creation) 
* Is being tested to run with **MinGW**, Windows 7
    * Note: before doing `git clone ...`, make sure the git global setting is put to `git config --global core.autocrlf input` in order to avoid end-of-line `^M` error
    * MinGW does not support `zsh` and `chsh` so it will have a very limited functionality

## Requirements

Most of the packages are present on Linux (Lubuntu) by default. For the Cygwin, make sure your Cygwin installation include:

* `git`
* `zsh`
* `chsh`
* `vim`
* `tmux`
* `mc`
* might be needed some other packages such as `python-dev`, `cmake`, etc. Most of them are already pre-built with Linux, but not necessary with Cygwin.

## Installation  

To perform the download, run from terminal:  

```
$ git clone https://github.com/vicrucann/dotfiles.git  
$ cd dotfiles
$ git submodule update --init --recursive  
```

The installation command for Cygwin (Cygwin **must be run under administrator rights**):
  
```
$ ./install.sh
```

For Linux:
  
```
$ chmod +x install.sh
$ bash install.sh
$ bash install-tmux.sh
$ bash install-sounds.sh
$ bash test_sound.sh
```

**Note 1**: If you install on clean terminal, you can say *yes* to all of the installation steps. One of the main reasons of those steps is so that to not re-install a package if you already have it, for example, when you try to upgrade the configuration, there is no need to re-install Prezto.

**Note 2**: During the installation you might see error messages related to *vim*, especially if you do clean install. You can ignore them since they occur because you do not have the necessary vim config files (*E185: Cannot find color scheme 'solarized'*) yet.

Assuming your installation is complete, re-run your shell and enjoy its new functionality.

#### Installation steps - description

If you do not wish to know the installation step details, skip this section, it only provides a textual description if you want to know what are the installation steps.

1. Prezto installation from official github source
2. Removal of previous symbolic links from `$HOME` such as `.vimrc`, `.zshrc`, `.tmux.conf` etc. Feel free to check file `install.sh` for the full list.
3. Symbolic link creation. The `install.sh` checks for the terminal type (`cygwin` vs. `linux`) and uses corresponding command to create the symbolic link.
4. Any *vim* setting removal: files at `$HOME` directory, as well as from `.vim` directory
5. *Vundle* installation from official github source
5. *vim* plugin installation using *Vundle*
6. Changing the shell from *bash* to *zsh*

#### Troubleshooting

One of the most common problems when trying to run `install.sh` - line encoding is read wrongly by Cygwin (e.g. it treats the file encoding as `dos`, while it is supposed to be `unix`). One of the ways to change to the correct file encoding is:

1. Open the `install.sh` in vim - `vim install.sh`
2. In Vim, assign the correct file encoding to the file - `:w ++ff=unix`
3. Now close the file - `:q` and try to run `install.sh` again 

## Update from source

To update the configuration files, first pull changes from the git repository. Assuming you are inside the `dotfiles` folder in your shell, run the following command:

```
~ dotfiles $ git pull
```

This will fetch all the recent changes.

After that you can run `install.sh` as it was mentioned in *Installation* step above. This time you can answer differently on each installation step question:

1. **No** to install Prezto (optional)
2. **Yes** to remove previous links (necessary)
3. **No** to remove previous vim settings (optional)
4. **Yes** to plugin installation if any new plugins were added to the config settings

## Customization

Info on customizing environment variables, git settings, etc. will be here.

## Configuration files

#### Vim plugins
* Plugin management: [Vundle](https://github.com/VundleVim/Vundle.vim)
* Color scheme: [Solarized](https://github.com/altercation/vim-colors-solarized)
* File viewer: [NERDTree](https://github.com/scrooloose/nerdtree) - maybe will be replaced by [CtrlP](https://github.com/kien/ctrlp.vim)
* Status bar: [vim-airline](https://github.com/bling/vim-airline)
* Working with codes: 
    * Code comments - [NERDCommenter](https://github.com/scrooloose/nerdcommenter) 
    * Syntax check - [syntastic](https://github.com/scrooloose/syntastic) 
    * Enhanced C++ highlights - [vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)
* Not installed, but planned to chose from to improve functionality:
    * Switch between source and header file - [a.vim](http://www.vim.org/scripts/script.php?script_id=31)
    * Snippets - [snipMate](http://www.vim.org/scripts/script.php?script_id=2540) or [UltiSnips](http://www.vim.org/scripts/script.php?script_id=2715) or [c.vim](http://www.vim.org/scripts/script.php?script_id=213)
    * Reference search, e.g. variables, classes, functions - [cscope](http://cscope.sourceforge.net/cscope_vim_tutorial.html)
    * Go to definition - [ctags](http://ctags.sourceforge.net/)
    * Code completion - [YouCompleteMe](https://github.com/Valloric/YouCompleteMe); or more on [C++ code completion](http://vim.wikia.com/wiki/VimTip1608)
    * Class navigation - [taglist](http://vim-taglist.sourceforge.net/) or [Tagbar](http://www.vim.org/scripts/script.php?script_id=3465)   
    * clewn - debug support  

#### zsh
* Based on Prezto  
* Custom prompt configuration: [viruca](://github.com/vicrucann/dotfiles/blob/master/viruca.zsh-theme)

#### LXTerminial (Lubuntu)
* Imitation of [Solarized](https://github.com/altercation/vim-colors-solarized) color scheme for background and foreground colors solely

#### Tmux
* Replaced some basic key bindings for easier reach, e.g., `<C>b` is replaced by `<C>a`

#### dircolors
* Based on [Solarized](https://github.com/altercation/vim-colors-solarized) scheme to diffirintiate between different file types when using commands such as `ls` - dircolors file for Lubuntu is taken from [dircolors-solarized project](https://github.com/seebi/dircolors-solarized)

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





