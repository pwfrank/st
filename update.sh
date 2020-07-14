#!/bin/bash

if [[ "$PWD" == "$HOME" ]]; then
		echo >&2 "Error: in $HOME directory"
		exit 1
fi

rm -rf pkg src *.xz
makepkg -si --noconfirm || exit 1
cd src/st-0.8.3/ || exit 1
rm -rf *.o* LEGACY FAQ TODO config.def.h st config.h
ln -s ../../config.h .
cd ../
rm -f *.diff *.h *.desktop *.gz
cd ../
rm -rf pkg *.xz
