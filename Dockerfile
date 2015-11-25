FROM php:5.6-apache

MAINTAINER Michael Kenney <mkenney@webbedlam.com>

# System
RUN apt-get update

# Configure Apache
COPY container/etc/apache2/sites-enabled/vhost.conf /etc/apache2/sites-enabled/
COPY container/etc/php.ini /usr/local/etc/php/php.ini

# Configure terminal access
COPY container/root/ /root/

WORKDIR /var/www/html

EXPOSE 80

ENTRYPOINT /usr/sbin/apache2 -D FOREGROUND

