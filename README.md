# Fedora  Setup

These are quick script to install all necessary tools for my daily development on Fedora Distribution.

Distribution:
```
NAME=Fedora
VERSION="31 (Workstation Edition)"
ID=fedora
VERSION_ID=31
VERSION_CODENAME=""
PLATFORM_ID="platform:f31"
PRETTY_NAME="Fedora 31 (Workstation Edition)"
ANSI_COLOR="0;34"
LOGO=fedora-logo-icon
CPE_NAME="cpe:/o:fedoraproject:fedora:31"
HOME_URL="https://fedoraproject.org/"
DOCUMENTATION_URL="https://docs.fedoraproject.org/en-US/fedora/f31/system-administrators-guide/"
SUPPORT_URL="https://fedoraproject.org/wiki/Communicating_and_getting_help"
BUG_REPORT_URL="https://bugzilla.redhat.com/"
REDHAT_BUGZILLA_PRODUCT="Fedora"
REDHAT_BUGZILLA_PRODUCT_VERSION=31
REDHAT_SUPPORT_PRODUCT="Fedora"
REDHAT_SUPPORT_PRODUCT_VERSION=31
PRIVACY_POLICY_URL="https://fedoraproject.org/wiki/Legal:PrivacyPolicy"
VARIANT="Workstation Edition"
VARIANT_ID=workstation

```

# Content

  * install-packages.sh
  
    This script will install basic packages needed for daily development, typically it will install the following;
    * git: Verion control 
    * tmux: Terminal multiplexer
    * tor: Tor network service
    * task: Todo list app (terminal based)
    * httpd: Apache server
    * curl: Command line tools for transfering data ...
    * vim: improved version of vi editor
    * wget: Retrievel Utility
    * npm: Node package manager
    * gimp: Image editor
    * keepass: Password manager
    * gparted: Disk manager tool
    * httrack: 
    * vlc: Video Player
    * evince: PDF reader
    * firefox: Browser
    * nodejs: Nodejs env



  * configure-shell.sh

    This script will setup the following configuration files:
    * .bash_aliases: Bash aliases
    * .vimrc: vim configuration file
    * .bashrc: Bash configuration file



  * install-postgresql.sh

    This script will install postgresql-server (version 11)



  * installl-postman.sh
  
    This script will install Postman API Tool and setup .desktop file



  * install-rpm-packages.sh

    This script will install rpm based packages, typically it will install the following package:
    * googe chrome: Browser



  * install-vscode.sh
  
    This script will install vscode editor and the following extensions:
    * sql-formatter
    * Bookmarks
    * ng-template
    * bracket-pair-colorizer
    * vscode-eslint
    * todo-tree
    * JS-CSS-HTML-formatter
    * dotenv
    * vscode-docker
    * python
    * remote-ssh
    * cppptools
    * material-icon-theme
    * live-sass
    * Liverserver
    * bash-beautify
    * vscode-scss-formatter
    * sass-indented
    * tabine-vscode
    * pdf
    * plsql-language
    * markdown-all-in-one