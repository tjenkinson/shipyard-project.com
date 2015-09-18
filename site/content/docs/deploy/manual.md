+++
Categories = []
Description = ""
Tags = []
menu = "main"
title = "Manual Deploy"
date = 2015-04-24T04:37:14Z
+++

> Note: you must have a Docker engine available.  If you do not have Docker
see http://docs.docker.com/ to get started.

This will show how to manually deploy the containers in case you want to use
an existing Swarm deployment, etc.  This method assumes you have a fresh
Docker Engine.  This also assumes you are using a non-TLS setup.

> Note: This assumes a similar setup to the automated install.  You can
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
the Swarm container.  For this example, we will use [Consul](https://www.consul.io/)
however, you can use any key/value backend supported by Swarm.

```bash
$> docker run \
    -ti \
    -d \
    -p 8400:8400 \
    -p 8500:8500 \
    --restart=always \
    --name shipyard-discovery \
    progrium/consul -bootstrap -server
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
    manage --host tcp://0.0.0.0:3375 consul://<ip-of-host>:8500 
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
    join --addr <ip-of-host>:2375 consul://<ip-of-host>:8500
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
