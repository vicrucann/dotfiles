# The current user
#VIRUCA_USER="%{%F{136}%}%n%{$reset_color%}"
#VIRUCA_MACHINE="%{%F{61}%}%m%{$reset_color%}"
#VIRUCA_PATH="%{%F{64}%}%~ %{$reset_color%}"

#PROMPT='$VIRUCA_USER@$VIRUCA_MACHINE:$VIRUCA_PATH $ '

local ret_status="%(?:%{%F{33}%}➜ :%{%F{166}%}➜ %s)" #status arrow [blue][orange]

PROMPT='${ret_status}%{%F{64}%}%p %{%F{136}%}%c %{%F{37}%}$(git_prompt_info)%{%F{33}%} % %{$reset_color%}'
#[green]  path[yellow] [cyan] [blue]

ZSH_THEME_GIT_PROMPT_PREFIX="%{%F{61}%}" # master {violet}
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{%F{61}%} %{%F{125}%}✗%{$reset_color%}" # status [violet][magenta]
ZSH_THEME_GIT_PROMPT_CLEAN="%{%F{61}%}%{$reset_color%}"  #[violet]

