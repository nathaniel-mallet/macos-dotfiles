# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a macOS dotfiles repository for managing personal system configuration. It is currently in early setup — only a LICENSE and README exist so far.

## Conventions to follow when adding dotfiles

- Use symlinks (managed via a script or tool like `stow`, `chezmoi`, or a hand-rolled install script) so the repo can be cloned anywhere and linked into `$HOME`.
- Group configs by tool (e.g., `zsh/`, `git/`, `nvim/`, `tmux/`).
- Secrets (API keys, tokens) must never be committed — use `*.local` files ignored by `.gitignore` or a secrets manager.
