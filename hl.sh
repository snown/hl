#!/usr/bin/env bash

absPath () {
    echo `perl -MCwd=realpath -e "print realpath '$1'"`
}

SOURCE_DIR=`absPath "$1"`
LINK_DIR=`dirname "$SOURCE_DIR"`

# argCount=$#
# echo $argCount
# 
# echo

i=1
for arg in "$@"; do
    ARG_PATH=`absPath "$arg"`
    
    fileList[$i-1]=$ARG_PATH
    fileList[$i-1]=$ARG_PATH
    
    # echo "Arg $i: $arg --> $ARG_PATH"
    
    let "i++"
done

# echo
# 
# echo $fileList
# 
# echo

# echo "rsync -aP --link-dest=\"$LINK_DIR\" \"${fileList[@]}\"" # > ~/hlLog

# echo >> ~/hlLog

rsync -aP --link-dest="$LINK_DIR" "${fileList[@]}" # >> ~/hlLog