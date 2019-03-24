#!/bin/sh

docker-machine create --driver google \
        --google-project docker-235119 \
        --google-zone europe-west3-c \
        --google-machine-type n1-standard-1 \
        --google-disk-size 50 \
        gitlab

eval $(docker-machine env gitlab)
