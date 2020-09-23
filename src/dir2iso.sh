#!/bin/bash
SRCDIR=$1    # source dir
VOLNAME="$2" # volume name
PUBNAME="$3" # publisher name

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
echo "$LOGO"

try test -n $SRCDIR
try test -e $SRCDIR
try test -n "$VOLNAME"

try mkisofs -J -r -U -D -V "$VOLNAME" -P "$PUBNAME" -o "$VOLNAME.iso" $SRCDIR
