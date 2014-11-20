FROM centos:centos7
MAINTAINER Nikos Roussos <nikos@roussos.cc>

RUN yum -y install http://ftp.osuosl.org/pub/fedora-epel/7/x86_64/e/epel-release-7-2.noarch.rpm
RUN yum -y update
RUN yum -y install tar make automake gcc gcc-c++ git net-tools libcurl-devel libxml2-devel libffi-devel libxslt-devel wget redis ImageMagick nodejs mariadb-devel mariadb-server vim-enhanced bash-completion wget patch libyaml-devel readline-devel bzip2 libtool bison
RUN yum -y clean all

RUN mysql_install_db
RUN chown -R mysql:mysql /var/lib/mysql
RUN mysqld_safe &
RUN mkdir /var/run/diaspora

ADD . /var/www/diaspora/
RUN useradd diaspora
RUN chown -R diaspora:diaspora /var/www/diaspora/
RUN chown -R diaspora:diaspora /var/run/diaspora/

USER diaspora
WORKDIR /home/diaspora/
RUN sh /var/www/diaspora/docker/init.sh

WORKDIR /var/www/diaspora/
RUN sh ./docker/install.sh

WORKDIR /var/www/diaspora/
EXPOSE 3000
CMD sh ./docker/start.sh

