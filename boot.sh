#!/bin/bash

ascii_logo='
░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀'

clear

echo -e "\n$ascii_logo\n"
echo -e "macOS Dotfiles\n"
echo -e "https://github.com/nathaniel-mallet/macos-dotfiles\n"

read -rp "Do you want to run the macOS Dotfiles installation on this machine? (y/n): " answer

if [ "$answer" != "y" ]; then
    echo "Cancelled installation"
    exit 0
fi

echo -e "\nInstalling prerequisites and fetching installation files"

# Xcode Command Line Tools — provides git, clang, make, and other essentials.
# Homebrew also requires this, so it must come first.
if xcode-select -p &> /dev/null; then
    echo "Xcode Command Line Tools - skipped (already installed)"
else
    echo "Installing Xcode Command Line Tools ..."
    xcode-select --install
    echo "Please complete the Xcode CLT installation dialog, then press Enter to continue ..."
    read -r
fi

# Homebrew
if command -v brew &> /dev/null; then
    echo "Homebrew - skipped (already installed)"
else
    echo "Installing Homebrew ..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# On Apple Silicon, Homebrew installs to /opt/homebrew rather than /usr/local.
# Ensure it's on PATH for the rest of this script.
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

git clone "https://github.com/nathaniel-mallet/macos-dotfiles.git" "$HOME/.local/share/macos-dotfiles" >/dev/null

echo -e "\nStarting installation ...\n"
source "$HOME/.local/share/macos-dotfiles/scripts/install/install.sh"
