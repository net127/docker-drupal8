#!/bin/bash

/usr/bin/mysqld_safe &
 sleep 10s

 mysqladmin -u root password mysqlpsswd
 mysqladmin -u root -pmysqlpsswd reload
 mysqladmin -u root -pmysqlpsswd create drupal

 echo "GRANT ALL ON drupal.* TO drupaluser@localhost IDENTIFIED BY 'drupaldbpasswd'; flush privileges; " | mysql -u root -pmysqlpsswd

 wget http://ftp.drupal.org/files/projects/drupal-8.0-alpha10.tar.gz
 tar -zxvf drupal-8.0-alpha10.tar.gz
 rm drupal-8.0-alpha8.tar.gz
 mv drupal-8.0-alpha8/* drupal-8.0-alpha8/.htaccess /var/www
 rm -r drupal-8.0-alpha8
 mkdir /var/www/sites/default/files
 chmod a+w /var/www/sites/default/files
 rm /var/www/index.html
 cp /var/www/sites/default/default.settings.php /var/www/sites/default/settings.php
 chmod a+w /var/www/sites/default/settings.php
 
 a2enmod rewrite


killall mysqld
sleep 10s

