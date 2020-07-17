#!/bin/bash
# author: ablil
# Description: Install third party tools

# Check root
[[ "$(id -u)" != 0 ]] && { echo "Run as root"; exit 1; }


RED='\033[0;31m';
GREEN='\033[0;32m';
YELLOW='\033[0;33m';
NC='\033[0m';

failed_install_packages=();
failed_download_packages=();

declare -A packages;

packages['google-chrome']='https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm';


function check_failed_packages() {
    
    # Display package package which failed to be downloaded
    if [[ ${#failed_download_packages[@]} != 0 ]]; then
        
        echo "";
        echo "";
        echo -e "${RED}[-] Failed to download the follwing packages${NC}";
        
        for pkg in "${failed_download_packages[@]}"; do
            echo "> $pkg";
        done;
    fi;
    
    # Display packages which failed to be installed
    if [[ ${#failed_install_packages[@]} != 0 ]]; then

        echo "";
        echo "";
        echo -e "${RED}[-] Failed to install the follwing packages${NC}";
        
        for pkg in "${failed_install_packages[@]}"; do
            echo "> $pkg";
        done;
    fi;
    
}


function install_package() {
    
    package_name="$1";
    download_link="$2";
    
    # Check arguments
    [[ -z "$package_name" || -z "$download_link" ]] && {
        echo -e "${RED}[-] Missing packages name or downlaod link${NC}";
        exit 1;
    }
    
    # Download package
    echo -e "${YELLOW}[*] Downloading $package_name ...${NC}";
    wget "$download_link" -O "$package_name.rpm" && {
        
        # Install package
        echo -e "${YELLOW}[*] installing $package_name ...${NC}";
        dnf localinstall -y googe-chrome.rpm || {
            failed_install_packages+=("$package_name");
            echo -e "${RED}[-] Failed to install $package_name ${NC}";
            return;
        }
        
        echo -e "${[GREEN]}[+] $package_name installed successfully ${NC}";
        rm -rf "$package_name.rpm";
        return;
    }
    
    failed_download_packages+=("$package_name");
    echo -e "${RED}[-] Failed to download $package_name, Download link may have changed/Invalide${NC}";
}

function main() {
    
    # Get user permission to install
    for package_name in "${!packages[@]}"; do
        echo "> $package_name";
    done;

    echo -n "[?] The following package will be installed, continue [y/N]: ";
    read -r user_input;
    [[ -z "$user_input" || "$user_input" = "N" ]] && exit 1;
    


    # Install packages
    for package_name in "${!packages[@]}"; do
        package_link="${packages[$package_name]}";

        install_package "$package_name" "$package_link";
    done;

}

main;
check_failed_packages;