# run with:
# docker run --name sandbox1 -it -v /home/user/share/sd:/tmp/sd -v /home/user/.vim:/home/user/.vim -v /home/user/.tmux.conf:/home/user/.tmux.conf -v /home/user/.ssh:/home/user/.ssh -v /home/user/.zshrc:/home/user/.zshrc -h sandbox1 superr4y/sandbox

FROM debian:latest
MAINTAINER superr4y

RUN apt-get update && apt-get -y install vim git tmux sudo python ruby build-essential openssh-client zsh
RUN adduser user && gpasswd -a user sudo
#RUN grep -v user /etc/passwd > /etc/passwd.tmp && mv /etc/passwd.tmp /etc/passwd && echo "user:x:1000:1000:user,,,:/home/user:/bin/zsh" >> /etc/passwd
USER user
WORKDIR /home/user
VOLUME /tmp/sd
VOLUME /home/user/.vim
#VOLUME /home/user/.tmux.conf
VOLUME /home/user/.ssh
#VOLUME /home/user/.zshrc
RUN ln -s /home/user/.vim/vimrc /home/user/.vimrc
RUN ln -s /tmp/sd /home/user/sd
CMD /usr/bin/zsh
