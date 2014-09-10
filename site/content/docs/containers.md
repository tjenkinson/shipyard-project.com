+++
Categories = []
Description = ""
Tags = []
title = "Containers"
date = 2014-09-06T03:30:04Z
+++

A container in Shipyard is simply a Docker container.  Containers can be deployed across one or more engines.

When deploying a container, the following options are available:

## Name
This is the name of the Docker image.  For example, `shipyard/shipyard`.

## CPUs
The amount of CPU shares to reserve for the container.

## Memory
The amount of memory (in MB) to reserve for the container.

## Type
In Shipyard, a container can be one of these types: `service`, `unique`, or `host`.

The `service` type will use the host labels for scheduling.  Shipyard will only   attempt to run containers on engines that have this label.

The `unique` type will only run the container on hosts that do not already have an instance of the image running.  This is good for high availability scheduling.

The `host` type will run the container on hosts specified.  To specify a host, use the following syntax when launching: `--label host:<host-id>` for example: `--label host:local`.  This will only run the container on the host with the ID `local`.

## Hostname
This is the hostname of the container.

## Domain
The domain name of the containers.

## Env
You can specify multiple `--env` arguments that will add the environment variable to the container.  Specify these in `key=value` format.

## Arg
To pass arguments to the container, use `--arg`.  This can also be specified multiple times.

## Label
The desired labels to use for scheduling.

## Port
To expose ports, use the following syntax: `--port <proto>/<host-port>:<container-port>` for example: `--port tcp/:8080 --port tcp/80:8080`.  This can be specified multiple times.

## Pull
This will pull the latest image from the registry.

## Count
You can specify the number of instances to launch in the cluster.  By default, this is 1.

# Examples

## Deploy a Container
```bash
$> shipyard run --name ehazlett/go-demo --cpus 0.1 --memory 32 --type service --hostname demo-test --domain local --env FOO=bar --label dev --pull
started 407e39dc1ccc on local
```

## View Containers
```bash
$> shipyard containers
ID              Name                    Host    Ports
407e39dc1ccc    ehazlett/go-demo:latest local   tcp/49166:8080
```

## Inspect a Container
```bash
$> shipyard inspect 0ab23
{
  "ports": [
    {
      "container_port": 8080,
      "port": 49166,
      "proto": "tcp"
    }
  ],
  "engine": {
    "labels": [
      "local",
      "dev"
    ],
    "memory": 2048,
    "cpus": 4,
    "addr": "http://10.1.2.3:2375",
    "id": "local"
  },
  "image": {
    "restart_policy": {},
    "labels": [
      "local"
    ],
    "type": "service",
    "hostname": "407e39dc1ccc",
    "environment": {
      "GOROOT": "/goroot",
      "GOPATH": "/gopath"
    },
    "memory": 256,
    "cpus": 0.08,
    "name": "ehazlett/go-demo:latest"
  },
  "id": "407e39dc1cccc675591c86306563e78be6de085745427656ad1fd89426ab8b55"
}
```

## Destroy a Container
```bash
$> shipyard destroy 407e39
destroyed 407e39dc1ccc
```
