# backup-utils

Ultra thin wrapper for mkisofs and rsync.

This repository intends to be an example for everyone to easily create a debian package for his/her custom scripts.

## Build

To build the package, you will need:

* GNU Make 4.2+
* FPM 1.12+ -- please refer to the [document](https://fpm.readthedocs.io/en/latest/installing.html)

Run `make` will generate the deb package.

## Install

To install the package, you will need:

* Ubuntu 18.04/20.04
* genisoimage
* rsync

Run `sudo make install` will install the package.

## Run

Please refer to the code for now..
