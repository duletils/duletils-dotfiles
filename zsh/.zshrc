fill-for-prompt()
{
  local cwd=$PWD
  [[ $cwd == $HOME* ]] && cwd="~${cwd#$HOME}"
  local empty_column_count=$((COLUMNS - ${#cwd} - 3))
  for ((column = 0; column < empty_column_count; column++)); do
    printf "\U2500"
  done
}

prompt_yellow=$(tput setaf 226)
prompt_light_orange=$(tput setaf 220)
prompt_orange=$(tput setaf 214)
prompt_blue=$(tput setaf 33)
color_reset=$(tput sgr0)

setopt PROMPT_SUBST

PROMPT='${prompt_blue}$(print "\U256D") %~ $(fill-for-prompt)
$(print "\U2570\U1F80A") ${prompt_yellow}%n${prompt_light_orange}@${prompt_orange}%m ${color_reset}$ '

