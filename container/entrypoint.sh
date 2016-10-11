#!/bin/bash

echo
echo "Setting listen port to $VIRTUAL_PORT..."
echo "Listen $VIRTUAL_PORT" > /etc/apache2/ports.conf
cat /etc/apache2/ports.conf

echo
echo "Creating virtual host..."
echo "
ServerName localhost

<VirtualHost *:80>
    DocumentRoot $DOCUMENTROOT_PATH
    SetEnv site_name $VIRTUAL_HOST

    CustomLog /var/log/apache2/access.log combined
    ErrorLog /var/log/apache2/error.log

    <Directory /var/www/html/documentroot/>
        Options -Indexes +FollowSymLinks
        AllowOverride All
        Order Allow,Deny
        Allow from All
    </Directory>
</VirtualHost>
" > /etc/apache2/sites-enabled/vhost.conf
cat /etc/apache2/sites-enabled/vhost.conf

echo
echo "Starting apache..."
echo
apache2ctl -D FOREGROUND
