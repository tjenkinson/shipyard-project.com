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
Gets a list of accounts

Request

`GET /api/accounts HTTP/1.1`

Response

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

<a name="post-accounts"></a>
## POST /api/accounts
Create an account

Request

```json
POST /api/accounts HTTP/1.1
Content-Type application/json

{
  "username": "foo",
  "password": "bar",
  "role": {
    "name": "user"
  }
}
```

Response

`HTTP/1.1 204 No Content`

<a name="delete-accounts"></a>
## DELETE /api/accounts
Delete an account

Request

```json
DELETE /api/accounts HTTP/1.1
Content-Type application/json

{
  "username": "foo"
}
```

Response

`HTTP/1.1 204 No Content`

# Roles

<a name="get-roles"></a>
## GET /api/roles
Gets a list of roles

Request

`GET /api/roles HTTP/1.1`

Response

```json
[
  {
    "name": "admin",
    "id": "448ebe2d-89d9-412c-aab9-ad774d1ec78f"
  },
  {
    "name": "user",
    "id": "2243edf5-55f1-43ad-9ebb-c36c5233f007"
  }
]
```

<a name="get-role"></a>
## GET /api/roles/\<username\>
Gets a role

Request

`GET /api/roles/admin HTTP/1.1`

Response

```json
{
  "name": "admin",
  "id": "448ebe2d-89d9-412c-aab9-ad774d1ec78f"
}
```

<a name="post-roles"></a>
## POST /api/roles
Create a role

Request

```json
POST /api/roles HTTP/1.1
Content-Type application/json
{
  "name": "test"
}
```

Response

`HTTP/1.1 204 No Content`

<a name="delete-role"></a>
## DELETE /api/roles
Delete an role

Request

```json
DELETE /api/roles HTTP/1.1
Content-Type application/json

{
  "name": "test"
}
```

Response

`HTTP/1.1 204 No Content`

# Containers

<a name="get-containers"></a>
## GET /api/containers
Get list of containers

Response

```json
GET /api/containers HTTP/1.1

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

<a name="post-containers"></a>
## POST /api/containers
Run a container

Request

```json
POST /api/containers HTTP/1.1
Content-Type application/json

{
  "name": "ehazlett/go-demo",
  "cpus": 0.1,
  "memory": 32,
  "type": "service",
  "hostname": "",
  "domain": "",
  "labels": ["local"],
  "args": [],
  "environment": [],
  "restart_policy": {},
  "bind_ports": [
    {
      "proto": "tcp",
      "container_port": 8080
    },
    {
      "proto": "tcp",
      "port": 80,
      "container_port": 8080
    }
  ],
  "links": {
    "redis": "db"
  }
}
```

Response

`HTTP/1.1 201 Created`

```json
[
  {
    "ports": [
      {
        "container_port": 8080,
        "port": 49172,
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
        "local"
      ],
      "bind_ports": [
        {
          "proto": "tcp",
          "port": 49153,
          "container_port": 8080
        },
        {
          "proto": "tcp",
          "port": 80,
          "container_port": 8080
        }
      ],
      "links": {
        "redis": "db"
      },
      "type": "service",
      "memory": 32,
      "cpus": 0.1,
      "name": "ehazlett/go-demo"
    },
    "id": "4a5da04b8428e7241a9d9993699513d11b89948399dedfa12"
  }
]
```
<a name="get-container"></a>
## GET /api/containers/\<id\>
Inspect a container

Request

`GET /api/containers/3e532b HTTP/1.1`

Response

```json
{
  "ports": [
    {
      "container_port": 8080,
      "port": 49155,
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
      "local"
    ],
    "type": "service",
    "hostname": "demo-1",
    "environment": {
      "GOROOT": "/goroot",
      "GOPATH": "/gopath"
    },
    "memory": 256,
    "cpus": 0.08,
    "name": "ehazlett/go-demo:latest"
  },
  "id": "3e532b000891e90e93ca3781031e7c1ddb76d8378dfdfd3"
}
```

<a name="delete-container"></a>
## DELETE /api/containers/\<id\>
Destroy a container

Request

`DELETE /api/containers/3e532 HTTP/1.1`

Response

`HTTP/1.1 204 No Content`

# Engines

# Service Keys

# Events

# Info

<a name="get-cluster-info"></a>
## GET /api/cluster/info
Gets cluster info

Request

`GET /api/cluster/info HTTP/1.1`

Response

```json
GET /api/cluster/info HTTP/1.1

{
  "reserved_memory": 768,
  "reserved_cpus": 0.24,
  "image_count": 6,
  "engine_count": 1,
  "container_count": 3,
  "memory": 4096,
  "cpus": 4
}
```
