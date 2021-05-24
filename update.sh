#!/bin/sh

tmp_dir=~/.dxvk_update
lutris_dir=~/.local/share/lutris/runtime/dxvk/latest

clone (){
    cd ~
    if [ ! -d ".dxvk_update" ]; then mkdir .dxvk_update; fi
    cd .dxvk_update
    last_update="$(<last_update)"
    rm -rf dxvk
    git clone https://github.com/doitsujin/dxvk dxvk
    cd dxvk
    git_unix="$(git log -1 --format=%ct)000"
    cd $tmp_dir
    
    if [ ! -f "last_update" ] || [ ! -d $lutris_dir ] || [ $git_unix -gt $last_update ]; 
        then
            update
        else
            echo -e "\e[1;33m Lutris DXVK Update: Latest version is already installed \e[0m"
            rm -rf dxvk
        fi
}

update(){
    cd dxvk
    rm -rf $lutris_dir
    ./package-release.sh master $lutris_dir --no-package
    cd "$lutris_dir/dxvk-master"
    cp -r x32 ..
    cp -r x64 ..
    cd ..
    rm -rf dxvk-master
    cd $tmp_dir
    rm -rf dxvk
    echo $git_unix > last_update
}

clone

