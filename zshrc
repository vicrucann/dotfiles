# Exports# {{{

export GITHUB_USER="vicrucann"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPAGER="less -X" # sceen is not cleared after quitting the man page
export EDITOR="vim"

# some development variables, OpenSceneGraph lib
#export OPENTHREADS_INC_DIR="/usr/local/OpenThreads/include"
#export OPENTHREADS_LIB_DIR="/usr/local/OpenThreads/bin"
export COMPILE_EXAMPLES=yes
export COMPILE_INTROSPECTION=no
# export GDAL_INSTALLED=yes
#export PATH="$OPENTHREADS_LIB_DIR:$PATH"
#export PATH="PRODUCER_LIB_DIR:$PATH"
export PATH="/usr/local/OpenSceneGraph/bin:/usr/local/OpenSceneGraph:$PATH"
export LD_LIBRARY_PATH="/usr/local/OpenSceneGraph/lib:$LD_LIBRARY_PATH"
export OSG_FILE_PATH="/usr/local/OpenSceneGraph/data:/usr/local/OpenSceneGraph/data/Images"

# allow terminal to support 256 color schemes
if [[ $TERM == xterm ]]; then
    export TERM="xterm-256color"
fi
#export CLICOLOR=1 # commented since colors are defined by dircolors
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#export MC_SKIN="$HOME/.mc/skins/solarized.ini"

export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"

## }}}

# Alias # {{{

alias vi="vim"
alias tmux="tmux -2"
alias tmuxkillall="tmux ls | cut -d : -f 1 | xargs -I {} tmux kill-session -t {}" # tmux kill all sessions
#alias ct="ctags -R --exclude=.git --exclude=node_modules"
#alias dotfiles="ls -a | grep '^\.' | grep --invert-match '\.DS_Store\|\.$'"
## }}}

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# Zsh has a spelling corrector
setopt CORRECT

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

eval `dircolors ~/.dircolors`
