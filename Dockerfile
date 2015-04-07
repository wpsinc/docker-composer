# wpsinc/docker-composer

FROM php:5.6-cli

MAINTAINER "Austin Maddox" <amaddox@wps-inc.com>

WORKDIR /tmp

RUN apt-get update && apt-get install -y \
    curl \
    git \
    php5-mcrypt

RUN php5enmod mcrypt \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && mkdir -p /var/www/html

# Cleanup
RUN apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/var/www/html"]

WORKDIR /var/www/html

ENTRYPOINT ["composer"]

CMD ["--help"]
