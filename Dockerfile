FROM ubuntu:20.04
MAINTAINER Matthew Mattox matthew.mattox@rancher.com
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends \
apt-utils \
apache2 \
libapache2-mod-php \
php-cli \
php-json \
php-curl \
php-mysql \
openssl \
locales \
wget \
curl \
nano \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite expires
RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/servername.conf
RUN a2enconf servername

##Configure Apache
COPY apache.conf /etc/apache2/sites-available/
RUN a2dissite 000-default
RUN a2ensite apache.conf
RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log && \
    ln -sf /proc/self/fd/1 /var/log/apache2/error.log

COPY ports.conf /etc/apache2/
RUN a2enmod log_forensic
COPY public_html /var/www/src/
EXPOSE 80
WORKDIR /var/www/src
CMD apachectl -D FOREGROUND
