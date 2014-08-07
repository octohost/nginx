FROM octohost/ubuntu:13.10

MAINTAINER Darron Froese "darron@froese.org"

RUN apt-get update && apt-get -y install software-properties-common --force-yes
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get -y install nginx

RUN mkdir /srv/www
RUN echo "HTML is working" > /srv/www/nginx-container.html

ADD default /etc/nginx/sites-available/default
ADD nginx.conf /etc/nginx/nginx.conf
