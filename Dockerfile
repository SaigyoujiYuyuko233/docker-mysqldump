FROM centos:7

LABEL Maintainer="SaigyoujiYuyuko233<HGK-SaigyoujiYuyuko@outlook.com>"
LABEL Version="V1.0.0"
LABEL Description="A simple mysqldump for docker cronjob"

USER root
WORKDIR /root


COPY mariadb.repo /etc/yum.repos.d/mariadb.repo
COPY CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
RUN yum install MariaDB-client -y --nogpgcheck \
    && yum clean all

COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh \
    && mkdir /backups

ENTRYPOINT ["./entrypoint.sh"]
