# {{@@ header() @@}}

set -x EDITOR 'nvim'

set -g REPO_LOCATION "$HOME/Desktop"

{%@@ if profile == "Krapaince-arch" @@%}
set -x SOUNDBOARD_LOCATION ~/Music/Soundboard/
{%@@ endif @@%}

set -g NPM_PACKAGES ~/.npm-global/bin
set -g LOCAL_BIN ~/.local/bin
set -g VIM_SCRIPT ~/.config/nvim/scripts/
set -g CARGO_BIN ~/.cargo/bin

set -x PATH $PATH:$LOCAL_BIN:$VIM_SCRIPT:$CARGO_BIN:$NPM_PACKAGES
{%@@ if profile == "Krapaince-ubuntu" @@%}
set -g PATH $PATH:/snap/bin
{%@@ endif @@%}

source ~/.config/omf/alias.fish
