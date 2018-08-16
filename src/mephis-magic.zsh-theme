# mephis-magic.zsh-theme
# Repo: https://github.com/MephistoMMM/terminal_init
# Direct Link: https://github.com/MephistoMMM/terminal_init/blob/master/src/mephis-magic.zsh-theme

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}  ✗ %?%{$reset_color%})"

DIVIDER='$FG[237]------------------------------------------------------------%{$reset_color%}'

if [ -f "$MAGIC_DIVIDER" ]; then
    MAGIC_IMAGE="\033]1337;File=inline=1;height=1;preserveAspectRatio=0:$(base64 < $MAGIC_DIVIDER)\a\n"
    DIVIDER='$(printf $MAGIC_IMAGE)'
fi

# primary prompt
PROMPT='%{$fg[blue]%}%~\
$(git_prompt_info) \
$FG[105]%(!.#.»)%{$reset_color%} '
PROMPT="$DIVIDER
$PROMPT"
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

# color vars
eval my_gray='$FG[237]'
eval my_orange='%{$fg[yellow]%}'

# right prompt
if type "virtualenv_prompt_info" > /dev/null
then
	RPROMPT='$(virtualenv_prompt_info)$my_gray%n@%m%{$reset_color%}${return_code}%'
else
	RPROMPT='$my_gray%n@%m%{$reset_color%}${return_code}%'
fi

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}(branch:"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[cyan]%})%{$reset_color%}"
