#!/bin/bash
# Author: ablil
# Description: Install the latest version of Postman


# check .desktop file
[[ ! -f Postman.desktop ]] && { echo "[*] Postman.desktop is missing !!!"; exit 1; }

download package
download_link='https://dl.pstmn.io/download/latest/linux64';
curl "$download_link" --output /tmp/postman.tar.gz || {
  echo "[-] Failed to download postman package !!!";
  echo "[?] Download manually from: ";
  echo "$download_link";
  exit -1;
}

# install package
sudo tar xfz /tmp/postman.tar.gz -C /opt/ && {
  cp -v Postman.desktop ~/.local/share/applications/ && {
    cp -v Postman.png ~/.local/share/applications/
    echo "[*] Postman is installed successfully";
    exit 0;
  }
  echo "[-] Failed to copy Postman.desktop to ~/.local/share/applications/";
}