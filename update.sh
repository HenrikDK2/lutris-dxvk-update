#!/bin/sh

update(){
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
    echo "$(git log -1 --format=%ct)000" > last_download
}

if test -f "last_download";
    then
        if [ "$(git log -1 --format=%ct)000" -gt "$(<last_download)" ]; 
            then
                update
            else
                echo "Lutris DXVK Update: Latest version is already installed"
        fi
    else
        update
    fi



