#!/bin/sh

case $1 in
    start)
        docker-compose up -d
        docker-compose -f docker-compose-monitoring.yml up -d
    ;;
    stop)
        docker-compose -f docker-compose-monitoring.yml down
        docker-compose down
    ;;
    build)
        docker build -t dimoon/prometheus ../monitoring/prometheus
    ;;
esac
