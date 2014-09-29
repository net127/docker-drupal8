docker-drupal8
==============

Drupal 8 container 

to run the container ...

docker run -d -p 80 quantumobject/docker-drupal8

check port assigned to the 80 and them localhost:port will create initial conf where

database : drupal

database user : drupaluser

database password : drupaldbpasswd

Use docker-bash ID_container to access the container from the server that the container is running ...   docker-bash part of quantumobject/docker-tools:
https://github.com/QuantumObject/docker-tools

after done with the final install at the web interface need to run the command for security ..:

docker-bash Id_container after_install

This will change some permission internally of the container .. 
