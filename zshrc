# Exports# {{{

export GITHUB_USER="vicrucann"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPAGER="less -X" # sceen is not cleared after quitting the man page
export EDITOR="vim"
export VISUAL="vim"

# OpenSceneGraph variables for installation
export OPENTHREADS_INC_DIR="/usr/local/include"
export OPENTHREADS_LIB_DIR="/usr/local/lib64:/usr/local/lib"
export PATH="$OPENTHREADS_LIB_DIR:$PATH"
export LD_LIBRARY_PATH="/usr/local/lib64:/usr/local/lib:$LD_LIBRARY_PATH"
# export COMPILE_INTROSPECTION=no # uncomment for cygwin
export OSG_FILE_PATH="/usr/local/OpenSceneGraph/data:/usr/local/OpenSceneGraph/data/Images"

# Qt5
#export QT5PREFIX=/opt/Qt/5.5/gcc_64
export QT_AUTO_SCREEN_SCALE_FACTOR=2

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
algs="$HOME/github/codalgs/cforce"
insitu="$HOME/github/dura-europos-insitu"
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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
