FROM ruby:2.2.6
MAINTAINER Milo van der Linden <milo@dogodigi.net>

ENV CARTO_ENV development
ENV CARTO_SESSION_DOMAIN localdomain
ENV CARTO_SESSION_PORT 3000

ENV MAP_API_HOST maps-api
ENV MAP_API_PORT 8181
ENV SQL_API_HOST sql-api
ENV SQL_API_PORT 8080

ENV DB_HOST db
ENV DB_PORT 5432
ENV DB_USER postgres

ENV REDIS_HOST redis
ENV REDIS_PORT 6379

RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends apt-utils make g++ git-core \
      unp \
      zip \
      libicu-dev \
      locales \
      gdal-bin libgdal1-dev libgdal-dev \
      python-all-dev python-pip \
      nodejs npm && \
      rm -rf /var/lib/apt/lists/* && \
      localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN git clone --recursive https://github.com/cartodb/cartodb.git /carto
WORKDIR /carto
COPY app_config.yml /carto/config/app_config.yml
COPY grunt_docker.json /carto/config/grunt_docker.json
COPY database.yml /carto/config/database.yml
COPY Gruntfile.js /carto/Gruntfile.js
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN bundle install
RUN npm cache clean && npm install -g n && n 0.10 && npm update -g npm@^2
RUN npm install .
RUN CPLUS_INCLUDE_PATH=/usr/include/gdal C_INCLUDE_PATH=/usr/include/gdal pip install --no-use-wheel -r python_requirements.txt

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

CMD ["/run.sh"]
