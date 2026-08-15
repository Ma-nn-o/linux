# Git-aware two-line prompt. Pure zsh — no plugins, no subshell-per-keystroke.
#
#   ~/code/project on main*
#   ❯
#
# The arrow goes red when the last command failed. Theme files can override
# the accent via $QOL_ACCENT (a 0-255 color index).

setopt prompt_subst

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' on %F{magenta}%b%f'
zstyle ':vcs_info:git:*' actionformats ' on %F{magenta}%b%f|%F{red}%a%f'

# Cheap dirty check: * after branch when the worktree has changes.
_qol_git_dirty() {
  [[ -n $(git status --porcelain 2>/dev/null | head -1) ]] && print -n '%F{yellow}*%f'
}

precmd() { vcs_info }

PROMPT='%F{${QOL_ACCENT:-6}}%~%f${vcs_info_msg_0_}$(_qol_git_dirty)
%(?.%F{${QOL_ACCENT:-6}}.%F{red})❯%f '

# Right side: exit code when nonzero, jobs when backgrounded.
RPROMPT='%(1j.%F{yellow}⚙%j%f .)%(?..%F{red}✘%?%f)'
