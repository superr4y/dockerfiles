# run with docker run --rm -it -p 21:21 -p 20000:20000 -p 20001:20001 -p 20002:20002 -p 20003:20003 -p 20004:20004 -p 20005:20005 -p 20006:20006 -p 20007:20007 -p 20008:20008 -p 20009:20009 superr4y/anonymous_ftp /bin/bash

FROM superr4y/debian
MAINTAINER superr4y

RUN apt-get update && apt-get install -y proftpd

COPY proftpd.conf /etc/proftpd/proftpd.conf

EXPOSE 21

VOLUME /srv/ftp

