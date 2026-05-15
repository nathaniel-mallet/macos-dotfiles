#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../utils.sh"

# Visual Studio Code
brew_cask_install visual-studio-code

# Neovim + dependencies commonly required by plugin ecosystems (LSP, Telescope, etc.)
brew_install neovim
brew_install ripgrep  # live grep (Telescope)
brew_install fd       # file finder (Telescope)
