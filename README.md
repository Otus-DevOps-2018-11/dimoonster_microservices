# ДЗ logging

- Собран контейнер с fluentd
- запущено приложение и посмотрено, какие логи оно выдаёт
- исправлен docker-compose-logging.yml для поиска образов elastic и kibana
- настроен сбор логов контейнера post в elastic через fluentd
- на хост машине запущен sysctl -w vm.max_map_count=262144
- добавлен контейнер с zipkin для трейсинга

# ДЗ monitoring -2

- Разделён docker-compose на приложение и отдельно мониторинг
- добавлен контейнер cAdvisor для сбора метрик docker
- добавлен контейнер с Grafana для визуализации
- добавлен dashboard для наблюдения за приложением
- добавлен dashboard для наблюдения за бизнес логикой приложения
- добавлено уведомления, если что-то ломается

# ДЗ monitoring

- запущен контенйр с прометеус 2.1.0
- собрано приложение и запущено вместе с мониторингом
- добавлен контейнер с наблюдением за хостом
- docker hub: https://hub.docker.com/u/dimoon

# ДЗ gitlab-ci

- Поднята VM с помощью -docker-machine (.scripts/create_gitlab_vm.sh)
- Запущен gitlab (srv/gitlab/docker-compose.yml)
- Запушен проект в  http://gitlab/homework/example.git
- Добавлен runner и подключен к gitlab
- Добавлено приложение reddit
- Environment в gitlab переехали в Operations
- добавление тэга с версией


# ДЗ docker-4

- при запуске с --network host видны все сетевые интерфейсы машины с докером
- при заупуске двух nginx с --network host второй не запускается (2019/03/23 20:32:33 [emerg] 1#1: bind() to 0.0.0.0:80 failed (98: Address already in use)), т.к. host отдаёт по сути не сеть, а сетевой интерфес и два приложения не могут забиндить на нём порт
- --network none создаёт netns, ip netns exec 4714df7cca45 ifconfig выводит только lo0
- изменён run.sh для разделения fron и back по разным сетям
- добавлена конфигурация docker-compose
- изменена конфигурация docker-compose для использования параметров из .env файла
- по-умолчанию, dc берёт в качестве префикса имя каталога, ав котором находится docker-compose.yml, изменить префикс можно установоив значение переменной окружения COMPOSE_PROJECT_NAME, либо запускать docker-compose с параметром -p (https://github.com/docker/compose/issues/2982). Как вариант, можно в файл .env добавить COMPOSE_PROJECT_NAME=prj1 и у всех сущностей будет префикс prj1

# ДЗ docker-3

- При сборке post-py вылетала ошибка на устаревший pip. Пришлось добавить обновление pip в Dokcerfile
- сделан скрипт для запуска приложения с разными параметрами - src/run.sh

# ДЗ docker-2

- создан новый проект в gcp
- созданный проект выбран в качестве проекта по-умолчанию для gcloud (gcloud config set project .....)
- запущена VM в GCP с docker на борту
- применены переменные окружения для досутпа к docker на VM GCP
- собран docker image для приложения reddit
- образ запушен в docker hub: dimoon/otus-reddit
- запуск образа dimoon/otus-reddit на локаольной машине

# ДЗ docker-1

- установка docker на локальную машину
- запуск контейнеров и просмотр за поведением системы

# dimoonster_microservices
dimoonster microservices repository
