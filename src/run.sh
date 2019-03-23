#!/bin/sh

DOCKER_FRONT_NET=front_net
DOCKER_BACK_NET=back_net
DB_VOLUME_NAME=reddit_db

if [ -z "$(docker volume ls | grep ${DB_VOLUME_NAME})" ]; then
    docker volume create reddit_db
fi

if [ -z "$(docker network ls | grep ${DOCKER_FRONT_NET})" ]; then
    docker network create ${DOCKER_FRONT_NET} --subnet=10.0.2.0/24
fi

if [ -z "$(docker network ls | grep ${DOCKER_BACK_NET})" ]; then
    docker network create ${DOCKER_BACK_NET} --subnet=10.0.1.0/24
fi

DB_NET_ALIAS=comment_db2
POST_NET_ALIAS=post2
COMMENT_NET_ALIAS=comment2

## запустим БД
docker run -d --network=${DOCKER_BACK_NET} --network-alias=post_db --name=${DB_NET_ALIAS} -v ${DB_VOLUME_NAME}:/data/db mongo:latest

## запустим backend
docker run -d --network=${DOCKER_BACK_NET} --name=${POST_NET_ALIAS} -e POST_DATABASE_HOST=${DB_NET_ALIAS} dimoon/post:1.0
docker run -d --network=${DOCKER_BACK_NET} --name=${COMMENT_NET_ALIAS} -e COMMENT_DATABASE_HOST=${DB_NET_ALIAS} dimoon/comment:1.0

## подключим backend контейнеры к сети frontend
docker network connect ${DOCKER_FRONT_NET} ${POST_NET_ALIAS}
docker network connect ${DOCKER_FRONT_NET} ${COMMENT_NET_ALIAS}

## запусти frontend
docker run -d --network=${DOCKER_FRONT_NET} --name ui -p 9292:9292 -e POST_SERVICE_HOST=${POST_NET_ALIAS} -e COMMENT_SERVICE_HOST=${COMMENT_NET_ALIAS} dimoon/ui:2.0
