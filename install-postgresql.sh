#!/bin/bash
# Description: Install postgresql12 on fedora 31

download_link='https://download.postgresql.org/pub/repos/yum/reporpms/F-31-x86_64/pgdg-fedora-repo-latest.noarch.rpm';

[[ $(id -u) != 0 ]] && { echo "Run as root"; exit 1; }

# check linux release
grep -E '^NAME=(Fedora)$' /etc/os-release || {
    
    echo "This script is test on Fedora 31"
    echO "If you are running a redhat based linux distribution,"
    echo "Modify the script to allow execution";
    echo "Otherwise it won't work"
    exit 1;
    
}


# add postgrresql repo and install
dnf -y install "$download_link"
dnf -y update
dnf -y install postgresql-server.x86_64 || {
  echo "Unable to find package postgresql";
  exit 1;
}


# init db and start service
/usr/bin/postgresql-setup initdb
systemctl start postgresql.service
systemctl enable postgresql.service

# allow remote connection through firewall
firewall-cmd --add-service=postgresql --permanent
firewall-cmd --reload


# message for user
echo ""
echo "=========================================================="
echo "ENABLE REMOTE ACCESS TO POSTGRESQL"
echo "Config files are located in: "
echo "/var/lib/pgsql/11/data/postgresql.conf"
echo "/var/lib/pgsql/11/data/pg_hba.conf"
echo ""
echo "If you are unable to find them type the following commands";
echo ">> find /var/ -type f -name 'postgresql.conf'"
echo ">> find /var/ -type f -name 'pg_hba.conf"
echo ""
echo "Set postgresql to listen on all interfaces, by altering the following line on postgresql.conf"
echo "listen_addresses = '*'"
echo ""
echo "Set postgresql to accept remote connection by adding the following line to pg_hba.conf"
echo "host all all 0.0.0.0/0 md5"
echo ""
echo "Then restart postgresql service"
echo "systemctl restart postgresq.service"
echo "=========================================================="
echo ""
