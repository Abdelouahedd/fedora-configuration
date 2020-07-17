#!/bin/bash

# bash aliases
confi_file_link='https://gist.githubusercontent.com/ablil/d98b5f32a4fd5a4bca95089c4867f881/raw/61a8d13d8172fa4ea40db084fe6d36a270b46e03/.bash_aliases'
wget "$config_file_link" -O ~/.bash_aliases
source ~/.bash_aliases


# vim
config_file_link='https://gist.githubusercontent.com/ablil/1724c6596c55760ab652fbd02ab5b99d/raw/e87443f73f475896ea943ce9d9db2e92590441c0/.vimrc'
wget "$config_file_link" -O ~/.vimrc
source ~/.vimrc


# bashrc prompt
config_file_link='https://gist.githubusercontent.com/ablil/0d91856ca3df35ec58da3cf4e2b531b0/raw/755d5c2424dbadc285c05d353325036214c50676/.bashrc'
wget "$config_file_link" -O /tmp/.bashrc
cat /tmp/.bashrc >> ~/.bashrc
source ~/.bashrc

