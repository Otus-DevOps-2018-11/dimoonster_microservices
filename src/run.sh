#!/bin/sh

DOCKER_NET=reddit
DB_VOLUME_NAME=reddit_db

if [ -z "$(docker volume ls | grep ${DB_VOLUME_NAME})" ]; then
    docker volume create reddit_db
fi

if [ -z "$(docker network ls | grep ${DOCKER_NET})" ]; then
    docker volume create reddit_db
fi

DB_NET_ALIAS=comment_db2
POST_NET_ALIAS=post2
COMMENT_NET_ALIAS=comment2

docker run -d --network=${DOCKER_NET} --network-alias=post_db --network-alias=${DB_NET_ALIAS} -v ${DB_VOLUME_NAME}:/data/db mongo:latest

docker run -d --network=${DOCKER_NET} --network-alias=${POST_NET_ALIAS} -e POST_DATABASE_HOST=${DB_NET_ALIAS} dimoon/post:1.0
docker run -d --network=${DOCKER_NET} --network-alias=${COMMENT_NET_ALIAS} -e COMMENT_DATABASE_HOST=${DB_NET_ALIAS} dimoon/comment:1.0
docker run -d --network=${DOCKER_NET} -p 9292:9292 -e POST_SERVICE_HOST=${POST_NET_ALIAS} -e COMMENT_SERVICE_HOST=${COMMENT_NET_ALIAS} dimoon/ui:2.0
