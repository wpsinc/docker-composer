# wpsinc/docker-composer

FROM debian:jessie

MAINTAINER "WPS" <web_services@wps-inc.com>

WORKDIR /tmp

RUN apt-get update && apt-get install -y \
    curl \
    git \
    php5-cli \
    php5-curl \
    php5-mcrypt \
    php5-mysqlnd

RUN php5enmod mcrypt \
    && php5enmod curl \
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
