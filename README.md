## Overview

lubuntu-dot-configs is my personal dot file repository which is under active development. The latest stable version is accessible through versions; the master branch is a development branch. The configurations combines together: 
* LXTerminal - a lightweight Linux terminal
* Zsh 
* oh-my-zsh (planning to switch to more lightweight alternative)
* tmux
* vim (customized for C++ development mainly)
* Solarized color scheme
* Made to work under Lubuntu-14.04, and later tuned to be used with Cygwin, Windows 7

## Initial printscreens
![ex-git](https://github.com/vicrucann/lubuntu-dot-configs/blob/master/img/ex-git.png?raw=true "Git repo example")
![ex-vim](https://github.com/vicrucann/lubuntu-dot-configs/blob/master/img/ex-vim.png?raw=true "Vim and tmux example")

## Installation and platforms 
* Was made to work under Lubuntu-14.04
* Is being tuned to work with Cygwin under Windows 7 
	* Note: the Cygwin must be run as Administrtor when installing (for symbolic links creation) 
* To perform the installation run:  
```
$ git clone git://github.com/vicrucann/lubuntu-dot-configs.git ~/github/  
$ git submodule update --init --recursive  
$ ./install.sh
```

## Main configuration files

#### Vim plugins
* Plugin management: [Vundle](https://github.com/VundleVim/Vundle.vim)
* Color scheme: [Solarized](https://github.com/altercation/vim-colors-solarized)
* File viewer: [NERDTree](https://github.com/scrooloose/nerdtree)
* Status bar: [vim-airline](https://github.com/bling/vim-airline)
* Working with codes: 
  * code comments - [NERDCommenter](https://github.com/scrooloose/nerdcommenter) 
  * syntax check - [syntastic](https://github.com/scrooloose/syntastic) 
  * code completion - [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
  * enhanced C++ highlights - [vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)
* Not installed, but planned to chose from to improve functionality:
  * Switch between source and header file - [a.vim](http://www.vim.org/scripts/script.php?script_id=31)
  * Snippets - [snipMate](http://www.vim.org/scripts/script.php?script_id=2540) or [UltiSnips](http://www.vim.org/scripts/script.php?script_id=2715) or [c.vim](http://www.vim.org/scripts/script.php?script_id=213)
  * Reference search, e.g. variables, classes, functions - [cscope](http://cscope.sourceforge.net/cscope_vim_tutorial.html)
  * Go to definition - [ctags](http://ctags.sourceforge.net/)
  * Class navigation - [taglist](http://vim-taglist.sourceforge.net/) or [Tagbar](http://www.vim.org/scripts/script.php?script_id=3465)

#### zsh
* Based on robbyrussel's [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)  
* Custom prompt configuration: [viruca]()

#### LXTerminial (Lubuntu)
* Imitation of [Solarized](https://github.com/altercation/vim-colors-solarized) color scheme for background and foreground colors solely

#### Tmux

#### dircolors
* Based on [Solarized](https://github.com/altercation/vim-colors-solarized) scheme to diffirintiate between different file types when using commands such as `ls` - dircolors file for Lubuntu is taken from [dircolors-solarized project](https://github.com/seebi/dircolors-solarized)

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

## Installation:  




