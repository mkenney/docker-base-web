FROM php:5.6-apache

MAINTAINER Michael Kenney <mkenney@webbedlam.com>

# System update
RUN apt-get -q -y update

# Because some basic tools come in handy...
RUN apt-get install -q -y less

# Install PHP modules
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql

# Configure Apache & PHP
COPY container/etc/apache2/sites-enabled/vhost.conf /etc/apache2/sites-enabled/
COPY container/etc/php.ini /usr/local/etc/php/php.ini

# Configure terminal
COPY container/root/ /root/

RUN mkdir -p /var/log/httpd/ \
    && ln -s /dev/stdout /var/log/httpd/access.log \
    && ln -s /dev/stderr /var/log/httpd/error.log \
    && ln -s /dev/stderr /var/log/httpd/php.log \
    && a2enmod headers

WORKDIR /var/www/html

EXPOSE 80

ENTRYPOINT /usr/sbin/apache2 -D FOREGROUND

