docker_yoeman
=============

docker container for running nodejs and yoeamn

Prerequisites:

    lxc-docker      http://docs.docker.io/en/latest/installation
    git
    sudo

============


    $ git clone https://github.com/elmosanches/docker_yeoman.git
    $ cd docker_yeoman
    $ ./dc-build.sh
    [sudo] password for your_user_name:

    /* yeoman container is built ad installed

    $ cd /path/to/new/angular/project
    $ ./dc-start.sh

    /* you are now in new shell provided by the yeoman container */
    /* now you can execute 'yo' commands that will affect your current directory */

    yeoman@e16fa3b5764e:/var/yeoman$ yo angular


==============
Visit http://yeoman.io/ to learn more about 'yo' command
