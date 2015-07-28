##### Main configuration files
* vim : C++ oriented, solarized color scheme
* zsh : built on robbyrussel configuration using tutorial on [Configure Linux toolset: zsh, tmux, vim](https://www.codementor.io/linux/tutorial/configure-linux-toolset-zsh-tmux-vim#/)
* LXTerminal (Lubuntu) : imitation of solarized color scheme for background and foreground colors

##### Installation:  

`git clone git://github.com/vicrucann/dotvim.git ~/.vim`

##### Create symlinks:  

`ln -s ~/.vim/vimrc ~/.vimrc`  
`ln -s ~/.vim/zshrc ~/.zshrc`  
`ln -s ~/.vim/lxterminal.conf ~/.config/lxterminal/lxterminal.conf`  
`ln -s ~/.vim/tmux.conf ~/.tmux.conf`

##### Switch to the `~/.vim` directory, and fetch submodules:

`cd ~/.vim`  
`git submodule init`  
`git submodule update`

##### Original link  

[Keep Vim settings and plugins in Git repo](http://dudarev.com/blog/keep-vim-settings-and-plugins-in-git-repo/)
