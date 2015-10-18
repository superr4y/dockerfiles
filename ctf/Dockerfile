# run with:
# docker run -it -p 2222:22 --rm -v ~/share:/home/user/share superr4y/ctf

FROM ubuntu:latest
MAINTAINER superr4y
EXPOSE 2222



# install all tools
RUN apt-get update && apt-get install -y git python2.7 nmap tmux gdb vim openssh-server openjdk-7-jre firefox binutils build-essential postgresql libpcap-dev zlib1g-dev curl libc6-i386

# config root files
# ...

# ruby rvm 
# RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# RUN \curl -sSL https://get.rvm.io | bash -s stable
# RUN source /etc/profile.d/rvm.sh
# RUN rvm install ruby-2.1.7-dev


# metasploit
# RUN /etc/init.d/postgresql start && su postgres -c "psql -c \"CREATE USER msf WITH PASSWORD 'msf';\"" && su postgres -c "createdb -O msf msf"
# RUN git clone https://github.com/rapid7/metasploit-framework.git /opt/metasploit-framework
# WORKDIR /opt/metasploit-framework
# RUN gem install bundler
# RUN bundle install
# WORKDIR /

# add user
RUN adduser --disabled-password --gecos '' user
RUN adduser user sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER user
WORKDIR /home/user
VOLUME /home/user/share



WORKDIR /home/user
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
RUN chmod +x msfinstall
RUN ./msfinstall



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
