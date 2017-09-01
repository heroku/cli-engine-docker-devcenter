FROM node:8.4

MAINTAINER Jeff Dickey

RUN apt-get -y update && \
  apt-get install -y --no-install-recommends \
  ruby ruby-dev \
  && \
  apt-get clean && apt-get -y autoremove && \
  rm -rf /var/lib/apt/lists/* ~/.cache

RUN gem install devcenter

CMD bash
