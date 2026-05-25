# Chezmoi Migration Design

**Date:** 2026-05-26
**Scope:** Migrate existing dotfiles repo to chezmoi management

## Context

Current setup uses a manual `install.sh` symlink script to deploy 4 dotfiles from `~/dotfiles` to `$HOME`. Target is chezmoi for cross-platform (Linux + macOS) support with proper template handling.

**Files in scope:** `.zshrc`, `.p10k.zsh`, `.tokyonight.zsh`, `.tmux.conf`
**Files out of scope (for now):** `.gitconfig`, `.ssh/config`, `.config/**`
**Encryption:** Not required
**GitHub repo:** Continue using `https://github.com/ader0226/dotfiles`

---

## Architecture

### Source Directory

chezmoi default: `~/.local/share/chezmoi` (no custom `--source` needed)

```
~/.local/share/chezmoi/
├── dot_zshrc.tmpl            # template — handles Linux/macOS path differences
├── dot_p10k.zsh              # plain file
├── dot_tokyonight.zsh        # plain file
├── dot_tmux.conf             # plain file
├── run_once_install-deps.sh  # replaces install.sh; runs only on first apply
└── README.md                 # updated deployment instructions
```

`.chezmoi.toml.tmpl` is omitted — chezmoi auto-detects OS, no user prompts needed.

---

## Template Strategy

Only `.zshrc` requires templating. The other three files have no OS-specific content and are managed as plain files.

### `dot_zshrc.tmpl` additions

```
{{- if eq .chezmoi.os "darwin" -}}
eval "$(/opt/homebrew/bin/brew shellenv)"
{{- end }}
```

Insert before `export ZSH=...` to initialize Homebrew on macOS only.

The `run_once_install-deps.sh` script also uses OS detection to pick the right package manager when installing zsh plugins and themes:

```bash
if [[ "$(uname)" == "Darwin" ]]; then
  # macOS: use brew or manual clone
else
  # Linux/WSL: manual clone only
fi
```

---

## Migration Steps (one-time, on this machine)

1. Install chezmoi: `sh -c "$(curl -fsLS get.chezmoi.io)"` or `brew install chezmoi`
2. `chezmoi init` — creates `~/.local/share/chezmoi`
3. `chezmoi add ~/.zshrc ~/.p10k.zsh ~/.tokyonight.zsh ~/.tmux.conf` — copies files with `dot_` prefix
4. Rename `dot_zshrc` → `dot_zshrc.tmpl` and add template blocks
5. Create `run_once_install-deps.sh` (replaces `install.sh` logic)
6. `chezmoi cd` → `git remote set-url origin https://github.com/ader0226/dotfiles`
7. `chezmoi apply` — verify all files apply correctly
8. Push to GitHub; remove old `~/dotfiles` symlinks

---

## New Machine Deployment

```bash
chezmoi init --apply https://github.com/ader0226/dotfiles
```

chezmoi clones the repo, applies all files, and runs `run_once_install-deps.sh` automatically.

---

## Daily Workflow

```bash
# Edit a file
chezmoi edit ~/.zshrc

# Preview changes
chezmoi diff

# Apply changes to $HOME
chezmoi apply

# Sync to GitHub
chezmoi cd
git add -A && git commit -m "..." && git push

# Pull latest on another machine
chezmoi update
```

---

## What Happens to ~/dotfiles

- The old `~/dotfiles` directory and its symlinks are replaced by chezmoi-managed files after `chezmoi apply`
- `~/dotfiles` can be deleted once migration is verified
- The GitHub repo content changes from the old flat structure to chezmoi's `dot_`-prefixed naming
