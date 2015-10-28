# run with:
# docker run -it --rm --net=host -v ~/share:/home/user/share superr4y/uft

FROM ubuntu:latest
MAINTAINER superr4y


# install all tools
RUN apt-get update && apt-get install -y build-essential wget libssl-dev

WORKDIR /root
RUN wget -O uftp-4.7.tar http://sourceforge.net/projects/uftp-multicast/files/source-tar/uftp-4.7.tar
RUN tar -xf uftp-4.7.tar
WORKDIR /root/uftp-4.7
RUN make && make install

# start container
#COPY start.sh /home/user/start.sh
#CMD /home/user/start.sh
CMD /bin/bash
