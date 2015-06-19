FROM ubuntu:14.04

# docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/snd:/dev/snd firefox 


RUN apt-get update && apt-get install -y firefox

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
mkdir -p /home/docker && \
echo "docker:x:${uid}:${gid}:Docker,,,:/home/docker:/bin/bash" >> /etc/passwd && \
echo "docker:x:${uid}:" >> /etc/group && \
echo "docker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/docker && \
chmod 0440 /etc/sudoers.d/docker && \
chown ${uid}:${gid} -R /home/docker

USER docker
ENV HOME /home/docker
CMD /usr/bin/firefox
