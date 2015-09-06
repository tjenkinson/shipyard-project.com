# Authentication
To access the Shipyard API, you must be authenticated.  The recommended way is to use service keys however, you can also use authorization tokens.  To create a [Service Key](/docs/servicekeys/).  All requests must have a header including either the service key or authorization token.

## Login

```http
POST /auth/login HTTP/1.1
Content-Type: application/json

{
  "username": "admin",
  "password": "password"
}
```

> Response

```json
{
  "auth_token": "$2a$10$QKbbcXM5pUUXM/0bTwC8re/PU2jB5wqLEyUcRZtHcavjwdfmW/y4W",
  "user_agent":"curl/7.35.0"

}
```

HTTP Request

`POST /auth/login`

This will return an authorization token.  This is not the same as a service key.  Authorization tokens are used for user login.

## Requests

```http
GET /1.17/version HTTP/1.1
Content-Type: application/json
X-Access-Token: username:token
```

> Response Output

```json
{
  "Version": "swarm/0.4.0",
  "APIVersion": "1.17",
  "GoVersion": "go1.4.2",
  "GitCommit": "HEAD",
  "Os": "linux",
  "Arch": "amd64"
}
```

For requests, you must include either an authorization token or service key with the request as a header.

Auth Method | Header | Example
-----|-----|-----
Service Key | `X-Service-Key` | `X-Service-Key:12345`
Auth Token | `X-Access-Token` | `X-Access-Token:admin:$2$34...xxx`

<aside class="notice">
For the examples below, make sure to replace "username" and "token" with your own username and token.
</aside>

<aside class="notice">
To use a service key in the examples, replace "X-Access-Token: username:token" with "X-Service-Key: key".
</aside>
