# !/bin/bash/

# tester file to install zsh environment

# before installing Prezto, uninstall oh-my-zsh if any
#uninstall_oh_my_zsh

# clone the repo
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# default settings
FILES="zlogin zlogout zpreztorc zprofile zshenv"
for ifs in `echo $FILES`; do
		SP="$(pwd)/$ifs"
		SH="$HOME/.$ifs"
		STARGET="$(cygpath -w -p $SP)"
		SLINK="$(cygpath -w -p $SH)"
		/cygdrive/c/windows/system32/cmd.exe /c mklink $SLINK $STARGET
done

# change default shell to zsh
#sh -s /bin/zsh
