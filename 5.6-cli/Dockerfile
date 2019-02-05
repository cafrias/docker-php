FROM php:5.6-cli

LABEL maintainer="carlos.a.frias@gmail.com"

# Install PHP Extensions
RUN apt-get update && apt-get install -y \
  libmcrypt-dev \
  && docker-php-ext-install \
  mcrypt \
  pcntl \
  pdo pdo_mysql \
  && pecl install xdebug-2.5.5 \
  && docker-php-ext-enable xdebug

# Configure Xdebug
ARG XDEBUG_INI=/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.default_enable = off" >> ${XDEBUG_INI} \
  && echo "xdebug.remote_enable = on" >> ${XDEBUG_INI} \
  && echo "xdebug.remote_autostart = off" >> ${XDEBUG_INI} \
  && echo "xdebug.remote_connect_back = off" >> ${XDEBUG_INI}

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer
RUN mkdir /.composer -m 777

EXPOSE 8000

CMD [ "php", "-v" ]
