# Registries
This provides management for Docker Registries attached to the cluster.

## List Registries

```http
GET /api/registries HTTP/1.1
Content-Type: application/json
X-Access-Token: username:token
```

> Response

```json
[
    {
        "id": "7b4d261c-5ac4-481a-b1fa-1808355becf8",
        "name": "local",
        "addr": "http://127.0.0.1:5000"
    }
]

```

HTTP Request

`GET /api/registries`

## Get a Registry

```http
GET /api/registries/local HTTP/1.1
X-Access-Token: username:token
```

> Response

```json
{
    "id": "7b4d261c-5ac4-481a-b1fa-1808355becf8",
    "name": "local",
    "addr": "http://127.0.0.1:5000"
}
```

HTTP Request

`GET /api/registries/(name)`

### Parameters

Name | Description
-----|-----
name | Name of the Registry

## List Repositories

```http
GET /api/registries/local/repositories HTTP/1.1
X-Access-Token: username:token
```

> Response

```json
[
    {
        "name": "library/registry",
        "namespace": "library",
        "repository": "registry",
        "tags": [
            {
              "ID": "8c2e06607696bd4afb3d03b687e361cc43cf8ec1a4a725bc96e39f05ba97dd55",
              "Name": "latest"
            }
        ],
        "layers": [],
        "size": 2433303
    }
]
```

HTTP Request

`GET /api/registries/(name)/repositories`

### Parameters

Name | Description
-----|-----
name | Name of the Registry

## Get a Repository

```http
GET /api/registries/local/repositories/library/registry HTTP/1.1
X-Access-Token: username:token
```

> Response

```json
{
    "name": "library/registry",
    "namespace": "library",
    "repository": "registry",
    "tags": [
        {
          "ID": "8c2e06607696bd4afb3d03b687e361cc43cf8ec1a4a725bc96e39f05ba97dd55",
          "Name": "latest"
        }
    ],
    "layers": [],
    "size": 2433303
}
```

HTTP Request

`GET /api/registries/(name)/repositories/(repository)`

### Parameters

Name | Description
-----|-----
name | Name of the Registry
repository | Name of the Repository

## Delete a Repository

```http
DELETE /api/registries/local/repositories/library/busybox HTTP/1.1
X-Access-Token: username:token
```

> Response

```http
HTTP/1.1 204 No Content
```

HTTP Request

`DELETE /api/registries/(name)/repositories/(repository)`

Name | Description
-----|-----
name | Name of the Registry
repository | Name of the Repository
