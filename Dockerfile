FROM node:8.4

MAINTAINER Jeff Dickey

RUN apt-get -y update && \
  apt-get install -y --no-install-recommends \
  apt-utils \
  python-pip python-dev build-essential \
  shellcheck \
  && apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && \
      pip install --upgrade virtualenv && \
      pip install --upgrade awscli

RUN aws configure set preview.cloudfront true

ENV PATH="${PATH}:./node_modules/.bin"

CMD bash
