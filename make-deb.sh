#!/bin/bash
PKG_MAINTAINER="myself"
PKG_VENDOR="myself"

# https://stackoverflow.com/questions/1378274/in-a-bash-script-how-can-i-exit-the-entire-script-if-a-certain-condition-occurs/25515370#25515370
yell() { echo "💥$0: $*" >&2; }
die() { yell "$*"; exit 255; }
try() { "$@" || die "[$?] cannot $*"; }

# Create work directory strcture
try mkdir -p workdir/usr/local/bin
try cp -vf src/*.sh workdir/usr/local/bin
try chmod -v +x workdir/usr/local/bin/*.sh

# Create the deb package from the dir
try fpm -s dir -t deb -C workdir -a all \
--name $PKG_NAME \
--version $PKG_VERSION \
--iteration $PKG_ITERATION \
--description "$PKG_DESCRIPTION" \
--depends "$PKG_DEPENDS" \
--maintainer "$PKG_MAINTAINER" \
--vendor "$PKG_VENDOR" \
--deb-no-default-config-files
