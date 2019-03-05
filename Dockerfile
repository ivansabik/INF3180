# Source: https://github.com/wnameless/docker-oracle-xe-11g
FROM ubuntu:18.04

MAINTAINER Wei-Ming Wu <wnameless@gmail.com>

ADD assets /assets
RUN /assets/setup.sh

# ADD init.sql /docker-entrypoint-initdb.d/

EXPOSE 22
EXPOSE 49161
EXPOSE 8080

CMD /usr/sbin/startup.sh && tail -f /dev/null
