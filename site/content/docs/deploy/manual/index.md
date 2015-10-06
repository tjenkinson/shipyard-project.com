+++
Categories = []
Description = ""
Tags = []
title = "Manual Deployment"
date = 2014-09-20T03:30:04Z
+++

> Note: you must have a Docker engine available.  If you do not have Docker
see [docs.docker.com](https://docs.docker.com) to get started.

This will show how to manually deploy the containers in case you want to use
an existing Swarm deployment, etc.  This method assumes you have a fresh
Docker Engine.  This also assumes you are using a non-TLS setup.

>Note: This assumes a similar setup to the automated install.  You can
replace components as needed.

## Datastore

As mentioned, Shipyard uses RethinkDB for the datastore.  First we will launch
a RethinkDB container.

```bash
$> docker run \
    -ti \
    -d \
    --restart=always \
    --name shipyard-rethinkdb \
    rethinkdb
```

## Discovery

To enable Swarm leader election, we must use an external key value store from
the Swarm container.  For this example, we will use [etcd](https://github.com/coreos/etcd)
however, you can use any key/value backend supported by Swarm.

```bash
$> docker run \
    -ti \
    -d \
    -p 4001:4001 \
    -p 7001:7001 \
    --restart=always \
    --name shipyard-discovery \
    microbox/etcd -name discovery
```

## Proxy

By default, the Docker Engine only listens on a socket.  We could re-configure
the Engine to use TLS or you can use a proxy container.  This is a very
lightweight container that simply forwards requests from TCP to the Unix
socket that Docker listens on.

Note: You do not need this if you are using a manual TCP / TLS configuration.

```bash
$> docker run \
    -ti \
    -d \
    --hostname=$HOSTNAME \
    --restart=always \
    --name shipyard-proxy \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e PORT=2375 \
    ehazlett/docker-proxy:latest
```

## Swarm Manager

This will run a Swarm container configured to manage.

```bash
$> docker run \
    -ti \
    -d \
    --restart=always \
    --name shipyard-swarm-manager \
    swarm:latest \
    manage --host tcp://0.0.0.0:3375 etcd://<IP-OF-HOST>:4001
```

## Swarm Agent

This runs a Swarm agent that allows the node to schedule containers.

```bash
$> docker run \
    -ti \
    -d \
    --restart=always \
    --name shipyard-swarm-agent \
    swarm:latest \
    join --addr <ip-of-host>:2375 etcd://<ip-of-host>:4001
```

## Controller

This runs the Shipyard Controller.

```bash
$> docker run \
    -ti \
    -d \
    --restart=always \
    --name shipyard-controller \
    --link shipyard-rethinkdb:rethinkdb \
    --link shipyard-swarm-manager:swarm \
    -p 8080:8080 \
    shipyard/shipyard:latest \
    server \
    -d tcp://swarm:3375
```

Once the controller is launched and the controller has initialized the datastore
you should be able to login via http://[ip-of-host]:8080.

