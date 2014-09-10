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
   1.0.0

COMMANDS:
   login                login to a shipyard cluster
   change-password      update your password
   accounts             show accounts
   add-account          add account
   delete-account       delete account
   containers           list containers
   inspect              inspect container
   run                  run a container
   destroy              destroy a container
   engines              list engines
   add-engine           add shipyard engine
   remove-engine        removes an engine
   inspect-engine       inspect an engine
   service-keys         list service keys
   add-service-key      adds a service key
   remove-service-key   removes a service key
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

```bash
shipyard cli> shipyard run --name ehazlett/go-demo \
    --cpus 0.1 \
    --memory 32 \
    --type service \
    --hostname demo-test \
    --domain local \
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

