#!/bin/bash
# chezmoi runs this once per content-hash. All operations must be idempotent.
set -euo pipefail

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

clone_if_missing() {
  local repo="$1" dest="$2"
  if [[ -d "$dest" ]]; then
    echo "  exists: $dest"
  else
    echo "  cloning: $repo"
    git clone --depth=1 "$repo" "$dest"
  fi
}

echo "==> Installing oh-my-zsh"
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "  exists: $HOME/.oh-my-zsh"
fi

echo "==> Installing zsh plugins"
clone_if_missing https://github.com/zsh-users/zsh-autosuggestions.git \
  "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
clone_if_missing https://github.com/zsh-users/zsh-syntax-highlighting.git \
  "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

echo "==> Installing powerlevel10k theme"
clone_if_missing https://github.com/romkatv/powerlevel10k.git \
  "$ZSH_CUSTOM/themes/powerlevel10k"

echo "Done. Run: exec zsh"
