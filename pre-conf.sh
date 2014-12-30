#!/bin/bash

/usr/bin/mysqld_safe &
 sleep 5s

 mysqladmin -u root password mysqlpsswd
 mysqladmin -u root -pmysqlpsswd reload
 mysqladmin -u root -pmysqlpsswd create drupal

 echo "GRANT ALL ON drupal.* TO drupaluser@localhost IDENTIFIED BY 'drupaldbpasswd'; flush privileges; " | mysql -u root -pmysqlpsswd

 wget http://ftp.drupal.org/files/projects/drupal-8.0.0-beta4.tar.gz
 tar -zxvf drupal-8.0.0-beta4.tar.gz
 rm drupal-8.0.0-beta4.tar.gz
 mv drupal-8.0.0-beta4/* drupal-8.0.0-beta4/.htaccess /var/www
 rmdir -R drupal-8.0.0-beta4
 mkdir /var/www/sites/default/files
 chmod a+w /var/www/sites/default/files
 rm -R /var/www/html
 #to fix error relate to ip address of container apache2
 echo "ServerName localhost" | sudo tee /etc/apache2/conf-available/fqdn.conf
 ln -s /etc/apache2/conf-available/fqdn.conf /etc/apache2/conf-enabled/fqdn.conf
 #  copy conf of drupal
 cp /var/www/sites/default/default.settings.php /var/www/sites/default/settings.php
 cp /var/www/sites/default/default.services.yml /var/www/sites/default/services.yml
 chmod a+w /var/www/sites/default/settings.php
 chmod a+w /var/www/sites/default/services.yml
 a2enmod rewrite
 
killall mysqld
sleep 5s

