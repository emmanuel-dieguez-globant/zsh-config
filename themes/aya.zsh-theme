# Color shortcuts
RED=[31m
YELLOW=[33m
WHITE=[37m
BLUE=[34m
RED_BOLD="[01;31m"
GREEN_BOLD="[01;32m"
RESET_COLOR=[00m

if [[ -n $SSH_CONNECTION ]]; then
    PROMPT="%{$RED_BOLD%}(ssh) "
else
    PROMPT=""
fi

return_code="%(?..%{$RED%}%?)"

# Prompt format
PROMPT+="%{$GREEN_BOLD%}%n@%m%{$WHITE%}:%{$YELLOW%}%~%u ${return_code}%{$BLUE%}>%{$RESET_COLOR%} "
