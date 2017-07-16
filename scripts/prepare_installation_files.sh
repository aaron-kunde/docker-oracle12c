#! /bin/sh

set -e

load_and_unpack() {
    filename=$1
    chksum=$2

    if [ ! -z $INSTALL_CREDENTIALS ]; then
	cred_opts="-u $INSTALL_CREDENTIALS"
    fi

    curl $cred_opts $INSTALL_SRC_BASEURL/$filename -o $filename
    sha1sum $filename | grep $chksum
    unzip $filename
    rm $filename
}

if [ ! -d $INSTALL_PATH ]; then
    echo "ERROR: Directory for installation files $INSTALL_PATH does not exist"
    exit -1
fi

pushd $INSTALL_PATH
load_and_unpack linuxamd64_12102_database_1of2.zip e378379735301e2b87a812803b59475b9da8f36c
load_and_unpack linuxamd64_12102_database_2of2.zip fefc5b984e139ed08dd0c54105bae2ca297aa26c
popd
