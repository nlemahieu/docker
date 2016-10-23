FROM ubuntu:14.04

ARG UID=1001
ARG GID=1001

RUN apt-get update && \
apt-get -y upgrade && \
apt-get install -y nodejs npm fontforge ttfautohint && \
npm install -g grunt-cli && \
npm install -g grunt-contrib-jshint --save-dev && \
npm install -g grunt-contrib-uglify --save-dev && \
npm install -g grunt-contrib-clean --save-dev && \
npm install -g grunt-contrib-concat --save-dev && \
npm install -g grunt-contrib-cssmin --save-dev && \
npm install -g grunt-contrib-less --save-dev && \
npm install -g grunt-shell --save-dev && \
npm install -g grunt-contrib-coffee --save-dev && \
npm install -g grunt-bower-task --save-dev && \
npm install -g grunt-contrib-symlink --save-dev && \
npm install -g grunt-symlink && \
npm install -g grunt-contrib-copy --save-dev && \
npm install -g grunt-contrib-watch --save-dev && \
npm install -g grunt-webfont --save-dev && \
ln -s /usr/bin/nodejs /usr/bin/node

# Replace 1000 / 1000 by your user id and group id
RUN export uid=$UID gid=$GID && \
    mkdir -p /home/developer/project && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer/project
WORKDIR /home/developer/project
