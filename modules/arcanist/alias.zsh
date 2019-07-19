function _git_upstream() {
    return `git rev-parse --abbrev-ref --symbolic-full-name @{u}`
}

alias ard="arc diff ${_git_upstream}"
