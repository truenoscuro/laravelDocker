FROM php:8-apache
RUN apt-get update && apt-get upgrade -y
#PHP NORMAL
RUN docker-php-ext-install pdo pdo_mysql && docker-php-ext-enable pdo pdo_mysql
#Laravel
RUN apt-get install -y git && apt-get install -y zip
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN echo "export PATH=$PATH:/root/.composer/vendor/bin" >> /root/.bashrc

# Conf apache2
COPY ./confApache/apache2.conf  /etc/apache2
RUN a2enmod rewrite.load
RUN service apache2 restart




