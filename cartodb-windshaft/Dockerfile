FROM ubuntu:14.04
MAINTAINER Milo van der Linden <milo@dogodigi.net>

ENV CARTO_ENV production
ENV DB_HOST 127.0.0.1
ENV DB_PORT 5432
ENV DB_USER postgres

ENV REDIS_HOST 127.0.0.1
ENV REDIS_PORT 6379

ENV CORS_ENABLED true

ENV WINDSHAFT_PORT 8080

RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends apt-utils make g++ git-core \
      libgif-dev libjpeg-dev libcairo2-dev \
      libhiredis-dev \
      libmapnik-dev \
      python-mapnik \
      mapnik-utils \
      libprotobuf-dev \
      nodejs nodejs-legacy npm && \
    rm -rf /var/lib/apt/lists/*

RUN git clone git://github.com/CartoDB/Windshaft-cartodb.git /windshaft-cartodb
RUN mkdir -p /windshaft-cartodb/logs
RUN mkdir -p /tmp/windshaft/millstone
WORKDIR /windshaft-cartodb
RUN npm install

# Add config
COPY docker.js /windshaft-cartodb/config/environments/$CARTO_ENV.js.example
# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE $REDIS_PORT
CMD ["/run.sh"]
