export OMZ="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
)

# Resolve repo root from this file's real location
DEV_TTY_ROOT="$(cd "$(dirname "${(%):-%N}")/.." && pwd)"

# Source from the repo
source "$OMZ/oh-my-zsh.sh"
source "$DEV_TTY_ROOT/zsh/aliases.zsh"
[[ -f "$DEV_TTY_ROOT/zsh/local.zsh" ]] && source "$DEV_TTY_ROOT/zsh/local.zsh"

HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt AUTO_CD
