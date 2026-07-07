#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../utils.sh"

# Homebrew's git is preferred over the Xcode CLT version (newer, user-managed)
brew_install git

# Create default directories
dirs=(
    "$HOME/Projects"
)
for dir in "${dirs[@]}"; do
    if [ ! -d "$dir" ]; then
        echo "Creating $dir ..."
        mkdir -p "$dir"
    else
        echo "$dir - skipped (already exists)"
    fi
done

source "$SCRIPT_DIR/dev-tools.sh"
source "$SCRIPT_DIR/python.sh"
