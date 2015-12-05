FROM ubuntu:latest
MAINTAINER superr4y
EXPOSE 2222

# install all tools
RUN apt-get update && apt-get install -y tmux vim openssh-server sudo

# add user
RUN adduser --disabled-password --gecos '' user
RUN adduser user sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER user
WORKDIR /home/user
VOLUME /home/user/share

COPY config.sh /home/user/config.sh
RUN sudo chmod +x /home/user/config.sh
RUN /home/user/config.sh

COPY start.sh /home/user/start.sh
RUN sudo chmod +x /home/user/start.sh
CMD /home/user/start.sh