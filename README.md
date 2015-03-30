# docker-drupal8

Docker container for [Drupal 8.0.0-beta9][3]

"Drupal is an open source content management platform powering millions of websites and applications. It’s built, used, and supported by an active and diverse community of people around the world."

## Install dependencies

  - [Docker][2]

To install docker in Ubuntu 14.04 use the commands:

    $ sudo apt-get update
    $ sudo apt-get install docker.io

 To install docker in other operating systems check [docker online documentation][4]

## Usage

To run container use the command below:

    $ docker run -d -p 80 quantumobject/docker-drupal8

or

    $ docker run -d -p xxxxx:80 quantumobject/docker-drupal8

Where xxxxx is the port assigned by you for the container if not docker will assigned one for it.

## Accessing the Transmission applications:

After that check with your browser at addresses plus the port assigined by docker or you:

  - **http://host_ip:port/**

This will create initial configuration where:

  - database : drupal

  - database user : drupaluser

  - database password : drupaldbpasswd

and after done with the final install at the web interface, need to run this command for security ..:

    $ docker exec -it container_id after_install

This will change some permission for some files internally of the container.

To access the container from the server that the container is running :

    $ docker exec -it container_id /bin/bash

Note: This is a beta release and not ready for production: It is only available for testing and checking/learning about the future release capabilities of Drupal.

## More Info

About Drupal: [www.drupal.org][1]

To help improve this container [docker-drupal8][5]

Example of this [docker-drupal8][6]

[1]:https://www.drupal.org
[2]:https://www.docker.com
[3]:https://www.drupal.org/node/2459341
[4]:http://docs.docker.com
[5]:https://github.com/QuantumObject/docker-drupal8
[6]:http://www.quantumobject.com:49158
