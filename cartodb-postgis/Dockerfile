FROM mdillon/postgis:9.6
MAINTAINER Milo van der Linden <milo@dogodigi.net>

ENV PGROUTING_MAJOR 2.3

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      git \
      build-essential \
      ca-certificates \
      postgresql-server-dev-$PG_MAJOR \
      postgresql-plpython-$PG_MAJOR \
      postgresql-$PG_MAJOR-pgrouting && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /cartodb-postgresql
RUN git clone https://github.com/CartoDB/cartodb-postgresql.git /cartodb-postgresql
WORKDIR /cartodb-postgresql
RUN make all install

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./run.sh /docker-entrypoint-initdb.d/cartodb.sh
