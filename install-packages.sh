#!/bin/bash
# author: ablil
# Description: Install necessary package with dnf package manager

RED='\033[0;31m'
GREEN='\033[0;312m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Check root
[[ $(id -u) != 0 ]] && { echo "Run as root"; exit 1; }

# Enable rpm fusion
dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

packages=(
    git
    tmux
    tor
    task
    httpd
    curl
    vim
    wget
    npm
    gimp
    keepass
    gparted
    httrack
    vlc
    evince
    firefox
    nodejs
    black
    ShellCheck
    nmap
    wireshark
    eog
    simplescreenrecorder
);

failed_installs=();


for package in "${packages[@]}"; do
    echo "> $package";
done

echo -n "The following package will be installed, do you want to proceed [y/N]";
read -r user_input

[[ "$user_input" = "y" ]] && {
    
    # install packages
    for package in "${packages[@]}"; do
        echo "${YELLOW}[*] Installing $package ...${NC}";
        
        dnf install -y "$package" && {
            echo "${GREEN}[+] Package $package is installed succefully${NC}"
        }
        
        echo "${RED}[-] Failed to install $package ${NC}";
        failed_installs+=("$package");
    done

    # check failed installs
    if [[ ${#failed_installs{@}} != 0 ]]; then

        echo "${RED}[-] Failed to install the following packages: ${NC}";
        for package in "${failed_installs[@]}"; do
            echo "> $package";
        done
        echo "${RED}[-] Failed to install the packages above: ${NC}";
    fi
}
