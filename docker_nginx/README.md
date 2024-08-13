### Основные команды docker

просмотр всех запущенных контейнеров

```bash
docker ps
```

просмотр всех контейнеров, в том числе остановленных

```bash
docker ps -a
```

просмотр всех локальных образов

```bash
docker images
```

остановка контейнера

```bash
docker stop <id>
```

запуск и подключение к контейнеру через bash оболочку
```bash
docker exec -it <id> bash
```

запуск контейнера с именем my_nginx

```bash
docker run -d --name my_nginx nginx
```

мапинк портов контейнера, проключаем контейнер к localhost:8080

```bash
docker run -d -p 8080:80 nginx
```

прокинуть папку в docker контейнер

```bash
docker run -v ${PWD}:/usr/share/nginx/html nginx
```

Запуск контейнера в фоновом режиме
```bash
docker run -d nginx:latest
```

удаление всех контейнеров

```bash
docker container prune
```

посмотреть всю информацию о контейнере

```bash
docker container inspect <id>
```

посмотреть IP адрес контейнера

```bash
docker container inspect <id> | grep IPAddress
```

подключение к стандартному потоку ввода.вывода.ошибок контейнера

```bash
docker attach --no-stdin <name_container>
```
так же дополнительные команды docker

[Доп материал 1](https://for-each.dev/lessons/b/-ops-docker-attach-detach-container)

[Доп материал 2](https://www.linuxshop.ru/articles/a26710824-osnovnye_komandy_dlya_docker)

### Для доступности docker hub

```bash
sudo chmod 666 /var/run/docker.sock
```

или решение найти по ссылке https://www.blackmoreops.com/2021/10/13/how-to-fix-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket-at-unix-var-run-docker-sock-error/
