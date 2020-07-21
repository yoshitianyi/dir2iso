#!/bin/bash

# $1: target root dir
# $2: volume name
# $3: publisher name

# https://stackoverflow.com/questions/1378274/in-a-bash-script-how-can-i-exit-the-entire-script-if-a-certain-condition-occurs/25515370#25515370
yell() { echo "💥$0: $*" >&2; }
die() { yell "$*"; exit 255; }
try() { "$@" || die "[$?] cannot $*"; }

# https://serverfault.com/questions/72476/clean-way-to-write-complex-multi-line-string-to-a-variable
IFS='' read -r -d '' LOGO <<"EOF"
░█▀▄░▀█▀░█▀▄░▀▀▄░▀█▀░█▀▀░█▀█
░█░█░░█░░█▀▄░▄▀░░░█░░▀▀█░█░█
░▀▀░░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀
EOF

# TODO: parameter verification

echo "$LOGO"
try mkisofs -J -r -U -D -V "$2" -P "$3" -o "$2.iso" "$1"
