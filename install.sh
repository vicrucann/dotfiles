# !/bin/bash/
# Check versions and if the packages are present
# Suggest to pull submodules
# Create all the necessary symbolic links

# general info 
#printf "This script will install Lubuntu dot file configurations, all of which are unified to use Solarized color scheme:\n"
#printf "- vim\n"
#printf "- zsh\n"
#printf "- tmux\n"
#printf "- LXTerminal\n"
#printf "- dircolors (for commands such as ls)\n\n"

# remove previous config files, if any
printf "Removing any existing config files...\n"
rm -f ~/.vimrc
rm -f ~/.zshrc
rm -f ~/.config/lxterminal/lxterminal.conf
rm -f ~/.tmux.conf
rm -f ~/.oh-my-zsh/themes/viruca.zsh-theme
rm -f ~/.vim/template.cpp
printf "Done\n\n"

# create symbolic links
printf "Creating symbolic links...\n"
if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	printf "Linux detected\n"
	ln -sv pwd/vimrc ~/.vimrc
	ln -sv pwd/zshrc ~/.zshrc
	ln -sv pwd/lxterminal.conf ~/.config/lxterminal/lxterminal.conf
	ln -sv pwd/tmux.conf ~/.tmux.conf
	ln -sv pwd/viruca.zsh-theme ~/.oh-my-zsh/themes/viruca.zsh-theme
	ln -sv pwd/template.cpp ~/.vim/template.cpp
elif [ "$(expr substr $(uname -s) 1 6)" == "CYGWIN" ]; then
	printf "Cygwin detected\n"
	# use cmd mklink
	# files with $HOME destination
	FILES="zshrc tmux.conf vimrc dircolors"
	for ifs in `echo $FILES`; do
		SP="$(pwd)/$ifs"
		SH="$HOME/.$ifs"
		STARGET="$(cygpath -w -p $SP)"
		SLINK="$(cygpath -w -p $SH)"
		cmd.exe /c mklink $SLINK $STARGET
	done
	# files with other destinations:
	SP="$(pwd)/lxterminal.conf"
	SH="$HOME/.config/lxterminal/lxterminal.conf"
	STARGET="$(cygpath -w -p $SP)"
	SLINK="$(cygpath -w -p $SH)"
	cmd.exe /c mklink $SLINK $STARGET

	SP="$(pwd)/viruca.zsh-theme"
	SH="$HOME/.oh-my-zsh/themes/viruca.zsh-theme"
	STARGET="$(cygpath -w -p $SP)"
	SLINK="$(cygpath -w -p $SH)"
	cmd.exe /c mklink $SLINK $STARGET

	SP="$(pwd)/template.cpp"
	SH="$HOME/.vim/template.cpp"
	STARGET="$(cygpath -w -p $SP)"
	SLINK="$(cygpath -w -p $SH)"
	cmd.exe /c mklink $SLINK $STARGET
else
	printf "ERROR: current platform is not supported\n"
	exit 1
fi
printf "Done\n\n"

# .vim directory and plugins
printf "Checking for .vim directory\n"
mkdir -p ~/.vim
if [ $? -ne 0 ]; then
  printf "ERROR: could not create ~/.vim directory, check if you have sufficient rights\n"
  exit 1
fi
printf "Done\n\n"

printf "Loading and installing the necessary VIM plugins using Vundle\n"
printf "Clean the Vundle folder, if needed\n"
rm -r -f ~/.vim/bundle/Vundle.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
printf "Done\n\n"

printf "Installing other plugins using command line\n"
printf "Done\n\n"

# change to zsh
# chsh -s $(which zsh) 
# to chonge from root to specific username, use
# chsh -s /bin/zsh username

