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

# Allow Header overrides in .htaccess files
RUN a2enmod headers

# Configure terminal
COPY container/root/ /root/

RUN mkdir -p /var/log/httpd/
RUN ln -s /dev/stdout /var/log/httpd/access.log
RUN ln -s /dev/stderr /var/log/httpd/error.log
RUN ln -s /dev/stderr /var/log/httpd/php.log

WORKDIR /var/www/html

EXPOSE 80

ENTRYPOINT /usr/sbin/apache2 -D FOREGROUND

