## About


This repository contains files to create Docker image for [Redis](http://redis.io/) from [Official Redis Image](https://hub.docker.com/_/redis/) with support for Redis cluster.

The image/packages used are pinned to a version number in the `Dockerfile` to ensure image stability.

Automated builds of the image are available on the [Docker Hub](https://hub.docker.com/r/seekasia/redis/).


## Usage


To start a Redis instance:
```sh
docker run --name <container-name> -d seekasia/redis:<tag>
```

Additionally if you want to mount the data directory or specifying the custom configuration file:
```sh
docker run \
--net=host \
-v <data-dir>:/data \
-v <logrotate-conf>:/etc/logrotate.d/redis \
-v <redis-conf>:/usr/local/etc/redis/redis.conf \
--name <container-name> -d seekasia/redis:<tag> \
redis-server /usr/local/etc/redis/redis.conf
```

Docker's networking layer affects the performance significantly, if possible, run the container with `--net=host` to use host networking to improve the throughput as shown above.

This also a proposed solution for running Redis cluster from different hosts where the Docker's internal address unreachable by other Redis nodes in the cluster.


### Timezone


You can use the environment variable to modify the timezone in the container (Default to `Asia/Singapore`):
```sh
-e TZ=<timezone>
```


### redis-trib


The Ruby utility used to facilitate Redis cluster administration is called `redis-trib-pass.rb`, an enhanced version of the `redis-trib.rb` with added support for authentication.

Run any `redis-trib` command as follow:
```sh
redis-trib-pass.rb help
redis-trib-pass.rb create --auth <password> 192.168.11.11:7001 192.168.11.11:7002 192.168.11.11:7003
```

