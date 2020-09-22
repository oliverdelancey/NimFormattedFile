#!/usr/bin/env bash

set -e

install_path=/usr/local/bin

echo "Removing executable..."
sudo rm "$install_path/nff"

if [ $XDG_CONFIG_HOME ]
then
    confpath="$XDG_CONFIG_HOME/nff"
else
    confpath="$HOME/.config/nff"
fi
echo "Removing configuration directory..."
rm -rf "$confpath"

echo "Uninstallation DONE."

