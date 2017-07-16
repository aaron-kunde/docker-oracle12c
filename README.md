# Docker Image of Oracle 12c Enterprise Edition
This image installs an Oracle Database 12c Release 1 Enterprise Edition and sets it up with the following users/passwords:

* `sys/sys`
* `system/system`

The response files contain only a minimum set of adjustments and are pretty close to the default settings.

## Prerequisites
To use this image, the installation files from Oracle, needs to be downloadable. Since those are not public available you have to download it from the [download-page](http://www.oracle.com/technetwork/database/enterprise-edition/downloads/database12c-linux-download-2240591.html) and put them on a FTP- or HTTP-Server, so that [cURL](https://curl.haxx.se) cann access them from within the installation scripts.

## Building the image
Given the installation files under some url `<some-url>/`, the image can be built using:

`$ docker build -t <image-name> --build-arg INSTALL_SRC_BASEURL=<some-url>`

If you need to authenticate yourself to this user, you can use:

`$ docker build -t <image-name> --build-arg INSTALL_SRC_BASEURL=<some-url> --build-arg INSTALL_CREDENTIALS=<username>:<password>`

## Starting the container
To start the previously build image, simply use:

`$ docker run --name <container-name> -p 1521:1521 <image-name>`
