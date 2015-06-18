FROM ubuntu:14.04

RUN apt-get update && apt-get install -y nodejs npm
RUN npm install -g coffee-script
RUN ln -s /usr/bin/nodejs /usr/bin/node
