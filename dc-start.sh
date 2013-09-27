#!/bin/bash

# get current directory
SCRIPT="`readlink -e $0`"
SCRIPTDIR="`dirname $SCRIPT`"

. $HOME/.dc_njs_yo.conf

# lounch our container and mount current direcotery into working directory
sudo docker run -d -v `pwd`:/var/yeoman -p $dc_port_redirect:22 $dc_container_name /usr/sbin/sshd -D
# grab the docker-pid of the just started container
DC_PID="`sudo docker ps | awk 'NR>1{print $1}'`"


# start yeoman ssh session
# good for now but later we need to keep track of the location of the private key file
ssh -i $ssh_key -p $dc_port_redirect yeoman@localhost

# when docker mounts a dir it changes by itself its owner to root
sudo chown $USER $SCRIPTDIR

# stop our docker container
sudo docker stop $DC_PID
if [ "$?" -eq 0  ]
then
    echo "docker container stoped successfully"
else
    echo "docker container stoping failed"
    echo "that means the container may be still running"
    echo "make sure that container wit id $DC_PID is not running"
    echo "stop it with 'docker kill $DC_PID' by hand if necessary"
fi
