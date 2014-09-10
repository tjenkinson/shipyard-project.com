+++
Categories = []
Description = ""
Tags = []
title = "Service Keys"
date = 2014-09-09T03:30:04Z
+++

Service keys are used for API access.  Service keys have full access to the Shipyard API.

# Examples

## Create a Service Key
```bash
shipyard cli> shipyard add-service-key -d "test key"
created key: Z2uwezQGoaIcfiRSQBRbktrzdbFRWKlVTEry
```

## View Service Keys
```bash
shipyard cli> shipyard service-keys
Key                                     Description
Z2uwezQGoaIcfiRSQBRbktrzdbFRWKlVTEry    test key
```

## Use a Service Key
```bash
curl -s -H 'X-Service-Key: Z2uwezQGoaIcfiRSQBRbktrzdbFRWKlVTEry' http://localhost:8080/api/engines
[
    {
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
        "id": "a08b8518-e963-4eb5-959a-566bd270cd28"
    }
]
```

## Remove Service Key
```bash
shipyard cli> shipyard remove-service-key Z2uwezQGoaIcfiRSQBRbktrzdbFRWKlVTEry
removed Z2uwezQGoaIcfiRSQBRbktrzdbFRWKlVTEry
```

