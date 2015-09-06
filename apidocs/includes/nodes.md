# Nodes
This returns information on the Swarm nodes in the cluster.

## List Nodes

```http
GET /api/nodes HTTP/1.1
Content-Type: application/json
X-Access-Token: username:token
```

> Response

```json
[
    {
        "name": "node-00",
        "addr": "10.0.1.1:2376",
        "containers": "10",
        "reserved_cpus": "0 / 10",
        "reserved_memory": "0 B / 4.84 GiB",
        "labels": [
            "executiondriver=native-0.2",
            " kernelversion=3.16.0-4-amd64",
            " operatingsystem=Debian GNU/Linux 8 (jessie)",
            " storagedriver=aufs"
        ],
        "response_time": 0
    },
    {
        "name": "node-01",
        "addr": "10.0.1.2:2376",
        "containers": "10",
        "reserved_cpus": "0 / 10",
        "reserved_memory": "0 B / 4.84 GiB",
        "labels": [
            "executiondriver=native-0.2",
            " kernelversion=3.16.0-4-amd64",
            " operatingsystem=Debian GNU/Linux 8 (jessie)",
            " storagedriver=aufs"
        ],
        "response_time": 0
    }
]
```

HTTP Request

`GET /api/nodes`

## Get a Node

```http
GET /api/nodes/node-00 HTTP/1.1
Content-Type: application/json
X-Access-Token: username:token
```

> Response

```json
{
    "name": "node-00",
    "addr": "10.0.1.1:2376",
    "containers": "10",
    "reserved_cpus": "0 / 10",
    "reserved_memory": "0 B / 4.84 GiB",
    "labels": [
        "executiondriver=native-0.2",
        " kernelversion=3.16.0-4-amd64",
        " operatingsystem=Debian GNU/Linux 8 (jessie)",
        " storagedriver=aufs"
    ],
    "response_time": 0
}
```

HTTP Request

`GET /api/nodes/(name)`

### Parameters

Name | Description
-----|-----
name | Name of the node to get
