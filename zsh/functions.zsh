# Small functions that earn their keep.

# mkcd: make a directory and cd into it
mkcd() { mkdir -p -- "$1" && cd -- "$1"; }

# up N: climb N directories (default 1)
up() {
  local n="${1:-1}" path=""
  while (( n-- > 0 )); do path+="../"; done
  cd "$path" || return
}

# ports: what's listening where
ports() { ss -tulpn 2>/dev/null || netstat -tulpn 2>/dev/null; }

# ff: find files by name fragment, case-insensitive, skipping noise dirs
ff() {
  find . \( -name .git -o -name node_modules -o -name .venv \) -prune \
       -o -iname "*$1*" -print 2>/dev/null
}

# h: search history
h() { fc -l 1 | grep -i --color=auto "$*" | tail -30; }

# calc: quick math at the prompt — calc 17*38
calc() { print -- $(( $* )); }

# serve: throwaway HTTP server for the current directory
serve() { python3 -m http.server "${1:-8000}"; }
