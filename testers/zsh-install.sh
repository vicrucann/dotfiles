# !/bin/bash/

# tester file to install zsh environment

# before installing Prezto, uninstall oh-my-zsh if any
uninstall_oh_my_zsh

# clone the repo
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# default config
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# change default shell to zsh
sh -s /bin/zsh
