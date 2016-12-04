FROM node:latest
MAINTAINER Milo van der Linden <milo@dogodigi.net>

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      git \
      build-essential \
      ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/windshaft-dev/millstone
RUN mkdir -p /windshaft-cartodb/logs
RUN git clone git://github.com/CartoDB/Windshaft-cartodb.git /windshaft-cartodb
WORKDIR /windshaft-cartodb
RUN ./configure
RUN npm install
COPY ./run.sh /run.sh
CMD ["/run.sh"]
