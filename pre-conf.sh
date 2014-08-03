#!/bin/bash

/usr/bin/mysqld_safe &
 sleep 10s

 mysqladmin -u root password mysqlpsswd
 mysqladmin -u root -pmysqlpsswd reload
 mysqladmin -u root -pmysqlpsswd create drupal

 echo "GRANT ALL ON drupal.* TO drupaluser@localhost IDENTIFIED BY 'drupaldbpasswd'; flush privileges; " | mysql -u root -pmysqlpsswd

 wget http://ftp.drupal.org/files/projects/drupal-8.0.x-dev.tar.gz
 tar -zxvf drupal-8.0.x-dev.tar.gz
 rm drupal-8.0.x-dev.tar.gz
 mv drupal-8.0.x-dev/* drupal-8.0.x-dev/.htaccess /var/www
 mkdir /var/www/sites/default/files
 chmod a+w /var/www/sites/default/files
 rm -R /var/www/html
 cp /var/www/sites/default/default.settings.php /var/www/sites/default/settings.php
 chmod a+w /var/www/sites/default/settings.php
 
 a2enmod rewrite


killall mysqld
sleep 10s

