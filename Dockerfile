FROM ubuntu:precise

MAINTAINER Darron Froese "darron@froese.org"

RUN echo "deb http://archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install python-software-properties
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update
RUN apt-get -y install nginx

RUN mkdir /srv/www
RUN echo "HTML is working" > /srv/www/nginx-container.html

ADD default /etc/nginx/sites-available/default
ADD nginx.conf /etc/nginx/nginx.conf