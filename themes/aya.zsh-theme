# Needs Git plugin for current_branch method

# Color shortcuts
RED=[31m
YELLOW=[33m
GREEN=[32m
WHITE=[37m
BLUE=[34m
RED_BOLD="[01;31m"
YELLOW_BOLD="[01;33m"
GREEN_BOLD="[01;32m"
WHITE_BOLD="[01;37m"
BLUE_BOLD="[01;34m"
RESET_COLOR=[00m

if [[ -n $SSH_CONNECTION ]]; then
    PROMPT="%{$RED_BOLD%}(ssh) "
else
    PROMPT=""
fi

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

# Format for parse_git_dirty()
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$RED%}(*)"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$RED%}unmerged"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$RED%}deleted"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$YELLOW%}renamed"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$YELLOW%}modified"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$GREEN%}added"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$WHITE%}untracked"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$RED%}(!)"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$WHITE%}[%{$YELLOW%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$WHITE%}]"

return_code="%(?..%{$RED%}%? %{$RESET_COLOR%})"

# Prompt format
PROMPT+="%{$GREEN_BOLD%}%n@%m%{$WHITE%}:%{$YELLOW%}%~%u$(git_prompt_ahead)%{$RESET_COLOR%} ${return_code}%{$BLUE%}>%{$RESET_COLOR%} "

# Git prompt format
RPROMPT="%{$GREEN_BOLD%}$(current_branch)$(git_prompt_short_sha)$(git_prompt_status)%{$RESET_COLOR%}"
# RPROMPT='%{$GREEN_BOLD%}$(current_branch)$(git_prompt_short_sha)%{$RESET_COLOR%}'
