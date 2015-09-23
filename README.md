## Overview

lubuntu-dot-configs is my personal dot file repository which is under active development. I am still trying to figure out the best software/plugins to use, so things may change drastically over time. The main criterias for my dot files are to be **lightweight**, **readable** and somewhat **minimalistic** while providing the necessary functionality. The latest stable version is accessible through releases; the master branch is a development branch. The configuration files include: 
* LXTerminal - a lightweight Linux terminal
* oh-my-zsh (planning to switch to more lightweight alternative)
* tmux
* vim (customized for C++ development mainly)
* Solarized color scheme
* gitconfig file
* Made to work under Lubuntu-14.04, and later tuned to be used with Cygwin, Windows 7

## Initial printscreens

These are solely examples, the end version might look slightly different.  

![ex-git](https://github.com/vicrucann/lubuntu-dot-configs/blob/master/img/ex-git.png?raw=true "Git repo example")  
\* Inside modified git repository  

![ex-vim](https://github.com/vicrucann/lubuntu-dot-configs/blob/master/img/ex-vim.png?raw=true "Vim and tmux example")  
\* Editing with vim inside tmux session  

## Installation and platforms 
* Was made to work under Lubuntu-14.04
* Is being tuned to work with Cygwin under Windows 7 
	* Note: the Cygwin must be **run as Administrtor** when installing (for symbolic links creation) 
* Is being tested to run with MinGW, Windows 7
    * Note: before doing `git clone ...`, make sure the git global setting is put to `git config --global core.autocrlf input` in order to avoid end-of-line `^M` error
* To perform the installation run:  
```
$ git clone git://github.com/vicrucann/lubuntu-dot-configs.git ~/github/  
$ cd github/lubuntu-dot-configs
$ git submodule update --init --recursive  
```
Then for Cygwin platform run:  
```
$ ./install.sh
```
For Linux, it has to be run under `sudo` and bash must be enforced:  
```
$ chmod +x install.sh
$ sudo bash install.sh
```
#### Troubleshooting

One of the most common problems when trying to run `install.sh` - line encoding is read wrongly by Cygwin (e.g. it treats the file encoding as `dos`, while it is supposed to be `unix`). One of the ways to change to the correct file encoding is:
1. Open the `install.sh` in vim - `vim install.sh`
2. In Vim, assign the correct file encoding to the file - `:w ++ff=unix`
3. Now close the file - `:q` and try to run `install.sh` again 


## Configuration files

#### Vim plugins
* Plugin management: [Vundle](https://github.com/VundleVim/Vundle.vim)
* Color scheme: [Solarized](https://github.com/altercation/vim-colors-solarized)
* File viewer: [NERDTree](https://github.com/scrooloose/nerdtree)
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
    * Code completion - [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
    * Class navigation - [taglist](http://vim-taglist.sourceforge.net/) or [Tagbar](http://www.vim.org/scripts/script.php?script_id=3465)   
    * clewn - debug support  

#### zsh
* Based on Prezto  
* Custom prompt configuration: [viruca](://github.com/vicrucann/lubuntu-dot-configs/blob/master/viruca.zsh-theme)

#### LXTerminial (Lubuntu)
* Imitation of [Solarized](https://github.com/altercation/vim-colors-solarized) color scheme for background and foreground colors solely

#### Tmux
* Replaced some basic key bindings for easier reach

#### dircolors
* Based on [Solarized](https://github.com/altercation/vim-colors-solarized) scheme to diffirintiate between different file types when using commands such as `ls` - dircolors file for Lubuntu is taken from [dircolors-solarized project](https://github.com/seebi/dircolors-solarized), right now is not activated

## Basic commands / bindings

#### Tmux

`tmux new -s tmname` - attach the new tmux session named `tmname`  
`<C>-a |` - split the screen in half vertically  
`<C>-a -` - split the pane in half horizontally  
`<C>-a` - jump the the next pane  
`<C>-d` - close current window  
`<C>-a c` - open up another window  
`<C-a> n` - go to the next window  
`<C>-a d` - disconnect from Tmux  
`$ tmux ls` - in terminal: check what Tmux sessions are running  
`$ tmux attach -t tmname` - in terminal: attach the session `tmname` back  
`$ tmux kill-session -t tmname` - kill the `tmname` session  
`<C>-a r` - reload Tmux configuration while being in Tmux session  
`<C>-a <up>\<down>\<left>\<right>` - move between the open panes  





