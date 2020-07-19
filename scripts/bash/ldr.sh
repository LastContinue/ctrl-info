#!/usr/bin/env sh

### This script makes the command for loading a .bin or .hex file onto the
### board much shorter. (This scrip itself used to be much shorter,
### but updates to mdloader have helped slim it down)
### Is now based on the 1.0.4 version of mdloader
### usage ->
### ./ctrl-ldr.sh massdrop_ctrl_foo_bar.bin

set -euo pipefail

RELEASE=https://github.com/Massdrop/mdloader/releases/download/1.0.4
APPLET=applet-flash-samd51j18a.bin
LOADER=mdloader_mac

function redtext {
  echo "`tput setaf 1` $1 `tput sgr0`"
}

function greentext {
  echo "`tput setaf 2` $1 `tput sgr0`"
}

function yellowtext {
  echo "`tput setaf 3` $1 `tput sgr0`"
}

if [ ! -f $APPLET ]; then
    redtext "$APPLET is not present. Will download it from"
    redtext "$RELEASE/$APPLET \n"
    curl -L $RELEASE/$APPLET -o $APPLET
    greentext "\n $APPLET downloaded 👍 \n"
fi
if [ ! -f $LOADER ]; then
    redtext "$LOADER is not present. Will download it from"
    redtext "$RELEASE/$LOADER \n"
    curl -L $RELEASE/$LOADER -o $LOADER
    greentext "\n $LOADER downloaded 👍 \n"
    chmod u+x $LOADER
fi

yellowtext "Starting Flashing Proceedure with file `tput setaf 2`\`$1\` \n"
./mdloader_mac --first --download $1 --restart
