#!/usr/bin/env bash
set -euo pipefail

# ─────────────────────────────────────────────
#  zsh + oh-my-zsh automated setup
#  Supports: Ubuntu 24 / 26
# ─────────────────────────────────────────────

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

info()    { echo -e "${GREEN}[✓]${NC} $*"; }
warn()    { echo -e "${YELLOW}[!]${NC} $*"; }
error()   { echo -e "${RED}[✗]${NC} $*"; exit 1; }

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ─── 1. System packages ────────────────────────
info "Updating package list..."
sudo apt update -qq

for pkg in zsh git zsh-syntax-highlighting; do
    if dpkg -s "$pkg" &>/dev/null; then
        warn "$pkg already installed, skipping"
    else
        info "Installing $pkg..."
        sudo apt install -y "$pkg"
    fi
done

# ─── 2. Set zsh as default shell ───────────────
if [ "$SHELL" = "$(which zsh)" ]; then
    warn "zsh is already the default shell"
else
    info "Setting zsh as default shell..."
    chsh -s "$(which zsh)"
    warn "Shell changed — you'll need to log out and back in for it to take effect"
fi

# ─── 3. Homebrew ───────────────────────────────
if command -v brew &>/dev/null; then
    warn "Homebrew already installed, skipping"
else
    info "Installing Homebrew..."
    NONINTERACTIVE=1 /bin/bash -c \
        "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make brew available for the rest of this script
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" 2>/dev/null || true

# ─── 4. Brew packages ──────────────────────────
for pkg in bat eza zsh-autosuggestions; do
    if brew list "$pkg" &>/dev/null; then
        warn "$pkg already installed, skipping"
    else
        info "Installing $pkg via brew..."
        brew install "$pkg"
    fi
done

# ─── 5. oh-my-zsh ──────────────────────────────
if [ -d "$HOME/.oh-my-zsh" ]; then
    warn "oh-my-zsh already installed, skipping"
else
    info "Installing oh-my-zsh..."
    # Install unattended (no shell switch prompt)
    RUNZSH=no CHSH=no \
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# ─── 6. Apply .zshrc ───────────────────────────
if [ -f "$HOME/.zshrc" ]; then
    warn "Backing up existing .zshrc to .zshrc.backup"
    cp "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

info "Copying .zshrc from repo..."
cp "$REPO_DIR/.zshrc" "$HOME/.zshrc"

# ─── Done ──────────────────────────────────────
echo ""
info "All done! Start a new zsh session or run: source ~/.zshrc"
