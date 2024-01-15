#!/usr/bin/env bash

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

cd /etc/nixos
git pull
nixos-rebuild --flake /etc/nixos switch