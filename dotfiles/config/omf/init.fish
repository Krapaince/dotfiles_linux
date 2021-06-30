# {{@@ header() @@}}

# Disable welcome message
set -U fish_greeting

set -x EDITOR 'nvim'

set -g REPO_LOCATION "$HOME/Desktop"

{%@@ if profile == "Krapaince-arch" @@%}
set -x SOUNDBOARD_LOCATION ~/Music/Soundboard/
{%@@ endif @@%}

set PATH ~/.npm-global/bin ~/.local/bin ~/.config/nvim/scripts/ ~/.cargo/bin $PATH

source ~/.config/omf/alias.fish
