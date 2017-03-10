# docker-nginx-proxy
If you need to test your api or website's behavior behind an nginx proxy on your local machine.

# DESCRIPTION
Docker containers can access any application listening from your local machine.

localmachine:8080 -> docker-nginx-proxy:8080 -> docker-nginx-proxy:80 -> browser

# USAGE

## Prerequisite
- Setup Docker.
- Run Docker daemon.
- Get your docker's IP.
  * `docker-machine ip #use this to access nginx via browser`

- Get your localmachine's IP and update proxy.conf.
  * `macosx: ifconfig|grep vboxnet0`

## Build
- `docker build -t nginx-proxy .`

## Standard Run (Default nginx configs.)
- `docker run --name nginx-proxy -p 80:80 -p 8080:8080 -p 7080:7080 -d nginx-proxy`

## Check
- `docker ps`

## Proxy Mode Run (edit proxy.conf and use it during docker run.)
- `vi proxy.conf #edit`
- `docker run --name nginx-proxy -v /<ABSOLUTEPATH>/docker-nginx-proxy/proxy.conf:/etc/nginx/conf.d/default.conf:rw -p 80:80 -p 8080:8080 -p 7080:7080 -d nginx-proxy`
- `docker exec -i -t <name from docker ps> /bin/bash service nginx reload`

## Access shell to run commands and manually edit config files and reload services
- `docker exec -i -t <name from docker ps> /bin/bash`

## Stop
- `docker stop <name from docker ps>`
- `docker rm <name from docker ps>`
