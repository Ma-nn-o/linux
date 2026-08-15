#!/usr/bin/env bash
# install.sh — symlink the zsh config into place, backing up anything it
# would replace. Safe to re-run; never overwrites without a backup.
set -euo pipefail

repo_dir="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"
backup_dir="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

link() { # link <repo-relative-source> <absolute-target>
  local src="$repo_dir/$1" dst="$2"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    mkdir -p "$backup_dir"
    mv "$dst" "$backup_dir/"
    echo "  backed up $dst → $backup_dir/"
  fi
  ln -sfn "$src" "$dst"
  echo "  linked $dst → $src"
}

echo "Installing linux-qol from $repo_dir"
link zsh/.zshrc "$HOME/.zshrc"
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/qol"

if ! command -v zsh >/dev/null; then
  echo
  echo "NOTE: zsh isn't installed. Install it (apt/dnf/pacman install zsh)"
  echo "and make it your login shell:  chsh -s \$(which zsh)"
fi

echo
echo "Done. Start a new zsh, then try:"
echo "  theme            # pick a color scheme (5 included)"
echo "  sysdash          # live system dashboard"
echo "  ptop             # tiny process viewer"
[ -d "$backup_dir" ] && echo && echo "Your old files are in $backup_dir"
