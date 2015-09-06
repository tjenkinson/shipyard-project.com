# Events
Events provide auditing and information for all actions in Shipyard.

## List Events

```http
GET /api/events HTTP/1.1
X-Access-Token: username:token
```

> Response

```json
[
    {
        "type": "api",
        "container_info": {
            "Id": "",
            "Created": "",
            "Path": "",
            "Name": "",
            "Args": null,
            "ExecIDs": null,
            "Config": null,
            "State": {
                "Running": false,
                "Paused": false,
                "Restarting": false,
                "Pid": 0,
                "ExitCode": 0,
                "StartedAt": "0001-01-01T00:00:00Z",
                "FinishedAt": "0001-01-01T00:00:00Z",
                "Ghost": false
            },
            "Image": "",
            "NetworkSettings": {
                "IpAddress": "",
                "IpPrefixLen": 0,
                "Gateway": "",
                "Bridge": "",
                "Ports": null
            },
            "SysInitPath": "",
            "ResolvConfPath": "",
            "Volumes": null,
            "HostConfig": null
        },
        "time": "2015-06-27T19:04:33Z",
        "message": "/api/accounts",
        "username": "admin",
        "tags": [
            "api",
            "api",
            "get"
        ]
    }
]

```

HTTP Request

`GET /api/events`

## Delete all Events 

```http
DELETE /api/events HTTP/1.1
X-Access-Token: username:token
```

> Response

```http
HTTP/1.1 204 No Content
```

HTTP Request

`DELETE /api/events`

This will delete all events.
