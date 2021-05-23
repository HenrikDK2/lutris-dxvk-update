#!/bin/sh

dir=$(pwd)

clone (){
    last_update="$(<last_update)"
    rm -rf dxvk
    git clone https://github.com/doitsujin/dxvk dxvk
    cd dxvk
    git_unix="$(git log -1 --format=%ct)000"
    cd $dir
    
    if [ ! -f "last_update" ] || [ $git_unix -gt $last_update ]; 
        then
            update
        else
            echo "Lutris DXVK Update: Latest version is already installed"
        fi
}

update(){
    cd dxvk
    rm -rf ~/.local/share/lutris/runtime/dxvk/latest/
    ./package-release.sh master ~/.local/share/lutris/runtime/dxvk/latest/ --no-package
    rm -rf dxvk
    cd ~/.local/share/lutris/runtime/dxvk/latest/dxvk-master
    cp -r x32 ..
    cp -r x64 ..
    cd ..
    rm -rf dxvk-master
    cd $dir
    echo $git_unix > last_update
}

clone

