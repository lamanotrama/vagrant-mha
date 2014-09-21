#!/bin/bash

nodes="$@"
: ${nodes:=node001 node002 node003}

red=31
green=32
yellow=33
blue=34

function log {
    node=$1
    while read msg; do
        echo -e "\033[${green}m==> $node: ${msg}\033[m"
    done
}

function logerr {
    node=$1
    while read msg; do
        echo -e "\033[${red}m==> $node: ${msg}\033[m"
    done
}

for node in $nodes; do
    (
    exec 2> >(logerr "$node") 1> >(log "$node")
    vagrant ssh $node -c 'sudo sh -c "
        set -e
        set -x
        service mysql status && service mysql stop
        rm -rf /var/lib/mysql
        mysql_install_db
        chmod 755 /var/lib/mysql
        chown -R mysql. /var/lib/mysql
        service mysql start
    " '
    ) &
done

wait


