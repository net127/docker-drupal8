docker-drupal8
==============

Drupal 8 container 

to run the container ...

  docker run -d -p 80 quantumobject/docker-drupal8

check port assigned to the 80 and them localhost:port will create initial conf where

database : drupal

database user : drupaluser

database password : drupaldbpasswd

To access the container from the server that the container is running :

  docker exec -it container_id /bin/bash

and after done with the final install at the web interface need to run this command for security ..:

  docker exec -it container_id after_install

This will change some permission internally of the container .. 

Note: this is a betta release and not ready for production . it is only available for testing  ..

for more info check :

[beta2](https://www.drupal.org/node/2373889)
