FROM alpine:latest

ENV VERSION 0.8.0

ADD https://github.com/sabre-io/Baikal/releases/download/$VERSION/baikal-$VERSION.zip .

RUN apk add --no-cache \
    unzip \
    nginx \
    php8-curl \
    php8-dom \
    php8-fpm \
    php8-mbstring \
    php8-pdo \
    php8-pdo_sqlite \
    php8-pdo_mysql \
    php8-mysqli \
    php8-sqlite3 \
    php8-xmlwriter \
    php8-session \
    php8-xmlreader \
    sqlite

COPY files/nginx.conf /etc/nginx/http.d/default.conf

COPY files/run.sh .

RUN unzip baikal-$VERSION.zip -d /var/www/ \
    && chown -R nginx:nginx /var/www/baikal \
    && sed -i -e "s/^user = nobody/user = nginx/" /etc/php8/php-fpm.d/www.conf \
    && sed -i -e "s/^group = nobody/group = nginx/" /etc/php8/php-fpm.d/www.conf \
    && sed -i -e "s#^listen = 127.0.0.1:9000#listen = /var/run/php8-fpm.sock#" /etc/php8/php-fpm.d/www.conf \
    && sed -i -e "s/;listen.owner = nobody/listen.owner = nginx/" /etc/php8/php-fpm.d/www.conf \
    && sed -i -e "s/;listen.group = nobody/listen.group = nginx/" /etc/php8/php-fpm.d/www.conf \
    && sed -i -e "s/;listen.mode = 0660/listen.mode = 0660/" /etc/php8/php-fpm.d/www.conf \
    && rm -rf baikal-$VERSION.zip \
    && chmod +x ./run.sh


VOLUME ["/var/www/baikal/config", "/var/www/baikal/Specific"]

EXPOSE 80

CMD ["./run.sh"]
