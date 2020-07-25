#!/bin/bash
# Author: ablil
# Description: install docker on fedora 32 version ( this is specific )


wget https://download.docker.com/linux/fedora/31/x86_64/stable/Packages/containerd.io-1.2.13-3.2.fc31.x86_64.rpm || {
    echo "[-] Failed to download container.io, link may have been changed"
    exit 1;

}

wget https://download.docker.com/linux/fedora/31/x86_64/stable/Packages/docker-ce-19.03.9-3.fc31.x86_64.rpm || {
    echo "[-] Failed to download docker-ce, link may have changed"
    exit 1;
}

wget https://download.docker.com/linux/fedora/31/x86_64/stable/Packages/docker-ce-cli-19.03.9-3.fc31.x86_64.rpm || {
    echo "[-] Failed to download docker-ce-cli, link may have changed"
    exit 1;
}


dnf localinstall -y containerd.io-1.2.13-3.2.fc31.x86_64.rpm docker-ce-cli-19.03.9-3.fc31.x86_64.rpm docker-ce-19.03.9-3.fc31.x86_64.rpm || {
    echo '[-] Failed to install docker packages'
    exit 1;
}

echo '[+] Docker is installed successfully"

