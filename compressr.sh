#!/bin/bash


function compressRecursively() {
for file in "$1"/*
do
    if [ ! -d "${file}" ] ; then
        echo "${file} is a file"
		if [ ${file: -4} == ".jpg" ]; then
		convert -resize 50% -quality 80 "${file}" "${file}";
		fi
    else
        echo "entering recursion with: ${file}"
        compressRecursively "${file}"
		cd ..
    fi
done
}

function main() {
    compressRecursively "$1"
}

main "$1"