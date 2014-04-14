# drupal 8 container
# VERSION               0.1.0
FROM angelrr7702/ubuntu-13.10-sshd
MAINTAINER Angel Rodriguez  "angelrr7702@gmail.com"
RUN echo "deb http://archive.ubuntu.com/ubuntu saucy-backports main restricted " >> /etc/apt/sources.list
RUN (DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -q && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y -q )
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q supervisor php5 libapache2-mod-php5 php5-gd apache2 mysql-server  php5-mysql php5-json cron php5-curl php-apc
ADD start.sh /start.sh
ADD foreground.sh /etc/apache2/foreground.sh
ADD pre-conf.sh /pre-conf.sh
ADD apache2.conf /etc/apache2/apache2.conf
RUN echo "apc.rfc1867 = 1" >> /etc/php5/apache2/php.ini
RUN (chmod 750 /start.sh && chmod 750 /etc/apache2/foreground.sh && chmod 750 /pre-conf.sh)
RUN (/bin/bash -c /pre-conf.sh)
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 22 80
CMD ["/bin/bash", "-e", "/start.sh"]
