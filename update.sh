#!/bin/sh

rm -rf dxvk
git clone https://github.com/doitsujin/dxvk dxvk
cd dxvk
rm -rf ~/.local/share/lutris/runtime/dxvk/latest/
./package-release.sh master ~/.local/share/lutris/runtime/dxvk/latest/ --no-package
rm -rf dxvk
cd ~/.local/share/lutris/runtime/dxvk/latest/dxvk-master
cp -r x32 ..
cp -r x64 ..
cd ..
rm -rf dxvk-master