#!/bin/bash
PKG_DESCRIPTION="Directory to ISO"
PKG_DEPENDS="genisoimage"
PKG_MAINTAINER="yoshitianyi"

# https://stackoverflow.com/questions/1378274/in-a-bash-script-how-can-i-exit-the-entire-script-if-a-certain-condition-occurs/25515370#25515370
yell() { echo "💥$0: $*" >&2; }
die() { yell "$*"; exit 255; }
try() { "$@" || die "[$?] cannot $*"; }

# Construct the package directory
try mkdir -p $PKG_DIR/usr/local/bin
try cp -vf src/*.sh $PKG_DIR/usr/local/bin
try chmod -v +x $PKG_DIR/usr/local/bin/*

# Create the deb package from the dir
try docker build -t fpm .
try docker run -v $PWD:/WORKDIR fpm /bin/sh -x -c "
    cd WORKDIR; ls -l; \
    fpm -s dir -t deb -f -C $PKG_DIR \
        --name $PKG_NAME \
        --depends $PKG_DEPENDS \
        --maintainer $PKG_MAINTAINER \
        --version $PKG_VERSION \
        --iteration $PKG_ITERATION \
        --description \"$PKG_DESCRIPTION\" \
        --deb-no-default-config-files
    "
exit $?
