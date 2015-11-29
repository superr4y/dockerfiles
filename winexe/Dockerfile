# run with:
# docker run -it --rm -v /tmp/scripts:/root/scripts superr4y/winexe

FROM debian:latest
MAINTAINER superr4y

RUN apt-get update && apt-get install -y git python2.7 gcc-mingw-w64 libtevent-dev samba-dev build-essential nmap
RUN git clone git://git.code.sf.net/p/winexe/winexe-waf /root/winexe-winexe-waf
RUN cd /root/winexe-winexe-waf/source && ./waf configure build && cp /root/winexe-winexe-waf/source/build/winexe /usr/bin/winexe
WORKDIR /root/scripts
CMD /bin/bash
