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

PROMPT='${ret_status}%{%F{64}%}%p %{%F{166}%}%c %{%F{64}%}$(prompt_char)$(git_prompt_info)%{%F{136}%} $ % %{$reset_color%}'
#[green]  path[orange] git_symbol[green] [blue]

ZSH_THEME_GIT_PROMPT_PREFIX="%{%F{64}%}" # master {green}
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{%F{33}%} %{%F{125}%}*%{$reset_color%}" # status [blue][magenta]
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{%F{125}%}+"
ZSH_THEME_GIT_PROMPT_CLEAN="%{%F{64}%}%{$reset_color%}"  #[green]

