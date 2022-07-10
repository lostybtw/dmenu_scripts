#!/bin/bash

bookdir=~/Downloads/books
All_The_Bright_Places=$bookdir/All_The_Bright_Places
Its_Kind_Of_A_Funny_Story=$bookdir/"It’s_Kind_Of_A_Funny_Story/"

declare -a books=(
"$All_The_Bright_Places"
"$Its_Kind_Of_A_Funny_Story"
"last read"
"exit"
)

choice=$(printf '%s\n' "${books[@]}" | dmenu -i -l 20 -p 'Ebook Manager: ')

if [[ "$choice" == "exit" ]];then
    exit
elif [[ "$choice" == "last read" ]];then
    cd bookdir
    book=`cat current_book.txt`
    cd $book
    current=`cat current.txt`
    librewolf $book/$current
else
    touch current_book.txt
    echo "${choice}" > current_book.txt
    cd "${choice}/EPUB"
    choice=$( ls *.xhtml | dmenu -i -l 20 -p '${choice}')
    touch current.txt
    echo $choice > current.txt
    librewolf "$choice"
fi
