# run with:
# docker run -it -p 2222:22 --rm -v /share:/share superr4y/ctf

FROM ubuntu:latest
MAINTAINER superr4y
EXPOSE 2222

# install all tools
RUN apt-get update && apt-get install -y git python2.7 nmap tmux gdb vim openssh-server openjdk-7-jre firefox binutils build-essential

# config root files
# ...




# add user
RUN adduser --disabled-password --gecos '' user
RUN adduser user sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER user
RUN cd ~/
VOLUME /home/user/share



# config user file

# peda
RUN git clone https://github.com/longld/peda.git /home/user/peda
RUN echo "source ~/peda/peda.py" >> ~/.gdbinit

# zap
RUN mkdir /home/user/bin
RUN wget -O /home/user/bin/zap.tar.gz https://github.com/zaproxy/zaproxy/releases/download/2.4.2/ZAP_2.4.2_Linux.tar.gz
RUN tar -xzf /home/user/bin/zap.tar.gz -C /home/user/bin
RUN rm /home/user/bin/zap.tar.gz
RUN ln -s /home/user/bin/ZAP_2.4.2/zap.sh /home/user/bin/zap

# checksec
RUN wget -O /home/user/bin/checksec.sh http://www.trapkit.de/tools/checksec.sh
RUN chmod +x /home/user/bin/checksec.sh

# radare2
RUN git clone https://github.com/radare/radare2 /home/user/bin/radare2
RUN /home/user/bin/radare2/sys/install.sh


COPY config.sh /home/user/config.sh
RUN /home/user/config.sh



# start container
COPY start.sh /home/user/start.sh
CMD /home/user/start.sh
