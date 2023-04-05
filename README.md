This is an LSIO based docker for running Kavita. That means it can easily support a custom UID/GID as well as other standard things that lsio containers support. 

Example to get started:

```
docker build -t docker-kavita:debug .
docker run -v ./config:/config -e PUID=1001 -e PGID=1001 docker-kavita:debug
```
