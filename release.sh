#!/bin/bash
# copy to release
read -p "Are you sure want to write over 'relase' directory[y/n] :" word
if [ $word = "y" ]; then
    cp ./script/*.sh ../../runtime/release/script
    echo "Release Success."
else
    echo "Not Release, Exit."
fi