#! /usr/bin/bash

# Author: Mirza Mahrab Hossain
# Email : mahrjose.dev@gmail.com
# Github: github.com/Mahrjose/Scripts
# ========================================== #


pushd () {
    command pushd "$@" &> /dev/null
}

popd () {
    command popd "$@" &> /dev/null
}


pickRandom() {
    arrLength=$1
    # 'SRANDOM' is only supported in Bash 5.1 or above
    randNum=$((SRANDOM % $arrLength))
}

getDirectoryNames() {

    declare -ga names
    local dir=$1

    pushd $dir
    for i in */; do
        names+=("$i")

    done; popd

    for index in ${!names[@]};do
        newName="$(echo ${names[$index]} | sed 's/\///')"
        names[$index]="$newName"

    done
}

parent="$HOME/Videos"

select option in Anime Movies TV-Series; do
    case $option in

    Anime )
        getDirectoryNames "$parent/Anime"
        pickRandom ${#names[@]}; sleep 1
        echo -ne "\n [ANIME] You could watch \"${names[$randNum]}\"\n\n"
        exit
        ;;

    Movies )
        getDirectoryNames "$parent/Movies"
        pickRandom ${#names[@]}; sleep 1
        echo -ne "\n [MOVIE] You could watch \"${names[$randNum]}\"\n\n"
        exit
        ;;

    TV-Series )
        getDirectoryNames "$parent/TV-Series"
        pickRandom ${#names[@]}; sleep 1
        echo -ne "\n [TV-SERIES] You could watch \"${names[$randNum]}\"\n\n"
        exit
        ;;

    # Random )
    #     ;;

    * )
        echo -e "Please enter a valid option..."
        ;;

    esac
done
