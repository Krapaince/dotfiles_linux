# {{@@ header() @@}}

alias v="nvim"
alias c="clear"
alias ls="exa --icons"

## Go to
alias cdc="cd ~/.config"
alias cdf="cd (find . -type d | fzf --reverse)"

{%@@ if profile == "Krapaince-arch" or profile == "Krapaince-MASTER-arch" @@%}
alias cdd="cd $REPO_LOCATION"
alias cde="cd $REPO_LOCATION/EPITECH/"
alias cdg="cd $REPO_LOCATION/GIT/"
alias cdw="cd $REPO_LOCATION/EPITECH/delivery"
alias cdp="cd $REPO_LOCATION/EPITECH/EIP/Pizzi"
{%@@ endif @@%}

## Git
alias gs="git status"
alias gl="git log"

##Valgrind
alias valgrindf="valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --dsymutil=yes --num-callers=500 --log-file=valgrind.txt"
alias valgrind-colour="cat valgrind.txt | colout -t valgrind | less"

#clang-format
alias clang-format-all="find . -name \"*.hpp\" -print -o -name \"*.cpp\" -print -o -name \"*.c\" -print -o -name \"*.h\" -print | xargs clang-format -i --verbose"
alias formatter="/usr/bin/clang-format -style=file -fallback-style=none -assume-filename="

alias bs="sudo systemctl start bluetooth.service"
alias sb="sudo systemctl stop bluetooth.service"

alias copy_lazy_lock_file="cp ~/.config/nvim/lazy-lock.json {{@@ cwd @@}}/dotfiles/config/nvim"

function ya
	set tmp (mktemp -t "yazi-cwd.XXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

if test -f ~/.config/omf/custom_alias.fish
    source ~/.config/omf/custom_alias.fish
end
