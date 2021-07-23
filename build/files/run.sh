#!/bin/ash
GREEN="\e[32m"
echo -e "${GREEN}Set permissions"
chown -R nginx:nginx /var/www/baikal/config
chown -R nginx:nginx /var/www/baikal/Specific
echo -e "${GREEN}Starting PHP8-FPM"
php-fpm8
echo -e "${GREEN}Starting Nginx"
nginx -g 'daemon off;'
