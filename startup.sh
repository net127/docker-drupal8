#!/bin/bash


set -e

if [ -f /etc/configured ]; then
        echo 'already configured'
else
        #openssl req -new -x509 -days 365 -nodes -subj "/C=$C/ST=$ST/L=$L/O=$O/OU=$OU/CN=$CN"  -out /etc/apache2/ssl/xxxxxxxxx.pem -keyout /etc/apache2/ssl/xxxxxxx.key
        #sed -i 's/ServerName example.com/ServerName $CN/' /etc/apache2/conf.d/xxxxxxxxxxx.conf
        #to include the domain to the hosts
        #echo 127.0.0.1 $CN >> /etc/hosts
        # for security change permission of folder and files
        #chown -R www-data:www-data /var/www/
        #find /var/www/ -type d -exec chmod 750 {} \;
        #find /var/www/ -type f -exec chmod 640 {} \;
        #needed to fix problem with ubuntu ... and cron 
        update-locale
        date > /etc/configured
fi
