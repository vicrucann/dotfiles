# Victoria Rudakova 2015
# vicrucann@gmail.com
# MIT licence

# The current user
VIRUCA_USER="%{%F{136}%}%n%{$reset_color%}"
VIRUCA_MACHINE="%{%F{61}%}%m%{$reset_color%}"

#status arrow [cyan][magenta]
local ret_status="%(?:%{%F{37}%}➜ :%{%F{125}%}➜ %s)" 

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}

#[green]  path[orange] git_symbol[green] $[white]
PROMPT='${VIRUCA_USER}@${VIRUCA_MACHINE} ${ret_status}%{%F{64}%}%p %{%F{166}%}%c %{%F{64}%}$(prompt_char)%{%F{136}%}$(git_prompt_info)%{%F{244}%} $ % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="" # master {green}
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{%F{125}%}*" # [magenta]
ZSH_THEME_GIT_PROMPT_CLEAN="%{%F{64}%}%{$reset_color%}"  #[green]

