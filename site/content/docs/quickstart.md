+++
Categories = []
Description = ""
Tags = []
menu = "main"
title = "Quickstart"
date = 2015-04-24T04:37:14Z
+++

Shipyard uses RethinkDB for its datastore.  User accounts, service keys, 
webhook keys metadata are stored in RethinkDB.  No container information is 
stored.

# Option 1: Shipyard Deploy
Shipyard Deploy is a small script that uses Docker Machine and the Docker CLI 
to deploy a Swarm cluster and Shipyard.  You can use any provider supported by 
Docker Machine.  See the usage below to view the help for all options.  
VirtualBox is the default provider.

> Note: If you use the VirtualBox provider, you will need to have VirtualBox 
installed prior to running the script.

This will deploy Shipyard using VirtualBox.

```
curl -s https://shipyard-project.com/deploy | bash -s
```

For full usage details:

```
curl -s https://shipyard-project.com/deploy | bash -s -- -h
```

Get the Swarm Master IP

```
docker-machine ip shipyard-swarm-master
```

You should now be able to open a browser to `http://<swarm-master-ip>:8080`

Username: admin
Password: shipyard

# Option 2: Manual Deployment using Docker Machine

## Docker Engine / Swarm
You will need a Docker Engine and a Swarm cluster for Shipyard to manage.  
This example uses Docker Machine to create an engine and swarm cluster.

### Create a Swarm Token

```bash
TOKEN=`curl -XPOST https://discovery-stage.hub.docker.com/v1/clusters`
```

### Create Engine with Swarm

```
docker-machine create \
    -d virtualbox \
    --swarm \
    --swarm-discovery token://$TOKEN \
    --swarm-master \
    shipyard-swarm-master
```

### (optional) Add more Engines

```
docker-machine create \
    -d virtualbox \
    --swarm \
    --swarm-discovery token://$TOKEN \
    shipyard-swarm-node
```

### Verify the Swarm is Up

```
docker $(docker-machine config --swarm shipyard-swarm-master) info

Containers: 2
Strategy: spread
Filters: affinity, health, constraint, port, dependency
Nodes: 1
 shipyard-swarm-master: 192.168.99.106:2376
  └ Containers: 2
  └ Reserved CPUs: 0 / 4
  └ Reserved Memory: 0 B / 1.025 GiB

```

## Shipyard
Shipyard uses RethinkDB for the datastore and a Go application for the 
controller.

### Run RethinkDB

```
docker $(docker-machine config shipyard-swarm-master) run \
  -d \
  --restart=always \
  --name shipyard-rethinkdb \
  shipyard/rethinkdb
```

### Run Shipyard

```
docker $(docker-machine config shipyard-swarm-master) run \
  -d \
  -ti \
  -p 8080:8080 \
  --restart=always \
  --link shipyard-rethinkdb:rethinkdb \
  -v /var/lib/boot2docker:/etc/docker:ro \
  --name shipyard \
  ehazlett/shipyard:v3 server \
  --rethinkdb-addr=rethinkdb:28015 \
  -d tcp://$(docker-machine ip shipyard-swarm-master):3376 \
  --tls-ca-cert /etc/docker/ca.pem \
  --tls-cert /etc/docker/server.pem \
  --tls-key /etc/docker/server-key.pem \
  --auth-whitelist-cidr 127.0.0.0/8
```

### Confirm Shipyard is Running

```
docker $(docker-machine config shipyard-swarm-master) logs shipyard

INFO[0000] shipyard version 3.0.0                       
INFO[0000] whitelisting the following subnets: [127.0.0.0/8] 
INFO[0000] checking database                            
INFO[0000] controller listening on :8080
```

### Get the Swarm Master IP

```
docker-machine ip shipyard-swarm-master
```

You should now be able to open a browser to `http://<swarm-master-ip>:8080`

Username: admin
Password: shipyard
