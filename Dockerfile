FROM base

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y git-core
RUN apt-get install -y ssh
RUN mkdir /var/run/sshd

RUN npm install -g yo
RUN npm install -g generator-angular

RUN adduser --disabled-password --gecos "" yeoman
ADD id_rsa_yeoman.pub /tmp/id_rsa_yeoman.pub
RUN su yeoman; mkdir /home/yeoman/.ssh; cat /tmp/id_rsa_yeoman.pub >> /home/yeoman/.ssh/authorized_keys; echo "cd /var/yeoman" >> /home/yeoman/.bashrc
RUN mkdir /var/yeoman
RUN chown yeoman /var/yeoman
