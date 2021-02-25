FROM node:12-alpine
ENV CONTAINER_VERSION=1.0.0
ENV CONTAINER_CHANNEL=latest
RUN apk update && apk add git curl jq entr
RUN npm install -g firebase-tools
RUN apk add -q bash openjdk8 #emulators dependencies
RUN firebase setup:emulators:firestore
RUN firebase setup:emulators:database
RUN firebase setup:emulators:pubsub
RUN firebase setup:emulators:ui
VOLUME /mnt
WORKDIR /mnt/app
ENTRYPOINT sh
