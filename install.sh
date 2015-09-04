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

# install Prezto
# before installing Prezto, uninstall oh-my-zsh if any
if test -d $HOME/.oh-my-zsh; then
    printf "Uninstalling oh-my-zsh\n"
    rm -f -r $HOME/.oh-my-zsh
fi

# clone the prezto repo
read -p "(Re-)Install Prezto? " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

# remove previous config files, if any
printf "Removing any existing config files...\n"
rm -f ~/.vimrc
rm -f ~/.zshrc
rm -f ~/.config/lxterminal/lxterminal.conf
rm -f ~/.tmux.conf
rm -f ~/.zprezto/modules/prompt/functions/prompt_viruca_setup
#rm -f ~/.oh-my-zsh/themes/viruca.zsh-theme # obsolete since transfered to prezto
rm -f ~/.vim/template.cpp
rm -f ~/.dircolors
rm -f ~/.zlogin
rm -f ~/.zlogout
rm -f ~/.zpreztorc
rm -f ~/.zprofile
rm -f ~/.zshenv
printf "Done\n\n"

# create symbolic links
printf "Creating symbolic links...\n"
# dotfiles to copy to $HOME
FILES="zshrc tmux.conf vimrc dircolors zpreztorc zprofile zshenv"
if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	printf "Linux detected\n"
	for ifs in `echo $FILES`; do
		ln -sv "$(pwd)/$ifs" "$HOME/.$ifs"
	done
	ln -sv $(pwd)/lxterminal.conf ~/.config/lxterminal/lxterminal.conf
	ln -sv $(pwd)/template.cpp ~/.vim/template.cpp
	ln -sv $(pwd)/prompt_viruca_setup ~/.zprezto/modules/prompt/functions/prompt_viruca_setup
elif [ "$(expr substr $(uname -s) 1 6)" == "CYGWIN" ]; then
	printf "Cygwin detected\n"
	# use cmd mklink
	# files with $HOME destination
	for ifs in `echo $FILES`; do
		SP="$(pwd)/$ifs"
		SH="$HOME/.$ifs"
		STARGET="$(cygpath -w -p $SP)"
		SLINK="$(cygpath -w -p $SH)"
		/cygdrive/c/windows/system32/cmd.exe /c mklink $SLINK $STARGET
	done
	# files with other destinations:
	SP="$(pwd)/lxterminal.conf"
	SH="$HOME/.config/lxterminal/lxterminal.conf"
	STARGET="$(cygpath -w -p $SP)"
	SLINK="$(cygpath -w -p $SH)"
	/cygdrive/c/windows/system32/cmd.exe /c mklink $SLINK $STARGET

	SP="$(pwd)/viruca.zsh-theme"
	SH="$HOME/.oh-my-zsh/themes/viruca.zsh-theme"
	STARGET="$(cygpath -w -p $SP)"
	SLINK="$(cygpath -w -p $SH)"
	/cygdrive/c/windows/system32/cmd.exe /c mklink $SLINK $STARGET

	SP="$(pwd)/template.cpp"
	SH="$HOME/.vim/template.cpp"
	STARGET="$(cygpath -w -p $SP)"
	SLINK="$(cygpath -w -p $SH)"
	/cygdrive/c/windows/system32/cmd.exe /c mklink $SLINK $STARGET
	
	SP="$(pwd)/prompt_viruca_setup"
	SH="$HOME/.zprezto/modules/prompt/functions/prompt_viruca_setup"
	STARGET="$(cygpath -w -p $SP)"
	SLINK="$(cygpath -w -p $SH)"
	/cygdrive/c/windows/system32/cmd.exe /c mklink $SLINK $STARGET
else
	printf "ERROR: current platform is not supported\n"
	exit 1
fi
printf "Done\n\n"

# .vim directory and plugins
# delete any previous vim settings
printf "The scrip is about to remove any current vim settings\n"
read -p "Are you sure to overwrite the vim settings? " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]; then
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
else
    printf "The vim setup is skipped\n"
fi

# change to zsh
if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    chsh -s $(which zsh) 
elif [ "$(expr substr $(uname -s) 1 6)" == "CYGWIN" ]; then
    mkpasswd -c | sed -e 'sX/bashX/zshX'|tee -a /etc/passwd
    # taken from http://superuser.com/a/891728
else
	printf "ERROR: current platform is not supported\n"
	exit 1
fi
printf "Done\n\n"
