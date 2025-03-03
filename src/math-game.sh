#!/bin/bash
clear
cowsay Welcome to the Bash Math Game
echo ""

# TODO: add rpg style exp und level speichern mit text datei

STREAK=0
EXP=0
LEVEL=0
LEVELUP=50

LEVELSYSTEM () {

  if [[ $STREAK == 5 || $STREAK == 10 || $STREAK == 50 ]]; then
    EXP=$(( EXP + 500 ))
    ansi --green "+500 EXP "
  fi

  if [[ $EXP -gt $LEVELUP ]]; then
        LEVEL=$(( $EXP / $LEVELUP ))
        EXP=0
  fi


}

math () {

        local operator_list=("+" "-" "*"  )
        operator=${operator_list[$RANDOM % ${#operator_list[@]}]}
                
        zahl1=$(( 1 + RANDOM % 10 ))
        zahl2=$(( 1 + RANDOM % 10 ))

        let result=$[ zahl1 $operator zahl2 ]
        echo "$zahl1 $operator $zahl2"

                       
        while true; do
            echo -n "$ "
            read answer

            if [[ "$answer" =~ ^-?[0-9]+$ ]]; then
                if [ $answer -eq $result ]; then
                  STREAK=$(( STREAK + 1 ))
                  EXP=$(( EXP + 5 ))
                  ansi --green "Streak:$STREAK!"
                  ansi --green "+5 EXP"
                  LEVELSYSTEM
                  math
                else
                  cowsay YOU DIED
                  ansi --red "Wrong! The answer was $result"
                  ansi --red "You lost your streak of $STREAK"
                  ansi --green "Current LEVEL: $LEVEL"
                  STREAK=0
                  echo "Do you want to continue?(Y/n)"
                  echo -n "$ "
                  read choice
                  if [[ $choice == "Y" || $choice == "y" ]]; then
                        clear
                        cowsay "Let's Continue!"
                        math
                  else
                    clear
                    cowsay Bye 
                    exit
                  fi
                fi
            else
              ansi --red "Wrong Input!"
            fi

           
            

        done

}


main () {

      math

}
main

