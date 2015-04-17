#!/bin/sh

BASEBOX_NAME=$1
BASEBOX_URL="$BASEBOX_NAME/base.box"

if [ ! -d "$BASEBOX_NAME" ]; then
    echo "UNKNOWN BASEBOX '$BASEBOX_NAME'"
    exit
fi

#Ensure any old versions of the basebox are removed
vagrant destroy -f "$BASEBOX_NAME"
rm -f "$BASEBOX_URL"
rm -rf ~/.vagrant.d/boxes/"$BASEBOX_NAME"
rm -rf ~/VirtualBox VMs/"$BASEBOX_NAME"

#Provision a new copy of the basebox
vagrant up "$BASEBOX_NAME"

#Package the box
vagrant package --base "$BASEBOX_NAME" --output "$BASEBOX_NAME/base.box"

#Cleanup
vagrant destroy -f "$BASEBOX_NAME"