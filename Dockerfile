FROM ubuntu:precise

MAINTAINER Darron Froese "darron@froese.org"

RUN echo "deb http://archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get -y install python-software-properties
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update

RUN apt-get -y install nginx

ADD default /etc/nginx/sites-available/default
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir /srv/www
RUN echo "HTML is working" > /srv/www/nginx-container.html

EXPOSE 80

CMD nginx