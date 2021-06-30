# {{@@ header() @@}}

# Disable welcome message
set -U fish_greeting

set -gx EDITOR 'nvim'
set -gx PAGER 'less'


# Color for man
set -gx LESS_TERMCAP_mb \e'[1;32m'
set -gx LESS_TERMCAP_md \e'[1;32m'
set -gx LESS_TERMCAP_me \e'[0m'
set -gx LESS_TERMCAP_se \e'[0m'
set -gx LESS_TERMCAP_so \e'[01;33m'
set -gx LESS_TERMCAP_ue \e'[0m'
set -gx LESS_TERMCAP_us \e'[1;4;31m'

set -g REPO_LOCATION "$HOME/Desktop"

{%@@ if profile == "Krapaince-arch" @@%}
set -x SOUNDBOARD_LOCATION ~/Music/Soundboard/
{%@@ endif @@%}

set PATH ~/.npm-global/bin ~/.local/bin ~/.config/nvim/scripts/ ~/.cargo/bin $PATH

source ~/.config/omf/alias.fish
