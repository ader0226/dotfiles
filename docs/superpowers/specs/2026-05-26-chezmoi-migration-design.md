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
├── .chezmoi.toml.tmpl        # minimal config skeleton with [data] placeholder
├── dot_zshrc.tmpl            # template — handles Linux/macOS path differences
├── dot_p10k.zsh              # plain file
├── dot_tokyonight.zsh        # plain file
├── dot_tmux.conf             # plain file
├── run_once_install-deps.sh  # replaces install.sh; runs only on first apply
└── README.md                 # updated deployment instructions
```

### `.chezmoi.toml.tmpl` (minimal skeleton)

```toml
[data]
    # placeholder for future use
    # email = "your@email.com"
    # machine = "work"
```

`.chezmoi.toml.tmpl` is included as a minimal skeleton. No user prompts are needed now, but the `[data]` section makes it easy to add variables later (e.g., email, GPG key, machine alias) without restructuring. This is especially important if `.gitconfig` is added to management later — it will almost certainly need template data.

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
#!/bin/bash
if [[ "$(uname)" == "Darwin" ]]; then
  # macOS: use brew or manual clone
else
  # Linux/WSL: manual clone only
fi
```

### `run_once_install-deps.sh` — important behaviors

- **Must have `#!/bin/bash` shebang** and the executable bit set (`chmod +x`). chezmoi will refuse to run it otherwise.
- **Hash-based re-run:** chezmoi tracks whether the script has run by hashing its content. If the script is modified later, chezmoi will run it again. All operations inside must be **idempotent** — use `[[ -d "$dest" ]] || git clone ...` style guards to avoid re-cloning existing directories.
- **Naming:** The `run_once_` prefix is what triggers the one-time behavior. Do not use `run_` (which runs every `apply`) unless that is the intent.

---

## Migration Steps (one-time, on this machine)

1. Install chezmoi: `sh -c "$(curl -fsLS get.chezmoi.io)"` or `brew install chezmoi`
2. `chezmoi init` — creates `~/.local/share/chezmoi`
3. `chezmoi add ~/.zshrc ~/.p10k.zsh ~/.tokyonight.zsh ~/.tmux.conf` — copies files with `dot_` prefix
4. Rename `dot_zshrc` → `dot_zshrc.tmpl` and add template blocks
5. Create `run_once_install-deps.sh` (replaces `install.sh` logic); ensure `chmod +x`
6. Create `.chezmoi.toml.tmpl` with minimal `[data]` skeleton
7. `chezmoi cd` → `git remote set-url origin https://github.com/ader0226/dotfiles`
8. **`chezmoi diff`** — review what chezmoi will write; confirm it matches existing files before touching anything
9. `chezmoi apply` — apply files to `$HOME`
10. Push to GitHub; remove old `~/dotfiles` symlinks

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
