typeset -Ag FX FG BG
FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)
for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done

# The current user
VIRUCA_USER="%{%F{136}%}%n%{$reset_color%}"
VIRUCA_MACHINE="%{%F{61}%}%m%{$reset_color%}"
VIRUCA_PATH="%{%F{64}%}%~ %{$reset_color%}"

PROMPT="
$VIRUCA_USER@$VIRUCA_MACHINE:$VIRUCA_PATH $ "

