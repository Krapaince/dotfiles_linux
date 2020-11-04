# Path to your oh-my-zsh installation.
export USER_HOME="krapaince"
export ZSH="/home/$USER_HOME/.oh-my-zsh"
export EDITOR=nvim
export DRAIN=~/Desktop/GIT/config/scripts/drain/my_radar

export PAGER='less'
# Color for man
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

ZSH_THEME="agnoster"
plugins=(
    git
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH=$PATH:~/Desktop/GIT/scripts:~/Application:


## Utilities
alias v="nvim"
alias autodebug_facile_comme_2_plus_2_egal_22="make CFLAGS+='-ggdb3' -j"
alias autodebug_facile_comme_2_plus_2_egal_22_cpp="make CXXFLAGS+='-ggdb3' -j"
alias blih='blih -u mathieu.pointecouteau@epitech.eu'
alias c="clear"
alias ro="rm *.o"
alias formatter="/usr/bin/clang-format -style=file -fallback-style=none -assume-filename="
alias ls="lsd"
alias firefox="/usr/bin/firefox"

## Go to
REPO_LOCATION="$HOME/Desktop"
alias cde="cd $REPO_LOCATION/EPITECH/"
alias cdg="cd $REPO_LOCATION/GIT/"
alias cdw="cd $REPO_LOCATION/EPITECH/delivery"
alias cdd="cd $REPO_LOCATION"
alias cdc="cd ~/.config"

## Git
alias gs="git status"
alias gl="git log"
alias gaa="git add --all"
alias gc="git commit"
alias gco="git checkout"
alias gpu="git pull"
alias gp="git push"
alias gpo="git push origin"
alias gpom="git push origin master"

## Makefile
alias amke="make"
alias amek="make"
alias maek="make"
alias m="make -j"
alias mc="make clean"
alias mf="make fclean"
alias mt="make tests_run -j"
alias mg="make gcovr -j"

#Blih
alias repo_list="blih -u mathieu.pointecouteau@epitech.eu repository list"

##Valgrind
alias valgrindf="valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --dsymutil=yes --num-callers=500 --log-file=valgrind.txt"

alias fighter="man"

function bat()
{
    PAGER=less `whence -p bat` $@
}

#clang-format
alias clang-format-all="find . -name \"*.hpp\" -print -o -name \"*.cpp\" -print -o -name \"*.c\" -print -o -name \"*.h\" -print | xargs clang-format -i --verbose"
