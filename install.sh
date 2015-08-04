# !/bin/bash/
# Check versions and if the packages are present
# Suggest to pull submodules
# Create all the necessary symbolic links

# general info 
printf "This script will install Lubuntu dot file configurations, all of which are unified to use Solarized color scheme:\n"
printf "- vim\n"
printf "- zsh\n"
printf "- tmux\n"
printf "- LXTerminal\n"
printf "- dircolors (for commands such as ls)\n\n"

# .vim directory and plugins
printf "Checking for .vim directory\n"
mkdir -p ~/.vim
if [ $? -ne 0 ]; then
  printf "ERROR: could not create ~/.vim directory, check if you have sufficient rights\n"
  exit 1
fi
printf "Loading the necessary VIM plugins\n"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

printf "Done\n\n"

# symbolic links
ln -s pwd/vimrc ~/.vimrc
ln -s pwd/zshrc ~/.zshrc
ln -s pwd/lxterminal.conf ~/.config/lxterminal/lxterminal.conf
ln -s pwd/tmux.conf ~/.tmux.conf
ln -s pwd/viruca.zsh-theme ~/.oh-my-zsh/themes/viruca.zsh-theme

# change to zsh
chsh -s $(which zsh) 
# to chonge from root to specific username, use
# chsh -s /bin/zsh username

