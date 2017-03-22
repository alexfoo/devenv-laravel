#!/bin/sh

# Configure extensions
docker-php-ext-configure gd --with-jpeg-dir=usr/ --with-freetype-dir=usr/ --with-webp-dir=usr/
docker-php-ext-configure ldap --with-libdir=lib/
docker-php-ext-configure pdo_dblib --with-libdir=lib/

# Download mongo extension
/usr/local/bin/pecl download mongodb && \
    tar -C /usr/src/php/ext -xf mongo*.tgz && \
    rm mongo*.tgz && \
    mv /usr/src/php/ext/mongo* /usr/src/php/ext/mongodb

docker-php-ext-install \
    bcmath \
    bz2 \
    curl \
    exif \
    gd \
    gettext \
    intl \
    json \
    ldap \
    mbstring \
    mcrypt \
    mongodb \
    opcache \
    pdo_dblib \
    pdo_mysql \
    pdo_pgsql \
    xml \
    xmlrpc \
    zip

# Download trusted certs 
mkdir -p /etc/ssl/certs && update-ca-certificates

# Install composer
php -r "readfile('https://getcomposer.org/installer');" | php && \
   mv composer.phar /usr/bin/composer && \
   chmod +x /usr/bin/composer

# Download trusted certs 
mkdir -p /etc/ssl/certs && update-ca-certificates

# Install composer
php -r "readfile('https://getcomposer.org/installer');" | php && \
   mv composer.phar /usr/bin/composer && \
   chmod +x /usr/bin/composer

apk del $TMP

# Set timezone
# RUN echo America/Maceio > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
