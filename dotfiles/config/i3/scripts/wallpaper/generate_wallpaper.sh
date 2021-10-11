#!/usr/bin/env bash
# {{@@ header() @@}}
set -eu

source ~/.config/i3/scripts/wallpaper/common.sh

usage() {
    local PROGRAM=$(type $0 | awk '{print $3}')
    echo "USAGE:"
    echo "  $PROGRAM COLOR_SET_ROW_INDEX"
    echo ""
    echo "DESCRIPTION:"
    echo "  A script to generate an image from a color_set.json row."
    echo ""
    echo "PARAMETERS:"
    echo "  COLOR_SET_ROW_INDEX: A row index from the colors array of color_set.json"
}

if [ $# -eq 0 ]; then
    echo ""
    usage
    exit 1
elif [ $# -ne 1 ]; then
    echo "Invalid number of arguments"
    echo ""
    usage
    exit 1
else
    INDEX=$1; shift
    JSON_SETTING=$(jq ".colors[$INDEX]" $COLOR_SET_PATH)

    LOWTHRESH=$(    echo $JSON_SETTING | jq '.l')
    HIGHTHRESH=$(   echo $JSON_SETTING | jq '.h')
    RED=$(          echo $JSON_SETTING | jq '.r')
    YELLOW=$(       echo $JSON_SETTING | jq '.y')
    GREEN=$(        echo $JSON_SETTING | jq '.g')
    CYAN=$(         echo $JSON_SETTING | jq '.c')
    BLUE=$(         echo $JSON_SETTING | jq '.b')
    MAGENTA=$(      echo $JSON_SETTING | jq '.m')

    INPUT_FILE=$SOURCE_FILE
    OUTPUT_FILE=$(make_img_filename_from_parameters $LOWTHRESH $HIGHTHRESH $RED $YELLOW $GREEN $CYAN $BLUE $MAGENTA)

    colors=('r' 'y' 'g' 'c' 'b'  'm')

    if [[ $(echo $LOWTHRESH+$HIGHTHRESH+$RED+$YELLOW+$GREEN+$CYAN+$BLUE+$MAGENTA | bc) = 0 ]]; then
        exit 0
    fi

    if [[ ! -f "$WALLPAPERS_DIR/$OUTPUT_FILE" ]]; then
        for color in "${colors[@]}"; do
            AMOUNT=$(echo $JSON_SETTING | jq ".$color")

            if [[ $AMOUNT -ne 0 ]]; then
                colorbalance2 -l $LOWTHRESH -h $HIGHTHRESH -c $color -a $AMOUNT -r h "$INPUT_FILE" "$WALLPAPERS_DIR/$OUTPUT_FILE"
                INPUT_FILE="$WALLPAPERS_DIR/$OUTPUT_FILE"
            fi
        done
    fi
fi
