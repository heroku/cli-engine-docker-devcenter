FROM node:8.4

MAINTAINER Jeff Dickey

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN apt-get -y update && \
  apt-get install -y --no-install-recommends \
  apt-utils \
  python-pip python-dev build-essential \
  shellcheck \
  && apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN pip install --upgrade pip && \
      pip install --upgrade virtualenv && \
      pip install --upgrade awscli

RUN aws configure set preview.cloudfront true

ENV PATH="${PATH}:./node_modules/.bin"

CMD bash
