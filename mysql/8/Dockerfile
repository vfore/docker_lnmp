FROM mysql:8.0
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
COPY ./sources.list /etc/apt/
RUN apt-get update && apt-get install -y vim iputils-ping net-tools
