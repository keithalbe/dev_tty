#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Installing dev_tty..."
echo "==> Repo root: $REPO_ROOT"

# Check if zsh is installed
if ! command -v zsh >/dev/null 2>&1; then
  echo "Error: zsh is not installed, install manually and re-run."
  exit 1
fi
echo "==> zsh found."

# Install Oh My Zsh if missing
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "==> Installing Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "==> Oh My Zsh already installed."
fi

# Set default shell if needed
if [[ "$SHELL" != "$(command -v zsh)" ]]; then
  echo "==> Setting zsh as default shell..."
  chsh -s "$(command -v zsh)" || true
fi

# Link configs
echo "==> Linking configs..."
ln -sf "$REPO_ROOT/zsh/.zshrc"     "$HOME/.zshrc"
ln -sf "$REPO_ROOT/git/.gitconfig" "$HOME/.gitconfig"

echo ""
echo "Done."
echo "Run: source ~/.zshrc"
