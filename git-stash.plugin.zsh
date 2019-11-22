 __GIT_STASH_DIR="${0:A:h}"

function update_current_git_stash_vars() {
  __CURRENT_GIT_STASH_STATUS=0
  if git rev-parse --git-dir > /dev/null 2>&1; then
    local stash_file=$(git rev-parse --git-dir)/logs/refs/stash
    if test -f $stash_file; then
      __CURRENT_GIT_STASH_STATUS=$(wc -l < $stash_file | tr -d '[:space:]')
    fi
  fi
}

function preexec_update_git_stash_vars() {
    case "$2" in
        "git stash"*|gsta|gstaa|gstc|gstd|gstp|gstall)
        __EXECUTED_GIT_STASH_COMMAND=1
        ;;
    esac
}

function precmd_update_git_stash_vars() {
    if [ -n "$__EXECUTED_GIT_STASH_COMMAND" ] || [ ! -n "$ZSH_THEME_GIT_PROMPT_CACHE" ]; then
        update_current_git_stash_vars
        unset __EXECUTED_GIT_STASH_COMMAND
    fi
}

function git_stash() {
  if [ "$__CURRENT_GIT_STASH_STATUS" -ne "0" ]; then
    echo $__CURRENT_GIT_STASH_STATUS
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd update_current_git_stash_vars
add-zsh-hook precmd precmd_update_git_stash_vars
add-zsh-hook preexec preexec_update_git_stash_vars
