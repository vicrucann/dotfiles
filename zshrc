# Exports# {{{

export GITHUB_USER="vicrucann"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPAGER="less -X" # sceen is not cleared after quitting the man page
export EDITOR="vim"
export VISUAL="vim"
export PATH="$PATH:$HOME/.local/bin"
# export COMPILE_INTROSPECTION=no # uncomment for cygwin

# Qt5
export QT_SCALE_FACTOR=1
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_AUTO_SCREEN_SCALE_FACTOR=2 # for Qt Creator

# Java and ant
if [[ "$(uname -s)" == CYGWIN* ]]; then
  export JAVA_HOME="/cygdrive/c/Program Files/Java/jdk1.8.0_144"
  export PATH=$JAVA_HOME/bin:$PATH
  export ANT_HOME="/cygdrive/c/apache-ant-1.10.1"
  export PATH=$ANT_HOME/bin:$PATH
fi

# allow terminal to support 256 color schemes
if [[ $TERM == xterm ]]; then
    export TERM="xterm-256color"
fi

export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"

# keep history from tmux on the next restart
export PROMT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
## }}}

# Alias # {{{

alias vi="vim"
alias tmux="tmux -2" # 256 colors mode
alias tmuxkillall="tmux ls | cut -d : -f 1 | xargs -I {} tmux kill-session -t {}" # tmux kill all sessions
#alias ct="ctags -R --exclude=.git --exclude=node_modules"
## }}}

# Environment variables # {{{
dots="$HOME/github/dotfiles"
work="$HOME/density"
## }}}

# Other # {{{
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# spelling corrector
setopt CORRECT

# auto-correction
ENABLE_CORRECTION="true"

# display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# enable dircolors for ls and such
eval `dircolors ~/.dircolors`

# remember tmux history of commands
setopt inc_append_history
## }}}

# Sound effects with long-running processes # {{{
# Example usage: cmake something; oks 

oks(){
  s=$?
  if [[ $s = 0 ]]; then
    paplay $HOME/Mallet.ogg
  else
    paplay $HOME/sonar.ogg
  fi
}

## }}}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME//texlive/2023/bin/x86_64-linux"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


