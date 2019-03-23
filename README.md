# ДЗ docker-4

- при запуске с --network host видны все сетевые интерфейсы машины с докером
- при заупуске двух nginx с --network host второй не запускается (2019/03/23 20:32:33 [emerg] 1#1: bind() to 0.0.0.0:80 failed (98: Address already in use)), т.к. host отдаёт по сути не сеть, а сетевой интерфес и два приложения не могут забиндить на нём порт
- --network none создаёт netns, ip netns exec 4714df7cca45 ifconfig выводит только lo0
- изменён run.sh для разделения fron и back по разным сетям
- добавлена конфигурация docker-compose
- изменена конфигурация docker-compose для использования параметров из .env файла


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
