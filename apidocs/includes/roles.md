# Roles
The Roles API provides management for account roles.

## List Roles

```http
GET /api/roles HTTP/1.1
Content-Type: application/json
X-Access-Token: username:token
```

> Response

```json
[
  {
    "role_name": "admin",
    "description": "Administrator",
    "rules": [
      {
        "path": "*",
        "methods": [
          "*"
        ]
      }
    ]
  },
  {
    "role_name": "containers:ro",
    "description": "Containers Read Only",
    "rules": [
      {
        "path": "/containers",
        "methods": [
          "GET"
        ]
      }
    ]
  }
]
```

HTTP Request

`GET /api/roles`

This will list the roles and access privileges.

Field | Type | Description
-----|-----|-----
role_name | string | Name of Role
description | string | Description of role
rules | list of rule objects | List of rule objects describing the path and allowed methods

## Create a Role

```http
POST /api/roles HTTP/1.1
Content-Type: application/json
X-Access-Token: username:token

{
  "name": "test"
}
```

> Response

```http
HTTP/1.1 204 No Content
```

HTTP Request

`POST /api/roles`

This will create a new Role.  The user data is expected to be posted as JSON content.

Field | Type | Description
-----|-----|-----
name | string | Name of Role

## Delete a Role

```http
DELETE /api/roles HTTP/1.1
Content-Type: application/json
X-Access-Token: username:token

{
  "name": "test"
}
```

> Response

```http
HTTP/1.1 204 No Content
```

HTTP Request

`DELETE /api/roles`

This will delete a role.  The username is expected to be posted as JSON content.

Field | Type | Description
-----|-----|-----
username | string | Username
