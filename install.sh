# !/bin/bash/
# Check versions and if the packages are present
# Suggest to pull submodules
# Create all the necessary symbolic links

# .vim directory and plugins


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
