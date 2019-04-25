#!/bin/bash

rm -rf pkg src *.xz *.gz
makepkg -si --noconfirm
cd src/st-0.8.2/
rm -rf *.o* LEGACY FAQ TODO config.def.h st
cd ../
rm -f *.diff *.h *.desktop
cd ../
rsync  src/st-0.8.2/* ../st-pub/
rm -rf pkg *.xz *.gz
