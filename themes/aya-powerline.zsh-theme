# vim:ft=zsh ts=2 sw=2 sts=2
#
# aya-powerline Theme - https://gist.github.com/3712874
# A Powerline-inspired theme for ZSH
#
# # README
#
# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://github.com/Lokaltog/powerline-fonts).
# Make sure you have a recent version: the code points that Powerline
# uses changed in 2012, and older versions will display incorrectly,
# in confusing ways.
#
# In addition, I recommend the
# [Solarized theme](https://github.com/altercation/solarized/) and, if you're
# using it on Mac OS X, [iTerm 2](https://iterm2.com/) over Terminal.app -
# it has significantly better color fidelity.
#
# If using with "light" variant of the Solarized color schema, set
# SOLARIZED_THEME variable to "light". If you don't specify, we'll assume
# you're using the "dark" variant.
#
# # Goals
#
# The aim of this theme is to only show you *relevant* information. Like most
# prompts, it will only show git information when in a git working directory.
# However, it goes a step further: everything from the current user and
# hostname to whether the last call exited with an error to whether background
# jobs are running in this shell will all be displayed automatically when
# appropriate.

### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

CURRENT_BG='NONE'

case ${SOLARIZED_THEME:-dark} in
    light) CURRENT_FG='white';;
    *)     CURRENT_FG='black';;
esac

# Special Powerline characters

() {
  local LC_ALL="" LC_CTYPE="en_US.UTF-8"
  # NOTE: This segment separator character is correct.  In 2012, Powerline changed
  # the code points they use for their special characters. This is the new code point.
  # If this is not working for you, you probably have an old version of the
  # Powerline-patched fonts installed. Download and install the new version.
  # Do not submit PRs to change this unless you have reviewed the Powerline code point
  # history and have new information.
  # This is defined using a Unicode escape sequence so it is unambiguously readable, regardless of
  # what font the user is viewing this source code in. Do not replace the
  # escape sequence with a single literal character.
  # Do not change this! Do not make it '\u2b80'; that is the old, wrong code point.
  SEGMENT_SEPARATOR=$'\ue0b0'
  R_SEGMENT_SEPARATOR=$'\uE0B2'

  # https://www.ditig.com/256-colors-cheat-sheet
  user_bg=green
  dir_bg=blue
  error_bg=red
  branch_bg=blue
  hash_bg=129

  # Format for git_prompt_status()
  ZSH_THEME_GIT_PROMPT_UNMERGED=" %F{magenta}?%f"
  ZSH_THEME_GIT_PROMPT_DELETED=" %F{red}✖%f"
  ZSH_THEME_GIT_PROMPT_RENAMED=" %F{yellow}➜%f"
  ZSH_THEME_GIT_PROMPT_MODIFIED=" %F{blue}⚙%f"
  ZSH_THEME_GIT_PROMPT_ADDED=" %F{green}✚%f"
  ZSH_THEME_GIT_PROMPT_UNTRACKED=" %F{white}✭%f"
  ZSH_THEME_GIT_PROMPT_AHEAD=" %F{red}●%f"
}

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

r_prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n "%F{$1}$R_SEGMENT_SEPARATOR%{$bg%}%{$fg%}"
  else
    echo -n "%F{$1}$R_SEGMENT_SEPARATOR%{$bg%}%{$fg%}"
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
  prompt_segment $user_bg white "%n@%m"
}

# Dir: current working directory
prompt_dir() {
  prompt_segment $dir_bg white '%~'
}

prompt_status() {
  [[ $RETVAL -ne 0 ]] && prompt_segment $error_bg white "%?"
}

# Git: branch/detached head, dirty status
prompt_git() {
  (( $+commands[git] )) || return
  if [[ "$(git config --get oh-my-zsh.hide-status 2>/dev/null)" = 1 ]]; then
    return
  fi

  if [[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]]; then
    if [[ -n $(parse_git_dirty) ]]; then
        echo -n "%B$(git_prompt_status)%b "
    else
        echo -n "%B$(git_prompt_ahead)%b "
    fi

    r_prompt_segment $branch_bg white " \ue0a0 $(git_current_branch) "
    r_prompt_segment $hash_bg white " $(git_prompt_short_sha)"
  fi
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_context
  prompt_dir
  prompt_status
  prompt_end
}

r_build_prompt() {
  prompt_git
}

PROMPT='%{%f%b%k%}$(build_prompt) '
RPROMPT='%{%f%b%k%}$(r_build_prompt) '
