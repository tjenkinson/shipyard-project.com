# Accounts
Shipyard provides authentication and access control.  The accounts API enables management around the creation and modification of the accounts.

## List Accounts

```http
GET /api/accounts HTTP/1.1
Content-Type: application/json
X-Access-Token: username:token
```

> Response

```json
[
    {
        "id": "d4a1e6ae-f90d-46bd-abcd-08f9ce1a5bb2",
        "first_name": "Shipyard",
        "last_name": "Admin",
        "username": "admin",
        "password": "$2a$10$fhEE05Gk3t8HIafjJfmChuq53drUlyCHyRv7QtJZ6Rl8szHS54432",
        "roles": [
          "admin"
        ]
    }
]
```

HTTP Request

`GET /api/accounts`

This will list all accounts in Shipyard along with their roles.  

Field | Type | Description
-----|-----|-----
first_name | string | User first name
last_name | string | User last name
username | string | Username
password | string | Encrypted password
roles | list of strings | Roles assigned to user

## Create an Account

```http
POST /api/accounts HTTP/1.1
Content-Type: application/json
X-Access-Token: username:token

{
  "username": "foo",
  "password": "bar",
  "role": {
    "name": "user"
  }
}
```

> Response

```http
HTTP/1.1 204 No Content
```

HTTP Request

`POST /api/accounts`

This will create a new Shipyard account.  The user data is expected to be posted as JSON content.

Field | Type | Description
-----|-----|-----
username | string | Username
password | string | Password
role| Role | Role to assign to user

## Delete an Account

```http
DELETE /api/accounts HTTP/1.1
Content-Type: application/json
X-Access-Token: username:token

{
  "username": "foo"
}
```

> Response

```http
HTTP/1.1 204 No Content
```

HTTP Request

`DELETE /api/accounts`

This will delete an account.  The username is expected to be posted as JSON content.

Field | Type | Description
-----|-----|-----
username | string | Username
