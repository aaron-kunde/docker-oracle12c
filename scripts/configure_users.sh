#! /bin/sh

set -e

create_user() {
    groupadd oinstall
    groupadd dba
    useradd -g oinstall -G dba oracle
}

adjust_limits() {
    echo "oracle   soft   nofile   1024" >> /etc/security/limits.conf
    echo "oracle   hard   nofile   65536" >> /etc/security/limits.conf
    echo "oracle   soft   nproc   2047" >> /etc/security/limits.conf
    echo "oracle   hard   nproc   16384" >> /etc/security/limits.conf
    echo "oracle   soft   nofile   10240" >> /etc/security/limits.conf
    echo "oracle   hard   nofile   65536" >> /etc/security/limits.conf
}

create_user
adjust_limits

