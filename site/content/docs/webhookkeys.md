+++
Categories = []
Description = ""
Tags = []
title = "Webhook Keys"
date = 2014-09-28T03:30:04Z
+++
Webhook keys are used with the Docker Hub.  Webhooks from the Docker Hub notify of new image builds and trigger deployments in Shipyard.

# Workflow

* Docker Hub is notified and builds new Docker image
* Docker Hub sends a webhook notification to Shipyard
* Shipyard checks the webhook key for authorization
* Shipyard pulls latest image from the Docker Hub
* Shipyard stops and removes current containers and deploys new containers

# Using a Webhook Key
To use a webhook key, simply add a webhook in the desired Docker Hub repository to the following URL: `http://<shipyard-url>/hub/webhook/<key>`.  For example: `http://controller.example.com/hub/webhook/010f2af9db29f43a`.

# Examples

## Create a Webhook Key
```bash
shipyard cli> shipyard add-webhook-key --image ehazlett/go-demo
created key: 010f2af9db29f43a
```

## View Webhook Keys
```bash
shipyard cli> shipyard webhook-keys
Image                   Key
ehazlett/go-demo        010f2af9db29f43a
```

## Remove Webhook Key
```bash
shipyard cli> shipyard remove-webhook-key 010f2af9db29f43a
removed 010f2af9db29f43a
```

