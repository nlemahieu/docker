FROM node:latest

RUN npm install -g bower \
    && npm install -g grunt \
    && npm install -g coffee-script
