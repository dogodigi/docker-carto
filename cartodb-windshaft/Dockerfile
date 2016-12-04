FROM node:0.12
MAINTAINER Milo van der Linden <milo@dogodigi.net>

RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-utils \
      git \
      build-essential \
      checkinstall \
      pkg-config \
      libcairo2-dev \
      libjpeg62-turbo-dev \
      libpango1.0-dev \
      libgif-dev \
      libmapnik-dev \
      python-mapnik \
      mapnik-utils \
      ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/windshaft-dev/millstone
RUN git clone git://github.com/CartoDB/Windshaft-cartodb.git /windshaft-cartodb
RUN mkdir -p /windshaft-cartodb/logs

WORKDIR /windshaft-cartodb
RUN ./configure
RUN npm install
COPY ./run.sh /run.sh
CMD ["/run.sh"]
