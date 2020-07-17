#!/bin/bash
# Author: ablil
# Description: Install vscode and some extensions

extensions=(
    adpyke.vscode-sql-formatter
    alefragnani.Bookmarks
    Angular.ng-template
    CoenraadS.bracket-pair-colorizer
    dbaeumer.vscode-eslint
    Gruntfuggly.todo-tree
    lonefy.vscode-JS-CSS-HTML-formatter
    mikestead.dotenv
    ms-azuretools.vscode-docker
    ms-python.python
    ms-vscode-remote.remote-ssh
    ms-vscode-remote.remote-ssh-edit
    ms-vscode.cpptools
    PKief.material-icon-theme
    ritwickdey.live-sass
    ritwickdey.LiveServer
    shakram02.bash-beautify
    sibiraj-s.vscode-scss-formatter
    syler.sass-indented
    TabNine.tabnine-vscode
    tomoki1207.pdf
    vscodevim.vim
    xyz.plsql-language
    yzhang.markdown-all-in-one
);

failed_installs=();

# install key and repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc || {
    echo "[-] Failed to import repository key";
    exit 1;
}

sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo' || {
    echo "[-] Failed to add vscode repository";
    exit 1;
}

# install vscode
sudo dnf check-update;
sudo dnf install -y code && {
    
    # Install extensions
    for extension in "${extensions[@]}"; do
        code --install-exntension "$extension" || {
            failed_installs+=("$extension");
        }
    done;
    
    # Checked failed install
    if [[ ${#failed_installs[@]} != 0 ]]; then
        
        echo "[-] Failed to install the follwoing extensions";
        for extension in "${failed_installs[@]}"; do
            echo "> $extension";
        done
        echo "[-] Failed to instal the extensions above";

    fi;
    
}