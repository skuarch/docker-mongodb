FROM ubuntu:16.04

ADD ./mongod.conf /tmp/

ENV http_proxy 'http://1.1.1.1:0000/'
ENV https_proxy 'http://1.1.1.1:0000/'

# Install MongoDB.
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org && \
  rm -rf /var/lib/apt/lists/* && \

  rm /etc/mongod.conf && \
  mv /tmp/mongod.conf /etc/mongod.conf

# Define mountable directories.
VOLUME ["/data/db"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["mongod", "--auth"]

# Expose ports.
#   - 27017: process
#   - 28017: http
EXPOSE 27017
EXPOSE 28017