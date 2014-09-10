+++
Categories = []
Description = ""
Tags = []
title = "API"
date = 2014-09-10T03:30:04Z
+++

At the core of Shipyard is the API.  The API is used to manage everything in the cluster.

# Authentication
To access the Shipyard API, you must be authenticated.  To access the API, create a [Service Key](/docs/servicekeys/).  All requests need to have the header `X-Service-Key` with your service key.

```json
curl -s -H "X-Service-Key: Lpc.usH1skelCuqwvjAtF.lJsWGwaKiwey2K" \
    http://localhost:8080/api/cluster/info
{
  "reserved_memory": 1024,
  "reserved_cpus": 0.32,
  "image_count": 17,
  "engine_count": 1,
  "container_count": 4,
  "memory": 4096,
  "cpus": 4
}
```

# Accounts

<a name="get-accounts"></a>

## GET /api/accounts

```json
[
  {
    "role": {
      "name": "admin",
      "id": "8c10fe3d-bf10-4bb9-ab4c-002502b71f13"
    },
    "password": "$2a$10$UvzJ8tssyF0Uvpaxmr06QOVbyJn5gTS4gDLapwo",
    "username": "admin",
    "id": "5f8e6567-9244-4fb2-bde9-24fb5e630b63"
  },
  {
    "role": {
      "name": "user",
      "id": "ddc9a1b1-771b-4a07-807a-42cd027922a5"
    },
    "password": "$2a$10$EEkqHiOjC.018pnqr1giDe0ODVcGaDUC/2lXg",
    "username": "test",
    "id": "44a22dd3-ae74-4fe3-bdf6-58bbd0094f98"
  }
]
```

# Containers

<a name="get-containers"></a>
## GET /api/containers
Get list of containers

```json
[
  {
    "ports": [
      {
        "container_port": 8080,
        "port": 49159,
        "proto": "tcp"
      }
    ],
    "engine": {
      "labels": [
        "local",
        "dev"
      ],
      "memory": 4096,
      "cpus": 4,
      "addr": "http://172.16.1.50:2375",
      "id": "local"
    },
    "image": {
      "restart_policy": {},
      "labels": [
        ""
      ],
      "type": "service",
      "hostname": "cbe68bf32f1a",
      "environment": {
        "GOROOT": "/goroot",
        "GOPATH": "/gopath"
      },
      "memory": 256,
      "cpus": 0.08,
      "name": "ehazlett/go-demo:latest"
    },
    "id": "cbe68bf32f1a08218693dbee9c66ea018c1a99c75c463a76b"
  },
  {
    "ports": [
      {
        "container_port": 8080,
        "port": 49158,
        "proto": "tcp"
      }
    ],
    "engine": {
      "labels": [
        "local",
        "dev"
      ],
      "memory": 4096,
      "cpus": 4,
      "addr": "http://172.16.1.50:2375",
      "id": "local"
    },
    "image": {
      "restart_policy": {},
      "labels": [
        ""
      ],
      "type": "service",
      "hostname": "eca254ecd76e",
      "environment": {
        "GOROOT": "/goroot",
        "GOPATH": "/gopath"
      },
      "memory": 256,
      "cpus": 0.08,
      "name": "ehazlett/go-demo:latest"
    },
    "id": "eca254ecd76eb9d887995114ff811cc5b7c14fe13630"
  }
]
```

# Engines

# Service Keys

# Events

# Info

