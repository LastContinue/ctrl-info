#!/usr/bin/env sh

### Builds upon my other script, but this also builds the .bin based on the
### name of the configuration
### It assumes that you have you loading binaries just outside of the dir where
### you have your QMK source.
### "base" script -> https://gist.github.com/LastContinue/65dc6e6dcd8181dc6c82ed351b7525ad
### usages:
### ./ctrl-bld-ldr.sh default <- builds the default keymap
### ./ctrl-bld-ldr.sh mac <- builds the mac keymap
### ./ctrl-bld-ldr.sh lastcontinue <-builds a keymap named `lastcontinue`

set -euo pipefail
DIR=qmk_firmware  #change this based on your needs, but this is `git clone`
                  #default name

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

MAP=$1
yellowtext "Let's build! \"$MAP\""
make -C $DIR massdrop/ctrl:$MAP
greentext "\n Starting Flashing Proceedure for map \"$MAP\" \n"
./$LOADER --first --download $DIR/massdrop_ctrl_$MAP.bin --restart
