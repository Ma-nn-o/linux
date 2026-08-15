# ~/.zshrc — entry point. Everything lives in modules next to this file so
# each piece can be read (or deleted) on its own.

# Resolve the repo dir through the symlink so modules load from the clone.
QOL_ZDIR="${${(%):-%N}:A:h}"

# --- history: big, shared, deduped ---------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt inc_append_history share_history hist_ignore_all_dups hist_reduce_blanks
setopt hist_ignore_space          # leading space = keep out of history

# --- behavior ------------------------------------------------------------
setopt autocd                     # `..` or a dir name just cd's
setopt interactive_comments       # allow # comments at the prompt
setopt no_beep
setopt extended_glob

# --- completion ----------------------------------------------------------
autoload -Uz compinit && compinit -d "$HOME/.zcompdump"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'   # case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# --- modules -------------------------------------------------------------
for mod in aliases functions keybinds prompt; do
  [ -r "$QOL_ZDIR/$mod.zsh" ] && source "$QOL_ZDIR/$mod.zsh"
done

# --- theme (set with `theme <name>`; see themes/) ------------------------
[ -r "$HOME/.config/qol/theme.sh" ] && source "$HOME/.config/qol/theme.sh"

# --- repo scripts on PATH ------------------------------------------------
case ":$PATH:" in
  *":$QOL_ZDIR/../bin:"*) ;;
  *) PATH="$QOL_ZDIR/../bin:$PATH" ;;
esac

# Local overrides that shouldn't live in git.
[ -r "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
