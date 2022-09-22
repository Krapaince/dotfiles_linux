#!/usr/bin/env bash

####
#
# USAGE: install.sh profie
#
# profile: A profile represents a list of files in which there is a list of
# packages to install.
#
#   Must be one of:
#     - Krapaince-MASTER-arch
#     - Krapaince-arch
#     - krapaince_tty
#
# PURPOSE: Install package for a given dotdrop profiles.
###

NO_COLOR='\e[0m'
BOLD='\e[1m'
CYAN='\e[1;36m'

PROFILES=('Krapaince-MASTER-arch' 'Krapaince-arch' 'krapaince_tty')
COMMON_PKG_FILES='aur aur-ls pacman pacman.ls'
COMMOON_GUI_PKG_FILES="$COMMON_PKG_FILES, aur.gui pacman.gui"

PROFILE_PACKAGE_FILES=()
PROFILE_PACKAGE_FILES[0]="$COMMON_PKG_FILES aur.gui-x pacman.gui-x"
PROFILE_PACKAGE_FILES[1]="$COMMON_PKG_FILES aur.gui-wayland pacman.gui-wayland"

PROGNAME=`type $0 | awk '{print $3}'`  # search for executable on path
PROGDIR=`dirname $PROGNAME`            # extract directory of program
PROGNAME=`basename $PROGNAME`          # base name of program

usage_error()
{
  echo >&2 "$PROGNAME: $@"
  sed >&2 -e '1,/^####/d;  /^###/g;  /^#/!q;  s/^#//;  s/^ //;' "$PROGDIR/$PROGNAME"
}

usage()
{
  echo "$PROGNAME: $@"
  sed -e '1,/^####/d;  /^###/g;  /^#/!q;  s/^#//;  s/^ //;' "$PROGDIR/$PROGNAME"
}

suggest_usage()
{
  echo "Try $PROGNAME -h for usage."
}

if [ $# -ne 1 ]; then
  usage_error
  exit 1
fi

if [[ $1 == "-h" || $1 == "--help" ]]; then
  usage
  exit 0
fi

IS_VALID_PROFILE=0

for i in "${!PROFILES[@]}"; do
  PROFILE=${PROFILES[$i]}
  if [ $PROFILE == $1 ]; then
    IS_VALID_PROFILE=1
    INDEX=$i
    break
  fi
done

if [ $IS_VALID_PROFILE -eq 0 ]; then
  echo >&2 "$1 is not a valid profile."
  suggest_usage
  exit 1
fi

readarray -td ' ' PACKAGE_FILES <<<"${PROFILE_PACKAGE_FILES[$INDEX]}"

for PACKAE_FILE in "${PACKAGE_FILES[@]}"; do
  echo -e "${BOLD}Installing package from ${CYAN}$PACKAE_FILE${NO_COLOR}${BOLD} file${NO_COLOR}"
  paru -S  --needed - < $PACKAE_FILE
done
