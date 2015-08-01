# The current user
VIRUCA_USER="%{%F{136}%}%n%{$reset_color%}"
VIRUCA_MACHINE="%{%F{61}%}%m%{$reset_color%}"
#VIRUCA_PATH="%{%F{64}%}%~ %{$reset_color%}"

#PROMPT='$VIRUCA_USER@$VIRUCA_MACHINE:$VIRUCA_PATH $ '

local ret_status="%(?:%{%F{37}%}➜ :%{%F{125}%}➜ %s)" #status arrow [cyan][magenta]

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}

PROMPT='${ret_status}%{%F{64}%}%p %{%F{166}%}%c %{%F{64}%}$(prompt_char)$(git_prompt_info)$(git_prompt_status)%{%F{244}%} $ % %{$reset_color%}'
#[green]  path[orange] git_symbol[green] $[white]

ZSH_THEME_GIT_PROMPT_PREFIX="%{%F{64}%}" # master {green}
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="" # status [blue][magenta]
ZSH_THEME_GIT_PROMPT_CLEAN="%{%F{64}%}%{$reset_color%}"  #[green]

ZSH_THEME_GIT_PROMPT_ADDED="%{%F{61}%}+" #[violet]
ZSH_THEME_GIT_PROMPT_MODIFIED="%{%F{125}%}*" #[magenta]
ZSH_THEME_GIT_PROMPT_DELETED="%{%F{160}%}-" #[red]
ZSH_THEME_GIT_PROMPT_RENAMED="%{%F{136}%}>" #[yellow]
ZSH_THEME_GIT_PROMPT_UNMERGED="%{%F{136}%}#" #[yellow]
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{%F{160}%}?" #[red]

