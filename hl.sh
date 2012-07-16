#!/usr/bin/env bash

absPath () {
    myPath=$1
    
    fileType=`stat -f "%HT" "$1"`
    if [[ "$fileType" == "Symbolic Link" ]]; then
        myPath=`readlink "$1"`
    fi
    
    echo `perl -MCwd=realpath -e "print realpath '$myPath'"`
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
    
    # echo "Arg $i: $arg --> $ARG_PATH"
    
    let "i++"
done

# echo
# 
# echo $fileList
# 
# echo

# echo "rsync -aLP --link-dest=\"$LINK_DIR\" \"${fileList[@]}\"" # > ~/hlLog

# echo >> ~/hlLog

rsync -aLP --link-dest="$LINK_DIR" "${fileList[@]}" # >> ~/hlLog