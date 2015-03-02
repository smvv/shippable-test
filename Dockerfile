FROM ubuntu:14.10
MAINTAINER Arshad Ashrafi <arshad@splendo.com>

RUN apt-get update && apt-get install -y nginx nodejs npm git ruby \
    && gem install sass; ln -s /usr/bin/nodejs /usr/bin/node

WORKDIR /frontend

ADD package.json /frontend/package.json

RUN npm install

ADD .bowerrc /frontend/.bowerrc
ADD bower.json /frontend/bower.json

RUN nodejs node_modules/.bin/bower install --allow-root

ADD . /frontend/

RUN nodejs node_modules/.bin/grunt default
