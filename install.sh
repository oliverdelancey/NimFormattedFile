#!/usr/bin/env bash

set -e

install_path="/usr/local/bin"

echo "Compiling nff.nim & installing to $install_path..."
nim c -d:release nff.nim
sudo cp nff "$install_path"
echo "Executable installation complete."

if [ $XDG_CONFIG_HOME ]
then
    confpath="$XDG_CONFIG_HOME/nff"
else
    confpath="$HOME/.config/nff"
fi

if [ -d $confpath ]
then
    echo "Looks like you already have a config directory. How would you like to proceed?"
    echo "W -- wipe all existing configs and copy new configs over. WARNING: This operation cannot be undone."
    echo "M -- leave your configs untouched and install any new configs."
    echo "I -- don't do anything; leave your configs alone and continue with the installation."
    answer=""
    while [[ !( "$answer" =~ ^(w|m|i)$ ) ]]
    do
        echo "(W/M/I):"
        read answer
        answer=${answer,,}
    done
    if [ "$answer" = "w" ]
    then
        echo "Wiping templates directory..."
        rm -rf "$confpath/templates"
        cp -r templates "$confpath"
    elif [ "$answer" = "m" ]
    then
        echo "Merging user templates with distribution templates..."
        rsync -a -v --ignore-existing templates/* "$confpath/templates"
    elif [ "$answer" = "i" ]
    then
        echo "Skipping template installation..."
    fi
else
    echo "Creating config directory..."
    mkdir "$confpath"
    echo "Creating central config..."
    cp central.yaml "$confpath"
    echo "Creating templates directory..."
    cp -r templates "$confpath"
fi
echo "Configuration complete."
echo "Installation DONE."

