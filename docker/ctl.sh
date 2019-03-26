#!/bin/sh

case $1 in
    start)
        docker-compose up -d
        #docker-compose -f docker-compose-monitoring.yml up -d
    ;;
    stop)
        #docker-compose -f docker-compose-monitoring.yml down
        docker-compose down
    ;;
    start-logging)
        docker-compose -f docker-compose-logging.yml up -d
    ;;
    stop-logging)
        docker-compose -f docker-compose-logging.yml down
    ;;
    build)
        docker build -t dimoon/prometheus ../monitoring/prometheus
    ;;
    build-alert)
        docker build -t dimoon/alertmanager ../monitoring/alertmanager
    ;;
    build-fluentd)
        docker build -t dimoon/fluentd ../logging/fluentd
    ;;
esac
