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

# some functions first
symlinker() {
# a function that performs a creation of symlinks
# in linux and windows (cygwin or mingw)
# input parameters:
# full_path_of_target full_path_of_link

ptarget=$1
plink=$2

printf "\nLink to be created: for file\n%s\n and with link to\n%s\n\n" $ptarget $plink

if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    printf "Linux detedted\n"
    ln -sv $ptarget $plink
elif [ "$(expr substr $(uname -s) 1 6)" == "CYGWIN" ]; then
    printf "Cygwin detected\n"
    STARGET="$(cygpath -w -p $ptarget)"
    SLINK="$(cygpath -w -p $plink)"
    /cygdrive/c/windows/system32/cmd.exe /c mklink $SLINK $STARGET
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
    printf "MinGW detected\n"
    destinn=$(dirname "${plink}")
    mkdir -p $destinn
    orign=$(dirname "${ptarget}")
    flname=$(basename "${ptarget}")
    flname2=$(basename "${plink}")
    SLINK="$({ cd 2>/dev/null $destinn && pwd -W ||
    echo $destinn | sed 's|^/\([a-z]\)/|\1:/|'; } | sed 's|/|\\|g')"
    STARGET="$({ cd $orign && pwd -W; } | sed 's|/|\\|g')"
    c:/windows/system32/cmd.exe //c mklink $SLINK\\$flname2 $STARGET\\$flname
else
    printf "ERROR: current platform is not supported\n"
    exit 1
fi
}

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
  if [ $? -ne 0 ]; then
    printf "ERROR: could not install prezto: is git installed? is there internet connection?\n"
    # git for MinGW:
    # add similar line to the C:\MinGW\msys\1.0\etc\profile
    # export PATH=$PATH:/c/Program\ Files/Git/bin
    exit 1
  fi
fi

# remove previous config files, if any
read -p "Remove any previous config files? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
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
    rm -f ~/.gitconfig
fi
printf "Done\n\n"

# create symbolic links
read -p "Overwrite symbolic links? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    printf "Creating symbolic links...\n"
    # dotfiles to copy to $HOME
    FILES="zshrc tmux.conf vimrc dircolors zpreztorc zprofile zshenv gitconfig"
    for ifs in `echo $FILES`; do
        symlinker "$(pwd)/$ifs" "$HOME/.$ifs"
    done
    symlinker "$(pwd)/lxterminal.conf" "$HOME/.config/lxterminal/lxterminal.conf"
    symlinker "$(pwd)/template.cpp" "$HOME/.vim/template.cpp"
    symlinker "$(pwd)/prompt_viruca_setup" "$HOME/.zprezto/modules/prompt/functions/prompt_viruca_setup"
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
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
    printf "chsh is not supported in MinGW. \n"
    printf "zsh is not avail at MinGW neither. \n"
    printf "In order to complete the setupt, you may proceede by adding the next line in your ~/.bashrc profile at the beginning: \n"
    printf "exec zsh\n"
else
	printf "ERROR: current platform is not supported\n"
	exit 1
fi
printf "Done\n\n"
