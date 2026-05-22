#!/usr/bin/env bash
# Install dotfiles into $HOME.
#   - Clones oh-my-zsh + zsh-autosuggestions + zsh-syntax-highlighting if absent.
#   - Symlinks tracked files into $HOME, backing up any existing real file to *.bak.
#
# Usage:
#   bash install.sh         # symlink files
#   bash install.sh --copy  # copy instead of symlink
#
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODE="symlink"
[[ "${1:-}" == "--copy" ]] && MODE="copy"

FILES=( .zshrc .p10k.zsh .tokyonight.zsh .tmux.conf )

ZSH_CUSTOM_DEFAULT="$HOME/.oh-my-zsh/custom"

clone_if_missing() {
  local repo="$1" dest="$2"
  if [[ -d "$dest" ]]; then
    echo "  exists: $dest"
  else
    echo "  clone:  $repo -> $dest"
    git clone --depth=1 "$repo" "$dest"
  fi
}

echo "==> Installing oh-my-zsh + plugins"
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "  installing oh-my-zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "  exists: $HOME/.oh-my-zsh"
fi

clone_if_missing https://github.com/zsh-users/zsh-autosuggestions.git \
  "$ZSH_CUSTOM_DEFAULT/plugins/zsh-autosuggestions"
clone_if_missing https://github.com/zsh-users/zsh-syntax-highlighting.git \
  "$ZSH_CUSTOM_DEFAULT/plugins/zsh-syntax-highlighting"

echo "==> Installing powerlevel10k theme"
clone_if_missing https://github.com/romkatv/powerlevel10k.git \
  "$ZSH_CUSTOM_DEFAULT/themes/powerlevel10k"

echo "==> Linking dotfiles into \$HOME ($MODE mode)"
for f in "${FILES[@]}"; do
  src="$DOTFILES_DIR/$f"
  dst="$HOME/$f"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    echo "  backup: $dst -> $dst.bak"
    mv "$dst" "$dst.bak"
  elif [[ -L "$dst" ]]; then
    rm "$dst"
  fi
  if [[ "$MODE" == "copy" ]]; then
    cp "$src" "$dst"
    echo "  copy:   $src -> $dst"
  else
    ln -s "$src" "$dst"
    echo "  link:   $dst -> $src"
  fi
done

echo
echo "Done. Open a new shell or run: exec zsh"
