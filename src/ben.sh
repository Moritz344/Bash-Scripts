#!/bin/bash

ben() {
        
        local list=("Yes" "No" "Maybe" "" "I wish you never asked that" )
        answer=${list[$RANDOM % ${#list[@]}]}
        ansi --red $answer
}

main () {
        clear
        ansi --green "-- Ask Ben a Yes or No question and he may answer --"

        echo ""

        while true; do
           echo -n "< "
           read question
           if  [ "$question" == "ok" ] ; then
             echo "ok"
           elif [[  "$question" == "Yes" || "$question" == "yes" ]]; then
             echo "No please not."
           else
                ben 
           fi
        done


}
main
