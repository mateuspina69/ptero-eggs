FROM debian:latest

RUN apt update 
RUN apt install ca-certificates nginx
RUN apt install php7.4 php7.4-xml php7.4-exif php7.4-fpm php7.4-session php7.4-soap php7.4-openssl php7.4-gmp php7.4-pdo_odbc php7.4-json php7.4-dom php7.4-pdo php7.4-zip php7.4-mysqli php7.4-sqlite3 php7.4-pdo_pgsql php7.4-bcmath php7.4-gd php7.4-odbc php7.4-pdo_mysql php7.4-pdo_sqlite php7.4-gettext php7.4-xmlreader  php7.4-bz2 php7.4-iconv php7.4-pdo_dblib php7.4-curl php7.4-ctype php7.4-phar php7.4-fileinfo php8-mbstring php8-tokenizer

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN /usr/bin/php8 composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN rm -rf composer-setup.php

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]
