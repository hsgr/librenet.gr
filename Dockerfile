FROM centos:centos7
MAINTAINER Nikos Roussos <nikos@roussos.cc>

RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install tar make automake gcc gcc-c++ git net-tools libcurl-devel libxml2-devel libffi-devel libxslt-devel wget redis ImageMagick nodejs mariadb-devel mariadb-server vim-enhanced bash-completion wget patch libyaml-devel readline-devel bzip2 libtool bison sudo
RUN yum -y clean all

WORKDIR /app

COPY . /app

EXPOSE 3000

CMD ["./docker/run.sh"]
