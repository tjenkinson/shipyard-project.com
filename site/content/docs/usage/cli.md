+++
Categories = []
Description = ""
Tags = []
title = "Usage: CLI"
date = 2014-09-09T03:30:04Z
+++

This describes working with the Shipyard CLI (command line interface).

## View Help
```bash
shipyard cli> shipyard help
NAME:
   shipyard - manage a shipyard cluster

USAGE:
   shipyard [global options] command [command options] [arguments...]

VERSION:
   2.0.0

COMMANDS:
   login                login to a shipyard cluster
   change-password      update your password
   accounts             show accounts
   add-account          add account
   delete-account       delete account
   containers           list containers
   inspect              inspect container
   run                  run a container
   stop                 stop a container
   restart              restart a container
   destroy              destroy a container
   engines              list engines
   add-engine           add shipyard engine
   remove-engine        removes an engine
   inspect-engine       inspect an engine
   service-keys         list service keys
   add-service-key      adds a service key
   remove-service-key   removes a service key
   extensions           show extensions
   add-extension        add extension
   remove-extension     remove an extension
   webhook-keys         list webhook keys
   add-webhook-key      adds a webhook key
   remove-webhook-key   removes a webhook key
   info                 show cluster info
   events               show cluster events
   help, h              Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --help, -h                   show help
   --generate-bash-completion
   --version, -v                print the version
```

## Login
Use login to login to a Shipyard cluster.  This will save an access token to `~/.shipyardrc`.

```bash
shipyard cli> shipyard login
URL: http://localhost:8080
Username: admin
Password: **********
```

## Change Password
Once logged in, you can use `change-password` to update your account password.

```bash
shipyard cli> shipyard change-password
Password: **********
Confirm: **********
```

## Accounts
This lists all accounts in Shipyard.

```bash
shipyard cli> shipyard accounts
Username        Role
admin           admin
demo            user
```

## Add Account
Add new accounts with `add-account`.

### Options

* `--username, -u`: account username
* `--password, -p`: account password
* `--role, -r`: account role (admin / user)

```bash
shipyard cli> shipyard add-account -u demo -p demo123 -r user
```

## Delete Account
Remove accounts with `delete-account`.

```bash
shipyard cli> shipyard delete-account demo
```

## View Containers
To view all containers in the cluster use `containers`.

```bash
shipyard cli> shipyard containers
ID              Name                    Host    Ports
7b55a8eb9f57    redis:2.8.11            local   tcp/49167:6379
3e532b000891    ehazlett/go-demo:latest local   tcp/49155:8080
```

## Inspect Container
To inspect a container use `inspect`.

```bash
shipyard cli> shipyard inspect 3e53
{
    "id": "3e532b000891e90e93ca3781031e7c1ddb76d8378dfdfd3a34f",
    "image": {
        "name": "ehazlett/go-demo:latest",
        "cpus": 0.08,
        "memory": 256,
        "environment": {
            "GOPATH": "/gopath",
            "GOROOT": "/goroot"
        },
        "hostname": "demo-1",
        "type": "service",
        "labels": [
            "local"
        ],
        "restart_policy": {}
    },
    "engine": {
        "id": "local",
        "addr": "http://10.1.2.3:2375",
        "cpus": 4,
        "memory": 8192,
        "labels": [
            "dev",
            "local"
        ]
    },
    "ports": [
        {
            "proto": "tcp",
            "port": 49155,
            "container_port": 8080
        }
    ]
}
```

## Deploy a Container
Start containers with `run`.

### Options

* `--name`: Docker image name
* `--container-name`: container name
* `--cpus`: cpus to reserve for container
* `--memory`: memory in MB to reserve for container
* `--type`: container type (service, host, unique)
* `--hostname`: container hostname
* `--domain`: container domain name
* `--env`: set container environment variables
* `--link`: link another container
* `--arg`: command arguments for the container
* `--vol`: container volumes (/host/path:/container/path or /container/path)
* `--label`: labels to use for scheduling
* `--port`: expose container ports (<proto>/<host-ip>:<host-port>:<container-port> format)
* `--publish`: publish all exposed ports
* `--pull`: pull latest image before launching
* `--count`: number of containers to launch
* `--restart`: restart policy (on-failure, always, on-failure:5, etc.)

```bash
shipyard cli> shipyard run --name ehazlett/go-demo \
    --cpus 0.1 \
    --memory 32 \
    --type service \
    --hostname demo-test \
    --domain local \
    --link redis:db \
    --port tcp/10.1.2.3:80:8080 \
    --port tcp/::8000 \
    --restart "on-failure:5" \
    --env FOO=bar \
    --label dev \
    --pull
started 407e39dc1ccc on local
```

## Destroy a Container
This will kill and remove the container.

```bash
shipyard cli> shipyard destroy 407e
destroyed 407e39dc1ccc
```

## View Engines
View all of the engines in the cluster with `engines`.

```bash
shipyard cli> shipyard engines
ID      Cpus    Memory  Host                    Labels
local   4.00    8192.00 http://10.1.2.3:2375    dev,local
```

## Add an Engine
To add an engine to the cluster, use `add-engine`.

### Options

* `--id`: id for engine
* `--addr`: address of engine (i.e. http://10.1.2.3:2375)
* `--cpus`: engine cpus
* `--memory`: amount of memory (in MB) of engine
* `--label`: labels to use for scheduling
* `--ssl-cert`: (optional) path to ssl certificate
* `--ssl-key`: (optional) path to ssl key
* `--ca-cert`: (optional) path to CA certificate

```bash
shipyard cli> shipyard add-engine --id demo --add http://10.1.2.3:2375 --cpus 4.0 --memory 4096 --label local --label dev
```

## Inspect an Engine
To view details about an engine, use `inspect-engine`.

```bash
shipyard cli> shipyard inspect-engine local
{
  "engine": {
    "labels": [
      "local",
      "dev"
    ],
    "memory": 2048,
    "cpus": 4,
    "addr": "http://172.16.1.50:2375",
    "id": "local"
  },
  "id": "a08b8518-e963-4eb5-959a-566bd270cd28"
}
```

## Remove an Engine
To remove an engine from the cluster, use `remove-engine`.

```bash
shipyard cli> shipyard remove-engine demo
```

## Create a Service Key
To create a service key, use `add-service-key`.

### Options

* `--description, -d`: description of key

```bash
shipyard cli> shipyard add-service-key -d "test key"
created key: Z2uwezQGoaIcfiRSQBRbktrzdbFRWKlVTEry
```

## View Service Keys
To view all service keys in the cluster, use `service-keys`.

```bash
shipyard cli> shipyard service-keys
Key                                     Description
Z2uwezQGoaIcfiRSQBRbktrzdbFRWKlVTEry    test key
```

## View Cluster Info
To view cluster information, use `info`.

```bash
shipyard cli> shipyard info
Cpus: 4.00
Memory: 8192.00 MB
Containers: 2
Images: 5
Engines: 1
Reserved Cpus: 4.00% (0.16)
Reserved Memory: 3.52% (288.00 MB)
```

## View Events
To view cluster events, use `events`.

```bash
shipyard cli> shipyard events
Time                  Message         Engine  Type     Tags
Sep 09 06:58:13 2014  container:6c07  local   start    docker
Sep 09 06:58:13 2014  container:6c07  local   create   docker
```
