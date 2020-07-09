#!/bin/bash

# $1: target root dir
# $2: volume name
# $3: publisher name

mkisofs -J -r -U -D -V "$2" -P "$3" -o "$2.iso" "$1"
