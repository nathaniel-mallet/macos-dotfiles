#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../utils.sh"

# Python
brew_install python

# uv - Python package installer and virtual environment manager
brew_install uv
