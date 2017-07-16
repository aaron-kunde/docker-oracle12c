#! /bin/sh

set -e

# Update installed packages
yum update -y

# Needed to unzip installation files
yum -y install unzip

# Oracle dependencies
yum -y install \
    binutils \
    compat-libcap1 \
    compat-libstdc++-33.i686 \
    compat-libstdc++-33 \
    gcc \
    gcc-c++ \
    glibc.i686 \
    glibc.x86_64 \
    glibc-devel.i686 \
    glibc-devel \
    ksh \
    libaio.i686 \
    libaio.x86_64 \
    libaio-devel.i686 \
    libaio-devel \
    libgcc.i686 \
    libgcc \
    libstdc++.i686 \
    libstdc++ \
    libstdc++-devel.i686 \
    libstdc++-devel \
    libXi.i686 \
    libXi \
    libXtst.i686 \
    libXtst \
    make \
    sysstat
    
# Clean cache
yum clean all
