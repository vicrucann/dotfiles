# !/bin/bash/

# tester file to check behavious of different commands in Linux vs Windows environments

# symbolic links

# files with $HOME destination
FILES="zshrc tmux.conf vimrc dircolors"

rm -f ~/.vimrc
rm -f ~/.zshrc
rm -f ~/.config/lxterminal/lxterminal.conf
rm -f ~/.tmux.conf
rm -f ~/.oh-my-zsh/themes/viruca.zsh-theme
rm -f ~/.vim/template.cpp

for ifs in `echo $FILES`; do
	SP="$(pwd)/$ifs"
	SH="$HOME/.$ifs"
	STARGET="$(cygpath -w -p $SP)"
	SLINK="$(cygpath -w -p $SH)"
	echo $STARGET
	echo $SLINK
	cmd.exe /c mklink $SLINK $STARGET
done

# files with other destinations:
SP="$(pwd)/lxterminal.conf"
SH="$HOME/.config/lxterminal/lxterminal.conf"
STARGET="$(cygpath -w -p $SP)"
SLINK="$(cygpath -w -p $SH)"
echo $STARGET
echo $SLINK
cmd.exe /c mklink $SLINK $STARGET

SP="$(pwd)/viruca.zsh-theme"
SH="$HOME/.oh-my-zsh/themes/viruca.zsh-theme"
STARGET="$(cygpath -w -p $SP)"
SLINK="$(cygpath -w -p $SH)"
echo $STARGET
echo $SLINK
cmd.exe /c mklink $SLINK $STARGET

SP="$(pwd)/template.cpp"
SH="$HOME/.vim/template.cpp"
STARGET="$(cygpath -w -p $SP)"
SLINK="$(cygpath -w -p $SH)"
echo $STARGET
echo $SLINK
cmd.exe /c mklink $SLINK $STARGET

