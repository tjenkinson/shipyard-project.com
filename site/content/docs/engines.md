+++
Categories = []
Description = ""
Tags = []
title = "Engines"
date = 2014-09-06T03:30:04Z
+++

A Shipyard cluster contains one or more "engines".  An engine is a Docker daemon that is listening via socket (for local only ) or TCP for multi-host.  There are no agents or remote applications to install to enable management; just the Docker API.

To configure the Docker daemon to listen on TCP, see the [Docker Docs](https://docs.docker.com/articles/basics/) under the section "Bind Docker to another host/port or a Unix socket".

When an engine is added in Shipyard, you define resource limits for the specified engine.  Those limits are used when scheduling containers to make sure the engine can fulfill the request.  You can also specify SSL certificates for secure communication.

<a name="id"></a>
## ID
Each engine has an arbitrary identifier.  This can be anything to identify the engine.

<a name="addr"></a>
## Addr
This is the URL that is used to access the engine.  For local use only, use `unix:///path/to/docker.sock`.  Use `http://` for non-SSL endpoints and `https://` for SSL protected in multi-host setups.

<a name="resources"></a>
## Resources
Each engine has a defined limited amount of resources.  These are CPU shares and Memory (in MB).

<a name="labels"></a>
## Labels
An engine can have one or more labels.  These are used for scheduling and placing containers.

<a name="ssl"></a>
## SSL
An engine can be configured to use SSL.  See the [Docker docs](https://docs.docker.com/articles/https/) on running with SSL.

<a name="examples"></a>
# Examples

## Add an Engine
```bash
shipyard cli> shipyard add-engine --id local \
    --addr http://10.1.2.3:2375 \
    --cpus 4.0 \
    --memory 8192 \
    --label dev \
    --label local
```

<a name="docker-socket"></a>
You can also add a Docker host using the Docker socket but note this will only work in a single host setup.  You will also need to bind mount the Docker socket when running the Shipyard controller container (`-v /var/run/docker.sock:/docker.sock`)

```bash
shipyard cli> shipyard add-engine --id local-socket \
    --addr unix:///docker.sock \
    --cpus 4.0 \
    --memory 8192 \
    --label dev \
    --label local
```

## View Engines
```bash
shipyard cli> shipyard engines
ID      Cpus    Memory  Host                    Labels
local   4.00    8192.00 http://172.16.1.50:2375 local,dev
```

## Inspect an Engine
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
```bash
shipyard cli> shipyard remove-engine local
removed local
```
