# Aliases — short, memorable, no surprises.

# ls family (GNU coreutils)
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lh'
alias la='ls -lAh'
alias lt='ls -lht'            # newest first

# safety nets
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'              # prompt only when deleting 3+ files

# grep with color
alias grep='grep --color=auto'

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

# git — the four you type all day
alias gs='git status -sb'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate -15'
alias ga='git add'

# misc
alias df='df -h'
alias du1='du -h --max-depth=1 | sort -rh | head -20'
alias free='free -h'
alias path='echo ${PATH//:/\n}'
alias reload='exec zsh'
