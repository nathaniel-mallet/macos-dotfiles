#!/bin/bash

# Source guard; if this file is sourced more than once,
# this will ensure that its contents aren't redefined.
if [ -n "$_UTILS_SH_LOADED" ]; then
    return
fi
_UTILS_SH_LOADED=1

# Homebrew
# Should already be installed by boot.sh, but guard here in case
# scripts/install/install.sh is run directly after a manual clone.
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew ..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "brew - skipped (already installed)"
fi

# Install a Homebrew formula (CLI tool)
brew_install() {
    if brew list --formula "$1" &> /dev/null; then
        echo "$1 - skipped (already installed)"
    else
        echo "Installing $1 ..."
        brew install "$1"
    fi
}

# Install a Homebrew cask (GUI application)
brew_cask_install() {
    if brew list --cask "$1" &> /dev/null; then
        echo "$1 - skipped (already installed)"
    else
        echo "Installing $1 ..."
        brew install --cask "$1"
    fi
}

# Install a Mac App Store app by numeric ID (requires `mas` to be installed)
mas_install() {
    if mas list | grep -q "^$1 "; then
        echo "$1 - skipped (already installed)"
    else
        echo "Installing App Store app $1 ..."
        mas install "$1"
    fi
}

check_command() {
    command -v "$1" &> /dev/null
}
