# linux-qol

Quality-of-life dotfiles for Linux: a tuned zsh, terminal color schemes with
a live switcher, and a couple of tiny TUI tools — all dependency-free
(bash + zsh + /proc, nothing to `npm install`).

```bash
git clone https://github.com/Ma-nn-o/linux.git ~/.linux-qol
~/.linux-qol/install.sh     # symlinks ~/.zshrc (backs up your old one)
exec zsh
```

## What you get

**1 · A zsh that behaves** — shared, deduped 100k-line history; case-insensitive
menu completion; `autocd`; prefix-search with ↑/↓ (type `git ` then ↑ to walk
only your git commands); `Ctrl-x Ctrl-e` to edit the command line in `$EDITOR`.
Modular files (`zsh/aliases.zsh`, `functions.zsh`, `keybinds.zsh`) so you can
read or delete any piece. Your own machine-local stuff goes in `~/.zshrc.local`.

**2 · A git-aware prompt** — two lines, pure zsh (no plugin manager, no
subshell lag): path, branch, dirty `*`, and an arrow that turns red when the
last command failed. Exit code and background-job count on the right.

**3 · Color schemes with a live switcher** — five palettes (`nord`, `ember`,
`forest`, `synth`, `mono`) applied to the terminal's 16 ANSI colors via OSC
escapes, so they restyle *everything* — prompt, `ls`, vim, htop — instantly:

```bash
theme            # list (current marked with *)
theme forest     # apply now + persist for future shells
palette          # see the 16 colors you're running
```

**4 · `sysdash`** — a live TUI dashboard: CPU meter, memory meter, disk
usage, network throughput, load, top processes. Color-coded bars go
green → yellow → red as things heat up. `q` quits.

**5 · `ptop`** — a 20-row process viewer for when `top` is more than you
need: `c`/`m` to sort by CPU or memory, `q` to quit.

**6 · Handy commands** — `extract` (one verb for every archive format),
`mkcd`, `up 3`, `ports`, `ff <name>` (find, minus the noise dirs), `h <text>`
(history search), `serve` (throwaway HTTP server), `du1` (what's eating this
directory).

## Layout

```
zsh/        .zshrc + one module per concern
themes/     five 16-color palettes (add your own: copy one, edit, done)
bin/        theme · palette · sysdash · ptop · extract
install.sh  symlinks with automatic backups; safe to re-run
```

## Uninstall

Delete the symlink and restore your backup:

```bash
rm ~/.zshrc && mv ~/.dotfiles-backup-*/. ~/ 2>/dev/null; true
```
