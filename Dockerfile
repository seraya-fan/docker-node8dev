# specify the node base image with your desired version node:<version>
FROM node:8
EXPOSE 8080


# install ssh server from apt
COPY sources.list /etc/apt/
RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y install openssh-server
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo 'root:rootroot' |chpasswd
ADD id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh/authorized_keys
RUN apt-get autoclean && apt-get autoremove
RUN mkdir -p /var/run/sshd

RUN npm -g install nrm
RUN nrm use taobao
RUN npm -g install npm
RUN npm -g install cnpm

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]






