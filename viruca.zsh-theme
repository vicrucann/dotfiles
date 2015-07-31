#use extended color pallete if available
if [[ $TERM == 256color ]]; then
    turquoise="%F{81}"
    orange="%F{166}"
    purple="%F{135}"
    hotpink="%F{161}"
    limegreen="%F{118}"
else
    turquoise="$fg[cyan]"
    orange="$fg[yellow]"
    purple="$fg[magenta]"
    hotpink="$fg[red]"
    limegreen="$fg[green]"
fi

# The current user
VIRUCA_USER="%{$fg[magenta]%}%n%{$reset_color%}"
VIRUCA_MACHINE="%{$fg[yellow]%}%m%{$fg[white]%}%{$reset_color%}"
VIRUCA_PATH="%{$fg[154]%}%~ %{$reset_color%}"

PROMPT="
$VIRUCA_USER@$VIRUCA_MACHINE:$VIRUCA_PATH $ "

