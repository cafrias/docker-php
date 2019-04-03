FROM php:7.1-apache

LABEL maintainer="carlos.a.frias@gmail.com"

# Install System Dependencies
RUN apt-get update && apt-get install -y \
  libmcrypt-dev \
  zlib1g-dev \
  unzip

# Install PHP Extensions
RUN docker-php-ext-install \
  pcntl \
  zip \
  pdo pdo_mysql

# Install SOAP and PHP SOAP extension
RUN apt-get install -y \
  libxml2-dev \
  && apt-get clean -y \
  && docker-php-ext-install soap

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer
RUN mkdir /.composer -m 777
