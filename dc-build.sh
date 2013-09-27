#!/bin/bash

CONF_FILE=$HOME/.dc_njs_yo.conf
DC_CONTAINER_NAME="node_js_yo"

sudo docker build -t=$DC_CONTAINER_NAME .
if [ "$?" -ne 0  ]
then
    echo "lxc-docker package is missing"
    echo "visit http://docs.docker.io/en/latest/installation"
    exit
fi

# get current directory
SCRIPT="`readlink -e $0`"
SCRIPTDIR="`dirname $SCRIPT`"
echo "ssh_key=$SCRIPTDIR/id_rsa_yeoman" > $CONF_FILE
echo "dc_container_name=$DC_CONTAINER_NAME" >> $CONF_FILE
echo "dc_port_redirect=2022" >> $CONF_FILE


echo "*"
echo "* configuration file for the dc-start cmd is placed in $CONF_FILE"
echo "*"
