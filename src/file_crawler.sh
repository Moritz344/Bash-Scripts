#!/bin/bash


URL=$1

option_1 () {
    echo "Downloading file from $URL"
    sleep 3
    wget $URL

}

option_2 () {
    echo "Downloding web page"
    sleep 3
    echo "Creating Directory for web page"
    sleep 3
    wget --page-requisites --convert-links --wait=3 $URL

}

option_3 () {
    echo "URL: $URL"
    echo "Which File Should I save it to?"
    read filename
    echo "Downloading ..."
    sleep 3
    wget --output-document $filename $URL

}
while true; do
        cowsay Welcome My Friend!
        ansi --green "1) Download File from web page"
        ansi --green "2) Download a single web page and all its resources"
        ansi --green "3) Download the contents of a URL to a file"
        echo ""
        read -p "Enter choice [1-3]:" choice
        case $choice in
          "1")
            option_1
           ;;
        
          "2")
            option_2
            ;;
        
          "3")
            option_3
            ;;
          *)
            ansi --red "Invalid Option!"
            ;;
        esac
done
