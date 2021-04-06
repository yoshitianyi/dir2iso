#! /bin/bash
SRCDIR=$1  # source dir
DSTHOME=$2 # destination home dir (must be an absolute path)

## TODO: use getopts

# https://stackoverflow.com/questions/1378274/in-a-bash-script-how-can-i-exit-the-entire-script-if-a-certain-condition-occurs/25515370#25515370
yell() { echo "💥$0: $*" >&2; }
die() { yell "$*"; exit 255; }
try() { "$@" || die "[$?] cannot $*"; }

# https://serverfault.com/questions/72476/clean-way-to-write-complex-multi-line-string-to-a-variable
# figlet -f pagga
IFS='' read -r -d '' LOGO <<"EOF"
░█▀▄░▀█▀░█▀▄░█▀▀░█░█░█▀█░█▀▀
░█░█░░█░░█▀▄░▀▀█░░█░░█░█░█░░
░▀▀░░▀▀▀░▀░▀░▀▀▀░░▀░░▀░▀░▀▀▀
EOF
echo "$LOGO"

try test -n "$SRCDIR"
try test -n "$DSTHOME"

SRCDIR="$SRCDIR/"
PRIORBACKUP=$(ls $DSTHOME | grep backup- | tail -n 1)

if [ -z $PRIORBACKUP ]; then
	echo "🌕 Execute Full Backup"
	rsync -avh $SRCDIR "$DSTHOME/backup-$(date +%Y%m%d-%H%M%S)"
else
	echo "🌙 Execute Incremental Backup on $PRIORBACKUP"
	rsync -avh --link-dest="$DSTHOME/$PRIORBACKUP" \
	           $SRCDIR "$DSTHOME/backup-$(date +%Y%m%d-%H%M%S)"
fi
