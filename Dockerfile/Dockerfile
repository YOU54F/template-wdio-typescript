FROM node:8.17-alpine

ENV NODE_PATH /install/node_modules/
ENV PATH /install/node_modules/.bin:$PATH

WORKDIR /install/

RUN apk add --no-cache --virtual .gyp \
        python \
        make \
        g++

VOLUME /src
WORKDIR /src

COPY wait-for.sh /usr/local/bin/wait-for
COPY entrypoint.sh /usr/local/bin/entrypoint

ENTRYPOINT []
