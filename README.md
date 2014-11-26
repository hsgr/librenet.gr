# librenet*
 
### a privacy aware, distributed, open source social network

This repository holds all code changes made for the needs of [librenet*](https://librenet.gr/), a greek [diaspora*](http://diasporafoundation.org/) pod. 

## Contribute

All code contributions to the core functionality of diaspora* should be submitted to the [upstream repository](https://github.com/diaspora/diaspora).

For testing purposes before we push any code changes to our pod we use [docker](https://docker.io) to run librenet* locally.

### Docker

Install Docker:

`sudo yum install docker-io`

And start the service:

`systemctl start docker.service`

Clone this repository locally:

```
git clone https://github.com/librenet/librenet.gr.git
cd librenet.gr
```

Being inside the repository build your docker image:

`docker build -t librenet .`

This will take some time on first run, so be patient.
if everything run smoothly you should have a new librenet docker image:

`docker images`

All you have to do is run it and attach the repository as a volume:

`docker run -v $(pwd):/var/www/diaspora/ -i -t librenet:latest /bin/bash -P`

Once you are inside the container, all you have to do is run mariadb and the diaspora* server script:

```
mysqld_safe &
su - diaspora
cd /var/www/diaspora/
./script/server
```

Diaspora* now runs on port 3000. To find out your container's IP see what name docker assigned to it and use the inspect command:

```
docker ps
docker inspect crazy_einstein
```

(replace `crazy_einstein` with the name of your container)

To see changes you make on frontend code (haml) just refresh your browser. Changes on templates (haml) or on ruby code require to stop (`ctrl+c`) the server script and re-run it.

To stop the container just type `ctrl+D`. Happy hacking :-)
