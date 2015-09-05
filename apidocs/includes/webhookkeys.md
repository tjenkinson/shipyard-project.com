# Webhook Keys
This provides management for Webhook Keys.  Webhook keys are used
for deployment using the [Docker Hub](https://hub.docker.com/).

## List Webhook Keys

```http
GET /api/webhookkeys HTTP/1.1
Content-Type: application/json
X-Access-Token: username:token
```

> Response

```json
[
    {
        "id": "cb20156f-0688-4e3c-94a6-a8cc9966d20f",
        "image": "ehazlett/docker-demo",
        "key": "9953f2f31ad8bc05"
    }
]
```

HTTP Request

`GET /api/webhookkeys`

Field | Type | Description
-----|-----|-----
id | string | Internal ID of key
key | string | Service Key
description | string | Description of key

## Create a Webhook Key
```http
POST /api/webhookkeys HTTP/1.1
Content-Type: application/json
X-Access-Token: username:token

{
    "image": "ehazlett/docker-demo"
}
```

> Response

```json
{
    "image": "ehazlett/docker-demo",
    "key": "9953f2f31ad8bc05"
}
```

HTTP Request

`POST /api/webhookkeys`

Field | Type | Description
-----|-----|-----
image | string | Name of the Docker Image to use in the key

## Delete a Webhook Key
```http
DELETE /api/servicekeys/9953f2f31ad8bc05 HTTP/1.1
Content-Type: application/json
X-Access-Token: username:token
```

> Response

```http
HTTP/1.1 204 No Content
```

HTTP Request

`DELETE /api/webhookkeys/(key)`

### Parameters

Name | Description
-----|-----
key | Webhook key

## Deploy using Webhook
```http
POST /hub/webhook HTTP/1.1
Content-Type: application/json

{
    "push_data":{
        "pushed_at":1385141110,
        "images":[
            "imagehash1",
            "imagehash2",
            "imagehash3"
        ],
        "pusher":"username"
    },
    "repository":{
        "status":"Active",
        "description":"my docker repo that does cool things",
        "is_trusted":false,
        "full_description":"This is my full description",
        "repo_url":"https://registry.hub.docker.com/u/username/reponame/",
        "owner":"username",
        "is_official":false,
        "is_private":false,
        "name":"reponame",
        "namespace":"username",
        "star_count":1,
        "comment_count":1,
        "date_created":1370174400,
        "dockerfile":"my full dockerfile is listed here",
        "repo_name":"username/reponame"
    }
}
```

> Response

```http
HTTP/1.1 200 OK
```

HTTP Request

`POST /hub/webhook`

Data is expected to be in the format of the [Docker Hub](https://docs.docker.com/docker-hub/builds/) build payload.

<aside class="notice">
You can also trigger a deploy manually by sending a payload as follows:
</aside>

`
{
    "repository": {
        "repo_name": "ehazlett/docker-demo"
    }
}
`
