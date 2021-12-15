#!/bin/bash -i

saveCommand () {
    #Get number of rows
    NUM=`wc "${HISTORY_PATH}" | awk '{print $1}'`
    
    NUM=$((NUM-1))
    #Get row by index
    COMMAND=`cat "${HISTORY_PATH}" | awk 'FNR == '${NUM}''`
    
    for (( i=0; i<${#COMMAND}; i++ )); do
        if [ "${COMMAND:$i:1}" == ";" ]
        then
            RESULT=${COMMAND:$i+1}
        fi
    done
    
    echo $RESULT
    
    echo "Save command (y/n)? "
    read ANSWER
    
    if [ "$ANSWER" != "${ANSWER#[Yy]}" ] ;then
        echo 'Description: '
        read DESCRIPTION
        
        NO=`wc "$FILE_PATH" | awk '{print $1}'`
        echo ${NO},${RESULT},${DESCRIPTION} >> $FILE_PATH
        echo 'saved...'
    fi
    
}

FILE_PATH=~/.historys
HISTORY_PATH=~/.zsh_history

touch "$FILE_PATH"

#Add titles
SIZE=`wc $FILE_PATH | awk '{print $1}'`

if [[ $SIZE == 0 ]]
then
    eval "echo 'No,command,description' >> $FILE_PATH"
fi

case $1 in
    "l")
        column -t -s ',' "$FILE_PATH"
    ;;
    
    "s")
        saveCommand
    ;;
    
    *)
        STATEMENTS
    echo "provide parmas l (list) or s (save)";;
esac
