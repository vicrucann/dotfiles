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

#### zsh
* Based on robbyrussel's [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)  
* Custom prompt configuration: [viruca]()

#### LXTerminial (Lubuntu)
* Imitation of [Solarized](https://github.com/altercation/vim-colors-solarized) color scheme for background and foreground colors

#### Tmux

#### dircolors
* Based on [Solarized](https://github.com/altercation/vim-colors-solarized) scheme to diffirintiate between different file types when using commands such as `ls`

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

#### Tmux-sidebar

`<C-a> <Tab>` - display the sidebar  
`<C-a> <Backspace>` - display the sidebar and put focus on it  

## Installation:  

`git clone git://github.com/vicrucann/dotvim.git ~/.vim`

#### Create symlinks:  

`ln -s ~/.vim/vimrc ~/.vimrc`  
`ln -s ~/.vim/zshrc ~/.zshrc`  
`ln -s ~/.vim/lxterminal.conf ~/.config/lxterminal/lxterminal.conf`  
`ln -s ~/.vim/tmux.conf ~/.tmux.conf`
ln -s ~/.vim/viruca.zsh-theme ~/.oh-my-zsh/themes/viruca.zsh-theme

#### Switch to the `~/.vim` directory, and fetch submodules:

`cd ~/.vim`  
`git submodule init`  
`git submodule update`

#### Original link  

[Keep Vim settings and plugins in Git repo](http://dudarev.com/blog/keep-vim-settings-and-plugins-in-git-repo/)

#### Install other packages  

* [Tmux Sidebar](https://github.com/tmux-plugins/tmux-sidebar)
