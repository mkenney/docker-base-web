FROM php:7-apache

MAINTAINER Michael Kenney <mkenney@webbedlam.com>

# System update
RUN apt-get -q -y update

# Because some basic tools come in handy...
RUN apt-get install -q -y less

# For mail() calls
RUN apt-get install -q -y sendmail
RUN apt-get clean && rm -r /var/lib/apt/lists/*

# Install PHP modules
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql

# Configure terminal
COPY container/root/ /root/

# Allow Header overrides in .htaccess files
RUN a2enmod headers

# Configure Apache & PHP
COPY container/etc/apache2/sites-enabled/vhost.conf /etc/apache2/sites-enabled/
COPY container/etc/php.ini /usr/local/etc/php/
ENV DOCUMENTROOT_PATH /var/www/html/documentroot

# Configure logging
RUN rm /var/log/apache2/access.log && ln -s /dev/stdout /var/log/apache2/access.log
RUN rm /var/log/apache2/error.log &&  ln -s /dev/stdout /var/log/apache2/error.log

WORKDIR /var/www/html
ENV TERM xterm

EXPOSE 80

ENTRYPOINT /usr/sbin/apache2 -D FOREGROUND
