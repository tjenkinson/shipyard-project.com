# Service Keys
This provides management for Service Keys.

## List Service Keys

```http
GET /api/servicekeys HTTP/1.1
Content-Type: application/json
X-Access-Token: username:token
```

> Response

```json
[
    {
        "key": "jyGFOFLPhG3qE2WrgSuEJe/7zJLpiIaLuyA6",
        "description": "test key"
    }
]
```

HTTP Request

`GET /api/servicekeys`

Field | Type | Description
-----|-----|-----
key | string | Service Key
description | string | Description of key

## Create a Service Key
```http
POST /api/servicekeys HTTP/1.1
Content-Type: application/json
X-Access-Token: username:token

{
    "description": "test key"
}
```

> Response

```json
{
    "key": "jyGFOFLPhG3qE2WrgSuEJe/7zJLpiIaLuyA6",
    "description": "test key"
}
```

HTTP Request

`POST /api/servicekeys`

Field | Type | Description
-----|-----|-----
description | string | Description of the service key

## Delete a Service Key
```http
DELETE /api/servicekeys HTTP/1.1
Content-Type: application/json
X-Access-Token: username:token

{
    "key": "jyGFOFLPhG3qE2WrgSuEJe/7zJLpiIaLuyA6"
}
```

> Response

```http
HTTP/1.1 204 No Content
```

HTTP Request

`DELETE /api/servicekeys`

Field | Type | Description
-----|-----|-----
key | string | Service Key
