FROM centos:7

MAINTAINER Michael Kenney <mkenney@webbedlam.com>

# System
RUN yum update -y; yum clean all
RUN yum install -y hostname; yum clean all
RUN yum install -y openssl; yum clean all
RUN yum install -y wget; yum clean all
RUN yum install -y fontconfig; yum clean all
RUN yum install -y libXext; yum clean all
RUN yum install -y libXrender; yum clean all
RUN yum install -y libpng; yum clean all
RUN yum install -y python-pip; yum clean all
RUN yum install -y whois; yum clean all
RUN yum install -y xorg-x11-fonts-Type1; yum clean all
RUN yum install -y xorg-x11-fonts-75dpi; yum clean all
RUN yum install -y zip; yum clean all
RUN yum install -y vim; yum clean all

# Apache
RUN yum install -y httpd; yum clean all
RUN yum install -y mod_security; yum clean all

# PHP
RUN yum install -y php; yum clean all
RUN yum install -y php-cli; yum clean all
RUN yum install -y php-mysql; yum clean all
RUN yum install -y php-bcmath; yum clean all
RUN yum install -y php-mcrypt; yum clean all

COPY etc/httpd/conf.d/vhost.conf /etc/httpd/conf.d/vhost.conf

ENTRYPOINT /usr/sbin/httpd -D FOREGROUND

