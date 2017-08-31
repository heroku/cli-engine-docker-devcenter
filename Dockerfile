FROM node:8.4

MAINTAINER Jeff Dickey

RUN apt-get -y update && \
  apt-get install -y --no-install-recommends \
  apt-utils \
  shellcheck \
  awscli \
  && apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  aws configure set preview.cloudfront true

ENV PATH="${PATH}:./node_modules/.bin"

CMD bash
