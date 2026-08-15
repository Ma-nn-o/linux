# Keybindings: emacs base + the history tricks people miss most.

bindkey -e

# Type a prefix, then ↑/↓ searches history for lines starting with it.
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Ctrl-←/→ jump words (common terminal sequences)
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Home/End/Delete just work
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

# Edit the current command line in $EDITOR with Ctrl-x Ctrl-e
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
