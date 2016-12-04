FROM ubuntu:14.04
MAINTAINER Milo van der Linden <milo@dogodigi.net>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends apt-utils make g++ git-core \
      libgif-dev libjpeg-dev libcairo2-dev \
      libhiredis-dev \
      libmapnik-dev \
      python-mapnik \
      mapnik-utils \
      nodejs nodejs-legacy npm && \
    rm -rf /var/lib/apt/lists/*

RUN git clone git://github.com/CartoDB/Windshaft-cartodb.git /windshaft-cartodb
RUN mkdir -p /windshaft-cartodb/logs

WORKDIR /windshaft-cartodb
RUN ./configure
RUN npm install
COPY ./run.sh /run.sh
CMD ["/run.sh"]
