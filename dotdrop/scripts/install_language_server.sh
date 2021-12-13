#!/usr/bin/env bash
# {{@@ header() @@}}

# Install language server for neovim

# Docker
npm install -g dockerfile-language-server-nodejs

# HTML / CSS / JSON / ESLINT
npm install -g vscode-langservers-extracted

# Bash
npm i -g bash-language-server

# Yaml
npm install -g yaml-language-server

# Typescript
npm install -g typescript-language-server

# Vue
npm install -g @volar/server

# Tailwindcss
npm install -g @tailwindcss/language-server
