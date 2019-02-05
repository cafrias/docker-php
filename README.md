# Docker PHP

This repo contains a collection of Docker images I use for developing PHP applications.

Each folder contains the `Dockerfile` for the image, and an example usage with `docker-compose.yml`

## Commands

To **build**, simply execute

```sh
sh build.sh
```

To **push**, simply execute

```sh
sh push.sh
```

By default each command builds or pushes with default namespace `carlosafrias`, you can change it by passing a new namespace as the first argument:

```sh
sh build.sh my_namespace
```
